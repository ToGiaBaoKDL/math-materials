"""Reproducible vector illustrations; affine points preserve the stated incidences."""

import math
from html import escape
from pathlib import Path

OUT = Path(__file__).parent
ORANGE, BROWN, CYAN, BLUE, PINK, MINT = "#FFE6A3", "#7B3F00", "#55DCE5", "#0077C8", "#FF91A4", "#B5E9DE"


class SVG:
    def __init__(self, w, h):
        self.w, self.h = w, h
        self.parts = []

    def path(self, pts, color=BROWN, fill="none", dash=False, width=1.8, close=False):
        points = " ".join(f"{x:.3f},{y:.3f}" for x, y in pts)
        tag = "polygon" if close else "polyline"
        self.parts.append(
            f'<{tag} points="{points}" fill="{fill}" stroke="{color}" stroke-width="{width}" stroke-linejoin="round" stroke-linecap="round"'
            + (' stroke-dasharray="4 4"' if dash else "")
            + "/>"
        )

    def circle(self, p, r, fill="white", color=BROWN, width=1.8):
        self.parts.append(
            f'<circle cx="{p[0]}" cy="{p[1]}" r="{r}" fill="{fill}" stroke="{color}" stroke-width="{width}"/>'
        )

    def text(self, p, t, size=16, color="#202020", italic=True, anchor="middle"):
        if "⃗" in t:
            base, suffix = t.split("⃗", 1)
            self.text(p, base, size=size, color=color, italic=italic, anchor=anchor)
            if suffix:
                self.text(
                    (p[0] + size * 0.55, p[1] + (-size * 0.5 if suffix == "′" else size * 0.25)),
                    suffix,
                    size=size * 0.65,
                    color=color,
                )
            self.path([(p[0] - size * 0.35, p[1] - size), (p[0] + size * 0.35, p[1] - size)], color=color, width=0.9)
            self.path(
                [
                    (p[0] + size * 0.1, p[1] - size - 2),
                    (p[0] + size * 0.35, p[1] - size),
                    (p[0] + size * 0.1, p[1] - size + 2),
                ],
                color=color,
                width=0.9,
            )
            return
        self.parts.append(
            f'<text x="{p[0]}" y="{p[1]}" text-anchor="{anchor}" font-family="Times New Roman" font-size="{size}" font-style="{"italic" if italic else "normal"}" fill="{color}">{escape(t)}</text>'
        )

    def point(self, p, t, offset=(0, -10)):
        self.circle(p, 2.5, BLUE, BLUE, 0)
        self.text((p[0] + offset[0], p[1] + offset[1]), t)

    def save(self, name):
        (OUT / f"{name}.svg").write_text(
            f'<svg xmlns="http://www.w3.org/2000/svg" width="{self.w}" height="{self.h}" viewBox="0 0 {self.w} {self.h}">'
            + "".join(self.parts)
            + "</svg>"
        )


def mix(a, b, t):
    return (a[0] * (1 - t) + b[0] * t, a[1] * (1 - t) + b[1] * t)


def edges(s, pts, pairs, **kwargs):
    for a, b in pairs:
        s.path([pts[a], pts[b]], **kwargs)


def arrow(s, a, b, color=BLUE, width=2.1):
    s.path([a, b], color=color, width=width)
    dx, dy = b[0] - a[0], b[1] - a[1]
    length = math.hypot(dx, dy)
    ux, uy = dx / length, dy / length
    s.path(
        [b, (b[0] - 8 * ux + 3 * uy, b[1] - 8 * uy - 3 * ux), (b[0] - 8 * ux - 3 * uy, b[1] - 8 * uy + 3 * ux)],
        color=color,
        fill=color,
        close=True,
        width=0.8,
    )


def arc(s, c, r, a, b, color=BROWN):
    pts = [(c[0] + r * math.cos(a + (b - a) * i / 32), c[1] + r * math.sin(a + (b - a) * i / 32)) for i in range(33)]
    s.path(pts, color=color, width=1.6)


