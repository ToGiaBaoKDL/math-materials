#import "models.typ": *
#set page(width:auto,height:auto,margin:0pt)
#set text(font:"Times New Roman",size:11pt)
#show math.equation: set text(font:"New Computer Modern Math")
#let figures=(
"flight-departure":flight(),
"flight-airport":flight(kind:"airport"),
"cable":cable(),
"roof-house":roof-house(),
"roof-house-solution":roof-house(solution:true),
"shifted-warehouse":shifted-warehouse(),
"shifted-warehouse-solution":shifted-warehouse(solution:true),
"motion-half":motion(),
"motion-full":motion(last:"D",ratio:1),
"room-simple":room(),
"room-simple-solution":room(solution:true),
"room-hanging":room(kind:"hanging"),
"warehouse-coordinates":warehouse(),
"warehouse":warehouse(kind:"roof"),
"warehouse-solution":warehouse(kind:"roof",solution:true),
"cabin":cabin(),
"hanging-ball":hanging-ball(),
"hanging-ball-solution":hanging-ball(solution:true),
"balloon":balloon(),
"drones":drones(),
"velocity":velocity(),
)
#figures.at(sys.inputs.at("figure"))
