'From Cuis 6.0 [latest update: #5859] on 14 June 2023 at 7:16:18 pm'!
'Description Cuis port of http://source.lukas-renggli.ch/petit/ PetitCSV'!
!provides: 'PetitCSV' 1 2!
!requires: 'PetitParser' 1 4 nil!
SystemOrganization addCategory: 'PetitCSV'!


!classDefinition: #PPCommaSeparatedParser category: 'PetitCSV'!
PPCompositeParser subclass: #PPCommaSeparatedParser
	instanceVariableNames: 'row cell rows endOfLine whitespace nonComma'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PetitCSV'!
!classDefinition: 'PPCommaSeparatedParser class' category: 'PetitCSV'!
PPCommaSeparatedParser class
	instanceVariableNames: ''!


!PPCommaSeparatedParser methodsFor: 'as yet unclassified' stamp: 'tsl 6/14/2023 19:14:28'!
cell
	^ whitespace star , nonComma star flatten , whitespace star
			==> [ :nodes | nodes second value ]! !

!PPCommaSeparatedParser methodsFor: 'as yet unclassified' stamp: 'tsl 6/14/2023 19:14:36'!
endOfLine
	^ #newline asParser token! !

!PPCommaSeparatedParser methodsFor: 'as yet unclassified' stamp: 'tsl 6/14/2023 19:14:49'!
nonComma
	^ PPPredicateObjectParser anyExceptAnyOf: {Character space . Character tab . Character cr . Character lf . $, }! !

!PPCommaSeparatedParser methodsFor: 'as yet unclassified' stamp: 'tsl 6/14/2023 19:15:00'!
number 
	^ ($- asParser optional , #digit asParser plus , ($. asParser , #digit asParser plus) optional) token
			==> [ :nodes | nodes first value asNumber ]! !

!PPCommaSeparatedParser methodsFor: 'as yet unclassified' stamp: 'tsl 6/14/2023 19:15:10'!
row
	^ (cell delimitedBy: $, asParser token) ==> [ :nodes | nodes reject: [ :each | each class = PPToken ] ]! !

!PPCommaSeparatedParser methodsFor: 'as yet unclassified' stamp: 'tsl 6/14/2023 19:15:16'!
rows
	^ (row delimitedBy: endOfLine)  ==> [ :nodes | nodes reject: [ :each | each class = PPToken ] ]! !

!PPCommaSeparatedParser methodsFor: 'as yet unclassified' stamp: 'tsl 6/14/2023 19:15:22'!
start
	^ rows end! !

!PPCommaSeparatedParser methodsFor: 'as yet unclassified' stamp: 'tsl 6/14/2023 19:15:28'!
whitespace
	^ PPPredicateObjectParser anyOf: (Array with: Character space with: Character tab)! !