def plane_corner(s, vertex, edge1, edge2, label, radius=45):
    a = math.atan2(edge1[1] - vertex[1], edge1[0] - vertex[0])
    b = math.atan2(edge2[1] - vertex[1], edge2[0] - vertex[0])
    span = (b - a + math.pi) % (2 * math.pi) - math.pi
    arc(s, vertex, radius, a, a + span)
    mid = a + span / 2
    s.text((vertex[0] + radius * 0.60 * math.cos(mid), vertex[1] + radius * 0.60 * math.sin(mid) + 5), label, size=15)


s = SVG(340, 190)
s.path([(22, 145), (315, 38)], color=BLUE, width=2.3)
s.path([(30, 30), (310, 165)], color="#C45A00", width=2.3)
# Intersection of the two supporting lines.
crossing = (162.9, 93.55)
arrow(s, (198, 80), (245, 63), BLUE)
arrow(s, (204, 114), (251, 136), "#C45A00")
s.text((276, 39), "d")
s.text((294, 178), "Δ")
s.text((222, 53), "u⃗d", size=17)
s.text((219, 147), "u⃗Δ", size=17)
arc(s, crossing, 34, -0.35, 0.45)
s.text((205, 101), "φ", color=BROWN, size=18)
s.save("line-angle")

s = SVG(370, 255)
plane = [(30, 217), (290, 217), (345, 135), (85, 135)]
s.path(plane, fill=ORANGE, close=True)
intersection, H, A = (130, 188), (235, 188), (235, 53)
top = (267, 12)
# Only the part underneath the finite plane patch is hidden.
exit_point = mix(intersection, top, -29 / 176)
s.path([mix(intersection, top, -0.29), exit_point], color=BLUE, width=2.3)
s.path([exit_point, intersection], color=BLUE, dash=True, width=2.3)
s.path([intersection, top], color=BLUE, width=2.3)
s.path([intersection, (280, 188)], color="#252525", width=2.3)
arrow(s, H, A, "#B41139", 2.3)
arrow(s, mix(intersection, top, 0.38), mix(intersection, top, 0.62), BLUE, 2.7)
s.path([(223, 188), (223, 176), (235, 176)], color="#252525", width=1.5)
arc(s, intersection, 28, math.atan2(-176, 137), 0)
s.text((166, 178), "φ", size=18)
s.point(intersection, "I", (-14, 5))
s.text((280, 29), "d")
s.text((182, 92), "u⃗", size=18)
s.text((251, 111), "n⃗", size=18)
s.text((62, 207), "(P)")
arc(s, plane[0], 48, -0.98, 0)
s.save("line-plane")

# Oblique hinge distinguishes the two faces; normal Q has its own color.
s = SVG(390, 302)
left, right = (40, 164), (286, 195)
front_left, front_right = (105, 255), (351, 286)
q_left, q_right = (19, 43), (265, 74)
s.path([left, right, front_right, front_left], fill=MINT, close=True)
s.path([left, right, q_right, q_left], fill="#FFB3C0", close=True)
s.path([left, right], color="#B41139", width=2.7)
base = mix(left, right, 0.52)
# Choose a view where the normal is also perpendicular to the hinge on screen.
normal_tip = (base[0] + 20, base[1] - 158.71)
arrow(s, base, normal_tip, BLUE, 2.5)
hinge_unit = (246 / math.hypot(246, 31), 31 / math.hypot(246, 31))
normal_unit = (hinge_unit[1], -hinge_unit[0])
s.path(
    [
        (base[0] + 12 * hinge_unit[0], base[1] + 12 * hinge_unit[1]),
        (base[0] + 12 * (hinge_unit[0] + normal_unit[0]), base[1] + 12 * (hinge_unit[1] + normal_unit[1])),
        (base[0] + 12 * normal_unit[0], base[1] + 12 * normal_unit[1]),
    ],
    color=BLUE,
    width=1.4,
)
arrow(s, base, (294, 106), "#7227B5", 2.5)
arc(s, base, 36, math.atan2(-158.71, 20), math.atan2(106 - base[1], 294 - base[0]))
s.text((base[0] + 18, base[1] - 45), "φ", size=18)
s.text((normal_tip[0] - 18, normal_tip[1] + 5), "n⃗P", color=BLUE)
s.text((315, 106), "n⃗Q", color="#7227B5")
s.path([base, (base[0] + 39, base[1] + 54.6)], color="#17623E", width=2)
s.path([base, (base[0] - 12.6, base[1] - 72.6)], color=BROWN, width=2)
plane_corner(s, front_left, left, front_right, "(P)", 48)
plane_corner(s, q_left, left, q_right, "(Q)", 48)
s.circle(base, 2.8, "#B41139", "#B41139", 0)
s.save("plane-angle")

