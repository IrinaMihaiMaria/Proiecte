turtles-own [
  covid?
  precaution?
 ]

breed [infected infection]
breed [people person]
breed [compliant compliance]

to setup
  clear-all

  create-infected positive
  ask infected [
    set shape "person"
    set color orange
    setxy random-xcor random-ycor
    set covid? true
    set precaution? false
  ]

  create-people unprotected
  ask people [
    set shape "person"
    set color grey
    setxy random-xcor random-ycor
    set covid? false
    set precaution? false
  ]

 create-compliant protected
  ask compliant [
    set shape "person"
    set color blue
    setxy random-xcor random-ycor
    set covid? false
    set precaution? true
  ]

  reset-ticks
end

to go
  ask turtles [
    ifelse movement? [ rt random 360 ] [ lt random 360 ] fd 1

    let unsocially-distanced count other turtles with [ covid? ] in-radius 1.99
    if unsocially-distanced > 0 [
      set covid? true
      ]
    if covid? [
      set color orange
    ]

    if any? other turtles with [ precaution? ] in-radius 1.99 [
      set covid? false
    ]
    if precaution? [
      set color blue
    ]
  ]
  if not any? turtles with [ color = grey ] [
      stop
    ]

  tick
end

to-report movement?
  report 2 = 0
end
@#$#@#$#@
GRAPHICS-WINDOW
253
21
690
459
-1
-1
13.0
1
10
1
1
1
0
1
1
1
-16
16
-16
16
0
0
1
ticks
30.0

BUTTON
7
116
70
149
setup
setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
144
116
207
149
go
go
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

MONITOR
7
200
81
245
No. Infected
count turtles with [ color = orange ]
0
1
11

PLOT
7
296
221
481
Spread Graph
Days
Percent Infected
0.0
365.0
0.0
100.0
true
false
"" ""
PENS
"default" 1.0 0 -16777216 true "" "plot ( ( count turtles with [ color = orange ] ) / ( count turtles) ) * 100"

BUTTON
74
116
138
149
move
go
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SLIDER
7
45
179
78
Unprotected
Unprotected
1
50
25.0
1
1
NIL
HORIZONTAL

MONITOR
85
200
154
245
% Infected
( ( count turtles with [ color = orange ] ) / ( count turtles ) ) * 100
1
1
11

MONITOR
158
200
215
245
Days
ticks
0
1
11

SLIDER
7
80
179
113
Protected
Protected
0
45
4.0
1
1
NIL
HORIZONTAL

SLIDER
7
10
179
43
Positive
Positive
1
5
1.0
1
1
NIL
HORIZONTAL

MONITOR
7
152
78
197
Population
count turtles
0
1
11

MONITOR
106
248
195
293
% Uninfected
( ( count turtles with [ color = blue ] ) / ( count turtles ) ) * 100
1
1
11

MONITOR
7
248
103
293
No. Uninfected
count turtles with [ color = blue ]
0
1
11

@#$#@#$#@
## WHAT IS IT?

This model simulates the transmission and prevention of the coronavirus (COVID-19) among humans interfacing in a small community.

The World Health Organization ([WHO], 2020) reports that the coronavirus is transmittable over a significantly short distance through imperceptible respiratory secretions expelled when an infected person coughs, sneezes, talks or sings, thus, causing possible infection in a susceptible person when the droplets reach their mouth, nose or eyes. This makes close contact with an infected person the primary mode of transmission among people interfacing in a community (WHO, 2021). In the light of that, McIntosh (2020) posits that, practising social distancing by maintaining six feet (two metres) distance when not staying home, and assiduously washing hands, especially after touching surfaces in public places, observing good respiratory hygiene, including wearing face coverings, avoiding touching ones face, eyes, nose, and mouth especially, and keeping often touched surfaces clean and disinfected, are preventive measures that play significant roles in preventing the spread of the virus.

## HOW IT WORKS

The model initializes with 30 persons of three breeds, with one COVID-19 positive person from one breed named INFECTED, and identified by the colour orange, 25 unprotected persons from another breed named PEOPLE, and identified by the colour grey,  and 4 protected persons from the COMPLIANT breed, identified by the colour blue. The persons move about their community in a random manner, and anyone within 1.99 metres range from an infected person, and who also is not protected contracts the infection and turns orange. 1.99 is the susceptibility range as McIntosh (2020) and other scholarly studies recommend two metres social distance for safety, and the susceptibility range has been represented as 1.99 radius in the model. In the model also, only the PEOPLE breed has been represented as vulnerable as they are the unprotected group who do not abide by safety measures, therefore, the COMPLIANT breed is protected and not prone to contracting the infection even when they are in 1.99 radius of an infected person, as the model assumes they follow all safety precautions to the letter and never go wrong, hence, stand a lean or no chance of getting infected. When all unprotected persons are infected, the modelling stops automatically and the ticks stop counting, meaning that there is no vulnerable person left to be infected.

