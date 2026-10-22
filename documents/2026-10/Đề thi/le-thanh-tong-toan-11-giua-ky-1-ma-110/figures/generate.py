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


def pyramid(midpoints=False):
    s = SVG(330, 290)
    p = {"S": (100, 25), "A": (120, 190), "B": (35, 250), "C": (215, 250), "D": (300, 190)}
    s.path([p[k] for k in ["S", "B", "C"]], fill=ORANGE, close=True)
    s.path([p[k] for k in ["S", "C", "D"]], fill=MINT, close=True)
    edges(s, p, [("S", "A"), ("A", "B"), ("A", "D"), ("A", "C"), ("B", "D")], dash=True)
    edges(s, p, [("S", "B"), ("S", "C"), ("S", "D"), ("B", "C"), ("C", "D")])
    if midpoints:
        p["O"] = mix(p["A"], p["C"], 0.5)
        p["M"] = mix(p["S"], p["A"], 0.5)
        p["N"] = mix(p["S"], p["D"], 0.5)
        p["E"] = mix(p["A"], p["B"], 0.5)
        p["F"] = mix(p["O"], p["N"], 0.58)
        s.path([p[k] for k in ["O", "M", "N"]], color="#B41139", fill="#FF91A455", dash=True, close=True)
        edges(s, p, [("E", "F"), ("O", "E")], color="#B41139", dash=True)
        for k, o in [("O", (-8, 18)), ("M", (-14, 0)), ("N", (13, -5)), ("E", (-13, -5)), ("F", (12, 4))]:
            s.point(p[k], k, o)
    for k, o in [("S", (0, -10)), ("A", (-12, -6)), ("B", (-10, 17)), ("C", (8, 19)), ("D", (13, 3))]:
        s.point(p[k], k, o)
    s.save("pyramid-midpoints" if midpoints else "pyramid")


pyramid()
pyramid(True)

s = SVG(320, 285)
p = {
    "A": (105, 185),
    "B": (40, 245),
    "C": (225, 245),
    "D": (290, 185),
    "A′": (80, 35),
    "B′": (15, 95),
    "C′": (200, 95),
    "D′": (265, 35),
}
for keys, fill in [("B C C′ B′", ORANGE), ("C D D′ C′", PINK), ("A′ B′ C′ D′", MINT)]:
    s.path([p[k] for k in keys.split()], fill=fill, close=True)
edges(s, p, [("A", "B"), ("A", "D"), ("A", "A′")], dash=True)
for k in p:
    s.point(p[k], k, (10, 19) if k == "A" else (14, 8) if k == "D" else (-9, 18) if k in ["B", "C"] else (0, -10))
s.save("box")

s = SVG(300, 320)
p = {"A": (140, 25), "B": (30, 215), "C": (110, 285), "D": (270, 215)}
p["M"] = mix(p["B"], p["C"], 0.5)
p["N"] = mix(p["B"], p["D"], 0.5)
p["I"] = mix(p["A"], p["M"], 2 / 3)
p["J"] = mix(p["A"], p["N"], 2 / 3)
s.path([p[k] for k in ["A", "B", "C"]], fill=ORANGE, close=True)
s.path([p[k] for k in ["A", "C", "D"]], fill=MINT, close=True)
s.path([p[k] for k in ["A", "M", "N"]], fill="#BFFF3699", color="#17623E", dash=True, close=True)
edges(s, p, [("B", "D")], dash=True)
edges(s, p, [("A", "M")], color="#B41139")
for k, o in [
    ("A", (0, -10)),
    ("B", (-12, 3)),
    ("C", (0, 20)),
    ("D", (12, 3)),
    ("M", (-13, 8)),
    ("N", (10, 17)),
    ("I", (-13, -3)),
    ("J", (13, -3)),
]:
    s.point(p[k], k, o)
s.save("tetrahedron")

s = SVG(280, 310)
p = {"S": (110, 25), "A": (30, 225), "B": (105, 280), "C": (255, 225)}
for k, t in [("M", "A"), ("N", "B"), ("P", "C")]:
    p[k] = mix(p["S"], p[t], 2 / 3)
s.path([p[k] for k in ["S", "A", "B"]], fill=MINT, color="#202020", close=True)
s.path([p[k] for k in ["S", "B", "C"]], fill=ORANGE, color="#202020", close=True)
s.path([p[k] for k in ["M", "N", "P"]], color="none", fill="#C7A0EF", close=True)
edges(s, p, [("M", "N"), ("N", "P")], color="#202020")
edges(s, p, [("A", "C")], color="#202020", dash=True)
edges(s, p, [("M", "P")], color="#202020", dash=True)
edges(s, p, [("S", "B")], color="#202020")
for k, o in [
    ("S", (0, -10)),
    ("A", (-12, 4)),
    ("B", (0, 20)),
    ("C", (12, 4)),
    ("M", (-13, -4)),
    ("N", (-12, 12)),
    ("P", (13, -3)),
]:
    s.point(p[k], k, o)