s = SVG(330, 205)
M = (95, 30)
H = (95, 155)
A = (235, 155)
s.path([(20, 155), (307, 155)], color=BLUE, width=2.2)
s.path([M, H], color="#B41139", width=2.4)
s.path([M, A], color=BROWN, width=1.8)
s.path([(95, 142), (108, 142), (108, 155)], color=BROWN, width=1.3)
arrow(s, (250, 155), (290, 155), BLUE)
for p, t, o in [(M, "M", (-10, -12)), (H, "H", (-1, 23)), (A, "A", (0, 23))]:
    s.point(p, t, o)
s.text((310, 144), "Δ")
s.text((273, 141), "u⃗Δ")
s.save("point-line")

s = SVG(370, 235)
s.path([(20, 73), (315, 73)], color=BLUE, width=2.3)
s.path([(75, 210), (335, 138)], color="#C45A00", width=2.3)
s.path([(190, 73), (190, 178)], color="#B41139", dash=True, width=2.1)
s.path([(190, 84), (202, 84), (202, 73)], color=BROWN, width=1.3)
s.path([(190, 165), (203, 161), (203, 174)], color=BROWN, width=1.3)
arrow(s, (246, 73), (291, 73), BLUE)
arrow(s, (266, 157), (309, 145), "#C45A00")
s.point((95, 73), "M", (0, -13))
s.point((125, 196), "M′", (-10, 23))
s.path([(95, 73), (125, 196)], color="#17623E", dash=True)
s.text((322, 67), "d")
s.text((342, 146), "d′")
s.text((267, 57), "u⃗")
s.text((282, 183), "u⃗′")
s.save("skew-lines")

s = SVG(330, 320)
c = (166, 168)
r = 126
s.circle(c, r, "#FFE6A3", BROWN, 2)
# A tilted chord with an exact perpendicular foot H and endpoints on the sphere.
u = (math.cos(-0.23), math.sin(-0.23))
v = (-u[1], u[0])
H = (c[0] - 58 * v[0], c[1] - 58 * v[1])
half = math.sqrt(r * r - 58 * 58)
A = (H[0] - half * u[0], H[1] - half * u[1])
B = (H[0] + half * u[0], H[1] + half * u[1])
s.path([mix(A, B, -0.13), A], color=BLUE, width=2.2)
s.path([A, B], color=BLUE, width=2.2, dash=True)
s.path([B, mix(A, B, 1.13)], color=BLUE, width=2.2)
s.path([c, H], color="#B41139", width=2, dash=True)
s.path([c, B], color="#B41139", width=2, dash=True)
s.path(
    [
        (H[0] + 11 * v[0], H[1] + 11 * v[1]),
        (H[0] + 11 * (u[0] + v[0]), H[1] + 11 * (u[1] + v[1])),
        (H[0] + 11 * u[0], H[1] + 11 * u[1]),
    ],
    color=BROWN,
    width=1.4,
)
# Great circle is an illustrative equatorial ellipse, with far arc hidden.
for start, end, dash in [(math.pi, 2 * math.pi, True), (0, math.pi, False)]:
    pts = [
        (c[0] + r * math.cos(start + (end - start) * i / 64), c[1] + 34 * math.sin(start + (end - start) * i / 64))
        for i in range(65)
    ]
    s.path(pts, color="#C45A00", dash=dash, width=1.6)