Summarily, the model explains the risk of not taking safety measures, and the importance of abiding by safety precautions as Bielecki, Züst, Siegrist, Meyerhofer, Crameri, Stanga..., Deuel (2020) show in their research that social distancing and stringent hygiene effectively reduce transmission and the infectivity of the coronavirus. This claim is buttresed by Gosak, Kraemer, Nax, Perc and Pradelski (2021) who assert that if safety pracautions are diligently adhered to, the epidemic curve flattens.

## HOW TO USE IT

Each ‘tick’ portrays one day in the model’s time scale. 

The POSITIVE slider sets the number of persons who are pre-infected before the start of the simulation. While the default value is set to one infected person, the number can be changed in an increment of one, up to a maximum of five infected persons. One is the minimum value because the model tries to simulate the transmission of a viral infection among humans, and at least, one person must be infected before there can be a transmission. Likewise, five is set as the maximum because with just one infected person, the entire community can get infected, however, to determine if the virus spreads faster with more infected people, the model, through the POSITIVE slider allows for an increment in the number of infected persons to show any influence in spread, and five infected persons can model that as the total population of persons in the model is 100.

The UNPROTECTED slider sets the number of persons who can contract the virus because they do not take precautionary measures hence, when in defined proximity (1.99 radius) to an infected person, they get infected and become carriers of the virus and agents of transmission. The default slider value is 25 persons, however, the minimum is one person, while the maximum is 50 persons with an increment of one. The minimum is set to one because the model tries to show transmission of the coronavirus, and it takes at least, one susceptible person to model transmission. Likewise, the maximum is set to 50 because modelling transmission and prevention in a small community is the goal of the model, hence, 50 susceptible persons could simulate a small community, for example, a workplace, a street, a place of worship, a library, among others.

The PROTECTED slider sets the number of persons not prone to contracting the virus because they religiously abide by all safety measures, and are assumed to never go wrong with the practice. The default value is set to four persons, the minimum, zero, and the maximum, 45, with an increment of one. Zero is set as the minimum value because in a real-life scenario in certain communities, there is a likelihood that nobody takes heed for some reasons, be it cultural, religious, political, economic, etc. Also, the slider maximum is set to 45 to depict the impact in transmission and prevention when nearly the entire population takes heed and diligently abide by all safety precautions.

The SETUP button triggers the community (NetLogo WORLD) to be populated with the appropriate number of persons set on the sliders. It also resets the values of the output monitors – POPULATION, number infected (NO. INFECTED), percent infected (% INFECTED), DAYS, number uninfected (NO. UNINFECTED), and percent uninfected (% UNINFECTED) – and plot (SPREAD GRAPH) to their proportionate values in relation to the sliders’ values.

On the one hand, the GO button starts the simulation and the monitors’ displays. On the other hand, the MOVE button has the same function as the GO button but differs in the simulation process automation. While the GO button makes the simulation process run automatically (NetLogo FOREVER) until a `STOP` command is reached and executed, the MOVE button does not automate the process, rather, it executes the process per click. The MOVE button helps one study the activities going on in the WORLD at their pace. 

The POPULATION monitor displays the total number of persons involved in the simulation.

The NO. INFECTED monitor displays the number of infected persons before the simulation starts, as well as shows the progressive count of infected persons as more persons contract the virus.

The % INFECTED monitor displays the percentage of infection / transmission in relation to the population.

The DAYS monitor displays the number of days / assumed or projected number of days it takes, or will take for a given number of susceptible population to be infected. As indicated earlier, each tick indicates one day in the model’s time scale.

The NO. UNINFECTED monitor shows the number of persons not susceptible to infection as set on the PROTECTED slider.

The % UNINFECTED monitor displays the percentage of persons not infected in relation to the number of persons not infected.

It is pertinent to mention that while the simulation runs, the NO. UNINFECTED and % UNINFECTED monitors show no decrease in the number of protected persons, which if occurred, would mean transmission was successful among them. This is so because the model tries to depict the claims of Bielecki et al. (2020) and Gosak et al. (2021) who postulate that stringent adherence to all safety precautions is tantamount to no successful transmission.

The SPREAD GRAPH plots and displays the transmission rate with Percent Infected on the x-axis, and Days on the y-axis.

The WORLD displays the core of the simulation which lies in the activities of the turtles represented by the PERSON shape.


## THINGS TO NOTICE

The values set by all three sliders interact to determine the likelihood of transmission among the population. 

When more than one person is infected from the start of the simulation, transmission occurs faster, and the more the number of infected persons at the onset, the faster the spread. 

A significant increase or decrease in the number of PROTECTED persons significantly influences the duration of transmission.  This supports the claims of Bielecki et al. (2020) and Gosak et al. (2021) who advocate that strict compliance with preventive measures is effective.

The success or failure of the transmission is determined by the population dynamics change controlled by the sliders.
 
The number of PROTECTED persons never decreases, and their colour never turns orange.
This depicts and corroborates the claims that following recommended precautions to the letter could actually alter the rate of transmission. 

Persons could move around the entire length and breadth of the WORLD as they simulate what is possible in a small community, be it a formal or an informal community. The simulation actually models a setting where it is possible for one person to walk the entire perimeter of the community.
 
When no vulnerable person coloured in grey is left in the WORLD, the process stops automatically.