s.save("section")

s = SVG(310, 335)
p = {"A": (35, 245), "B": (160, 305), "C": (270, 245), "A′": (65, 30), "B′": (190, 90), "C′": (300, 30)}
p["H"] = mix(p["A"], p["B"], 1 / 3)
p["G"] = ((p["A"][0] + p["A′"][0] + p["C′"][0]) / 3, (p["A"][1] + p["A′"][1] + p["C′"][1]) / 3)
s.path([p[k] for k in ["A", "B", "B′", "A′"]], fill="#BFFF36", close=True)
s.path([p[k] for k in ["B", "C", "C′", "B′"]], fill="#CFFF70", close=True)
s.path([p[k] for k in ["A′", "B′", "C′"]], fill=PINK, close=True)
edges(s, p, [("A", "C"), ("A", "C′"), ("A′", "C"), ("G", "H")], color="#B41139", dash=True)
for k in p:
    s.point(
        p[k],
        k,
        (14, -6) if k == "G" else (-12, -6) if k in ["A", "A′"] else ((0, 20) if k in ["B", "C", "H"] else (0, -10)),
    )
s.save("prism")

s = SVG(440, 310)
tank_edge_width = 2.4
p = {"A": (60, 270), "B": (280, 270), "C": (375, 190), "D": (155, 190)}
for k in "ABCD":
    p[k + "′"] = (p[k][0], p[k][1] - 165)
for k, t in zip("IJKL", "ABCD", strict=True):
    p[k] = mix(p[t], p[t + "′"], 0.6)
# Four walls are orange; rear walls are painted before the foreground walls and water.
s.path([p[k] for k in ["A′", "D′", "L", "I"]], fill=ORANGE, color="none", close=True)
s.path([p[k] for k in ["D′", "C′", "K", "L"]], fill="#FFD18A", color="none", close=True)
s.path([p[k] for k in ["A", "B", "B′", "A′"]], fill=ORANGE, color="none", close=True)
s.path([p[k] for k in ["B", "C", "C′", "B′"]], fill="#FFD18A", color="none", close=True)
s.path([p[k] for k in ["A", "B", "J", "I"]], fill=CYAN, color="none", close=True)
s.path([p[k] for k in ["B", "C", "K", "J"]], fill=CYAN, color="none", close=True)
s.path([p[k] for k in ["I", "J", "K", "L"]], fill=CYAN, color="none", close=True)
edges(
    s,
    p,
    [
        ("A", "B"),
        ("A", "A′"),
        ("A′", "B′"),
        ("B′", "B"),
        ("B", "C"),
        ("C", "C′"),
        ("B′", "C′"),
        ("C′", "D′"),
        ("D′", "A′"),
    ],
    color="#C45A00",
    width=tank_edge_width,
)
edges(s, p, [("D", "D′"), ("A", "D"), ("D", "C")], color="#A32342", dash=True, width=tank_edge_width)
edges(s, p, [("I", "J"), ("J", "K")], color=BLUE, width=tank_edge_width)
edges(s, p, [("I", "L"), ("L", "K")], color=BLUE, dash=True, width=tank_edge_width)
# The mouth has a raised rim; M is on its near edge, not floating in the opening.
p["M"] = (222, 66)
p["O"] = (260, 231)
p["N"] = mix(p["O"], p["M"], 0.6)
s.path([(195, 66), (230, 38), (270, 38), (235, 66)], fill="white", color="#C45A00", width=tank_edge_width, close=True)
end = mix(p["M"], p["O"], -0.26)
s.path([end, p["M"]], color="#C45A00", width=3.8)
s.path([p["M"], p["O"]], color="#7B3F00", width=3, dash=True)
for x, y in [(172, 138), (208, 157), (287, 133), (112, 226), (183, 247), (312, 212)]:
    s.parts.append(f'<path d="M {x} {y} q 6 -4 12 0 t 12 0" fill="none" stroke="{BLUE}" stroke-width="1.5"/>')
# Draw the front vertical edge last so water lines cannot soften it.
edges(s, p, [("B′", "B")], color="#C45A00", width=tank_edge_width)
for k, o in [
    ("A", (-8, 19)),
    ("B", (4, 19)),
    ("C", (14, 5)),
    ("D", (-13, -9)),
    ("A′", (-10, -10)),
    ("B′", (12, 15)),
    ("C′", (10, -8)),
    ("D′", (-9, -9)),
    ("I", (-14, 4)),
    ("J", (14, 5)),
    ("K", (12, 4)),
    ("L", (-13, -7)),
    ("M", (-16, 14)),
    ("N", (-16, 0)),
    ("O", (-13, 11)),
]:
    s.point(p[k], k, o)