for p, t, o in [(A, "A", (-9, -10)), (B, "B", (10, -10)), (H, "H", (-13, -11)), (c, "I", (-9, 21))]:
    s.point(p, t, o)
s.text((229, 112), "R", color="#B41139")
s.text((302, 63), "d")
s.save("sphere-chord")

for homework in [False, True]:
    s = SVG(375, 260)
    P = [(25, 165), (295, 165), (352, 230), (82, 230)]
    s.path(P, fill="#D5FF62", close=True)
    A = (176, 54)
    H = (176, 205)
    intersection = (290, 205)
    s.path([A, H], color="#B41139", width=2.2)
    s.path([mix(A, intersection, -0.27), intersection], color="#DE6500", width=2.5)
    boundary = mix(A, intersection, 1 + 25 / 151)
    s.path([intersection, boundary], color="#DE6500", width=2.5, dash=True)
    s.path([boundary, mix(A, intersection, 1.28)], color="#DE6500", width=2.5)
    s.path([H, intersection], color=BROWN, width=1.8)
    s.path([(176, 193), (188, 193), (188, 205)], color=BROWN, width=1.3)
    arc(s, intersection, 26, math.atan2(A[1] - intersection[1], A[0] - intersection[0]), -math.pi)
    for p, t, o in [
        (A, "A" if homework else "M", (14, -6)),
        (H, "H", (-8, 23)),
        (intersection, "M" if homework else "I", (16, 3)),
    ]:
        s.point(p, t, o)
    s.text((134, 38), "d", color="#DE6500")
    s.text((92, 220), "(α)" if homework else "(P)")
    s.save("distance-plane-homework" if homework else "distance-plane")

s = SVG(390, 300)


# P:z=0, d:y=z=0; A=(0,2,3), H=(0,2,0), K=(0,0,0).
# This view separates the foot H on P from the upright half-plane Q.
def project(x, y, z):
    return (85 + 57 * x + 23 * y, 180 + 25 * y - 54 * z)


K, intersection = project(0, 0, 0), project(3, 0, 0)
H, A = project(0, 2, 0), project(0, 2, 3)
s.path([project(-0.7, 0, 0), project(3.8, 0, 0), project(3.8, 3.3, 0), project(-0.7, 3.3, 0)], fill=MINT, close=True)
s.path(
    [project(-0.7, 0, 0), project(3.8, 0, 0), project(3.8, 2.6, 3.9), project(-0.7, 2.6, 3.9)],
    fill="#FFB3C0",
    close=True,
)
s.path([project(-0.7, 0, 0), project(3.8, 0, 0)], color="#B41139", width=2.5)
s.path([K, A], color=BROWN, width=2.3)
s.path([K, H], color=BROWN, width=2.1)
s.path([A, H], color=BLUE, width=2.1, dash=True)
s.path([intersection, mix(intersection, A, 1.12)], color=BLUE, width=2.5)
s.path([mix(intersection, A, -0.34), intersection], color=BLUE, width=2.5, dash=True)
s.path([project(0.2, 2, 0), project(0.2, 2, 0.2), project(0, 2, 0.2)], color=BROWN, width=1.4)
s.path([project(0.2, 0, 0), project(0.2, 0.3, 0), project(0, 0.3, 0)], color=BROWN, width=1.4)
arc(s, K, 23, math.atan2(A[1] - K[1], A[0] - K[0]), math.atan2(H[1] - K[1], H[0] - K[0]))
for point, t, o in [(A, "A", (-20, 8)), (H, "H", (15, 14)), (intersection, "I", (3, -13)), (K, "K", (-14, 17))]:
    s.point(point, t, o)
plane_corner(s, project(3.8, 3.3, 0), project(-0.7, 3.3, 0), project(3.8, 0, 0), "(P)", 49)
plane_corner(s, project(3.8, 2.6, 3.9), project(-0.7, 2.6, 3.9), project(3.8, 0, 0), "(Q)", 49)
s.text((221, 126), "Δ")
s.text((315, 176), "d")
s.save("minimum-angle")