## THINGS TO TRY

The model tries to simulate transmission and prevention of the coronavirus, hence, try manipulating the slider values to achieve a near real-life coronavirus situation, taking strict abidance and non-adherence to recommended preventive measures into cognisance. 

Pay attention to the number of days it takes to infect all vulnerable persons as slider values are manipulated. This could be useful to make projections. For instance, a significant increase or decrease in the number of PROTECTED persons plays a significant role in the number of days it takes the virus to spread and infect all members of the UNPROTECTED group.


## EXTENDING THE MODEL

A monitor that displays the number of persons who have come within 1.99 radius of an infected person could be added. This would help establish a correlation between those who have come within the defined radius and the NO. INFECTED count.

A slider that manipulates social distance could be added, as against the 1.99 radius defined in the codes of the model. This function would be designed to show the speed at which transmission occurs or fails when the slider values are adjusted closer to the set social distancing value, or further away from it. This would replicate a near real-life situation.

The model could be extended to include a limitation to the extent persons could move around the community, as everyone for some reasons – medical, cultural, legal, age, or other personal – would not move around the entire perimeter of a given place. This also would make the scenario near real-life.

There could be a monitor that shows persons who have been infected with the virus but do not show any symptoms yet, as the virus may be in its incubation period. This feature could be enhanced also by giving persons in this category a different colour, maybe yellow, before they turn orange fully upon full maturity of their infection. To further enhance the feature, it would be apt to add a monitor that counts the number of days left before an infected person without symptoms begins to show symptoms and turn orange from yellow. The count of this new monitor would be observed alongside another monitor that counts the number of confirmed cases, to see if at the end of an incubation period for one person, there is a correlated increment in the number of confirmed cases.

When cases are confirmed, persons should be able to isolate or get quarantined, as well as get treated, while the turtles that represent such persons should disappear (NetLogo DIE) from the WORLD temporarily. To further enhance this feature, there should be appropriate monitors displaying the number of persons receiving treatment, isolating, and/or quarantining. Additionally, persons fully recovered should be able to reappear in the WORLD and continue their activities, and there should be a monitor that shows the number and percentage of persons recovered.

When persons who have religiously followed safety precautions go wrong with the practice, they should be vulnerable at the time and their colour should change accordingly. It should be possible for such persons to contract the virus at the time of vulnerability and spread same.

Different strains of the virus and their levels of contagiousness could be added. The contagion level of such strains would make significant contributions to the simulation.


## NETLOGO FEATURES

An interesting thing about the model is using a few lines of code to bring all the engaging features to life. The NetLogo Dictionary played a key role in the actualisation of the model. For instance, the model includes three groups of persons, the POSITIVE, UNPROTECTED, and PROTECTED categories, and using the `create-<breeds>` command and a few `if`-statements, all three categories of persons function in line with the simulation.

Another interesting feature is the `let` command used in conjunction with the `count other turtles with` command to ask a turtle to execute a command while excluding itself as a turtle.

A particularly interesting feature is the implementation of social distance in the model, and this was achieve simply with the `in-radius` command as shown in the blocks of codes below:

```
let unsocially-distanced count other turtles with [ covid? ] in-radius 1.99
    if unsocially-distanced > 0 [
      set covid? true
      ]
    if covid? [
      set color orange
    ]
```


## RELATED MODELS

Similar to this model in the NetLogo Library are the:
- HIV Model in the Biology category.
- Spread of Disease Model in chapter 6 of the IABM textbook.
- Virus Model in the Biology category.
- Virus on a Network Model in the Networks category.


## CREDITS AND REFERENCES

Bielecki, M., Züst, R., Siegrist , D., Meyerhofer, D., Crameri, G. A., Stanga, Z., . . .      Deuel, J. W. (2021). Social Distancing Alters the Clinical Course of COVID-19 in          Young Adults: A Comparative Cohort Study. Clinical Infectious Diseases, 72(4),            598–603. doi:https://doi.org/10.1093/cid/ciaa889

Gosak, M., Kraemer, M. U., Nax, H. H., Perc , M., & Pradelski , B. S. (2021). Endogenous      social distancing and its underappreciated impact on the epidemic curve. Scientific       Reports, 11(3093), 1-10. doi:https://doi.org/10.1038/s41598-021-82770-8

McIntosh, K. (2020). Coronavirus disease 2019 (COVID-19): Epidemiology, virology, and         prevention. PA, Pennsylvania: Wolters Kluwers.

Rand, W., & Wilensky, U. (2008). NetLogo Spread of Disease model. Evanston, Illinois,         U.S.A. [Computer software] 

Wilensky, U. (1999). NetLogo Virus Model. Evanston, Illinois, U.S.A. [Computer software]

World Health Organization. (2020). Transmission of SARS-CoV-2: implications for infection     prevention precautions: Scientific Brief. Geneva: World Health Organization.

World Health Organization. (2021). Preventing and mitigating COVID-19 at work: Policy         brief. Geneva: WHO-ILO.


@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
@#$#@#$#@
NetLogo 6.2.0
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
0
@#$#@#$#@