s.text((30, 190), "4 m", italic=False)
s.text((261, 99), "2 m", italic=False)
s.text((220, 220), "3 m", italic=False)
s.save("tank")

s = SVG(620, 240)
for n, cx in [(1, 75), (2, 260), (3, 485)]:
    r = 24
    for q in range(-n + 1, n):
        for t in range(-n + 1, n):
            ring = max(abs(q), abs(t), abs(-q - t))
            if ring >= n:
                continue
            x = cx + 1.5 * r * q
            y = 135 + math.sqrt(3) * r * (t + q / 2)
            pts = [(x + r * math.cos(k * math.pi / 3), y + r * math.sin(k * math.pi / 3)) for k in range(6)]
            s.path(pts, fill=[ORANGE, "#FFD18A", MINT][ring], close=True, width=1.6)
    s.text((cx, 25), f"n = {n}", size=20)
s.save("honeycomb")

s = SVG(460, 220)
s.path([(80, 18), (380, 18), (365, 42), (95, 42)], fill=ORANGE, close=True)
s.text((230, 35), "SÂN KHẤU", size=14, italic=False)
# Four consecutive rows: 15, 18, 21, 24 seats, exactly three more per row.
for row, count in enumerate([15, 18, 21, 24]):
    for j in range(count):
        x = 230 + (j - (count - 1) / 2) * 17
        y = 62 + row * 30
        s.parts.append(
            f'<rect x="{x - 6}" y="{y}" width="12" height="17" rx="3" fill="{[PINK, ORANGE, MINT, "#BFFF36"][row]}" stroke="{BROWN}" stroke-width="1.3"/>'
        )
s.text((230, 205), "Minh họa bốn hàng ghế đầu tiên", size=15, italic=False)
s.save("theater")

# Detailed Ferris wheel with double rim, lattice spokes, glazed gondolas and boarding deck.
s = SVG(350, 350)
c = (175, 148)
r = 113
s.parts.append(
    '<defs><linearGradient id="cabin" x2="0" y2="1"><stop stop-color="#FFE6A3"/><stop offset="1" stop-color="#F4AD58"/></linearGradient></defs>'
)
s.path([(100, 305), c, (250, 305)], color="#83502F", width=8)
s.path([(116, 270), (233, 270), (132, 235), (218, 235)], color="#C0864C", width=2)
for radius in [r, r - 9]:
    s.circle(c, radius, "none", BLUE, 2.6)
for k in range(16):
    a = k * math.pi / 8
    p0 = (c[0] + r * math.cos(a), c[1] + r * math.sin(a))
    for da in [-0.12, 0.12]:
        hub = (c[0] + 17 * math.cos(a + da), c[1] + 17 * math.sin(a + da))
        rim = (c[0] + (r - 9) * math.cos(a + da), c[1] + (r - 9) * math.sin(a + da))
        s.path([hub, rim], color="#4D9DBB", width=1.1)
    s.circle(p0, 2.5, ORANGE, BROWN, 0.8)
    s.path([p0, (p0[0], p0[1] + 8)], color=BROWN, width=1.4)
    x, y = p0[0] - 11, p0[1] + 7
    fill = ["url(#cabin)", PINK, MINT, CYAN][k % 4]
    s.parts.append(
        f'<rect x="{x}" y="{y}" width="22" height="23" rx="6" fill="{fill}" stroke="{BROWN}" stroke-width="1.4"/>'
    )
    s.parts.append(
        f'<rect x="{x + 3}" y="{y + 3}" width="16" height="10" rx="3" fill="#EDF9FF" stroke="#5497B1" stroke-width=".8"/>'
    )
    s.path([(x + 11, y + 3), (x + 11, y + 13)], color="#5497B1", width=0.8)
    s.path([(x + 3, y + 18), (x + 19, y + 18)], color=BROWN, width=0.8)
s.circle(c, 17, ORANGE, BLUE, 2)
s.circle(c, 7, "#F4AD58", BROWN, 1.5)
s.path([(80, 310), (270, 310), (285, 320), (65, 320)], fill=ORANGE, close=True)
for x in range(70, 281, 14):
    s.path([(x, 301), (x, 319)], color=BROWN, width=1)
s.path([(67, 301), (283, 301)], color=BROWN, width=1.5)
s.path([(25, 322), (325, 322)], color="#17623E", width=2)
s.text((175, 344), "Vòng quay Ferris", italic=False)
s.save("ferris")
