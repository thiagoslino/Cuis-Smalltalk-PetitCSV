'From Cuis 6.0 [latest update: #5847] on 14 June 2023 at 7:33:22 pm'!
'Description '!
!provides: 'PetitCSVTests' 1 2!
!requires: 'PetitTests' 1 2 nil!
!requires: 'PetitCSV' 1 2 nil!
SystemOrganization addCategory: 'PetitCSVTests'!


!classDefinition: #PPCommaSeparatedParserTest category: 'PetitCSVTests'!
PPCompositeParserTest subclass: #PPCommaSeparatedParserTest
	instanceVariableNames: 'row cell rows'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PetitCSVTests'!
!classDefinition: 'PPCommaSeparatedParserTest class' category: 'PetitCSVTests'!
PPCommaSeparatedParserTest class
	instanceVariableNames: ''!


!PPCommaSeparatedParserTest methodsFor: 'as yet unclassified' stamp: 'tsl 6/14/2023 19:12:52'!
parserClass
	^ PPCommaSeparatedParser! !

!PPCommaSeparatedParserTest methodsFor: 'as yet unclassified' stamp: 'tsl 6/14/2023 19:13:05'!
testCell
	self assert: '123' is: #(('123')).
	self assert: 'abc' is: #(('abc')).
	self assert: 'ASDASD123' is: #(('ASDASD123')).! !

!PPCommaSeparatedParserTest methodsFor: 'as yet unclassified' stamp: 'tsl 6/14/2023 19:13:16'!
testSingleLine
	self assert: '1 , 2, 3' is: #(('1' '2' '3')).
	self assert: 'a1 , 2, 3' is: #(('a1' '2' '3')).
	self assert: 'a , 2, 3' is: #(('a' '2' '3')).! !

!PPCommaSeparatedParserTest methodsFor: 'as yet unclassified' stamp: 'tsl 6/14/2023 19:13:47'!
testTwoLines	
	self assert: '1
		2' is: {{'1'} .{'2'}}! !
