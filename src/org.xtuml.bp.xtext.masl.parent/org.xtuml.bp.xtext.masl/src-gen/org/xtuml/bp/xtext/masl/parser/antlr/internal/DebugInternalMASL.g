/*
 * generated by Xtext 2.9.2
 */
grammar DebugInternalMASL;

// Rule MaslModel
ruleMaslModel:
	(
		ruleBuiltinLibraryDefinition
		    |
		ruleAbstractTopLevelElement
		*
	)
;

// Rule AbstractTopLevelElement
ruleAbstractTopLevelElement:
	(
		ruleProjectDefinition
		    |
		ruleDomainDefinition
		    |
		ruleDomainServiceDefinition
		    |
		ruleObjectServiceDefinition
		    |
		ruleStateDefinition
		    |
		ruleTerminatorServiceDefinition
	)
;

// Rule ScopedName
ruleScopedName:
	(
		RULE_ID
		'::'
	)?
	RULE_ID
;

// Rule PragmaList
rulePragmaList:
	(
		rulePragma
		';'
	)*
;

// Rule Pragma
rulePragma:
	'pragma'
	RULE_ID
	'('
	(
		rulePragmaValue
		(
			','
			rulePragmaValue
		)*
	)?
	')'
;

// Rule PragmaValue
rulePragmaValue:
	(
		RULE_ID
		    |
		ruleLiteral
	)
;

// Rule ParameterList
ruleParameterList:
	'('
	(
		ruleParameter
		(
			','
			ruleParameter
		)*
	)?
	')'
;

// Rule Parameter
ruleParameter:
	RULE_ID
	':'
	ruleParameterMode
	ruleAbstractTypeReference
;

// Rule ProjectDefinition
ruleProjectDefinition:
	'project'
	RULE_ID
	'is'
	ruleDomainDefinition
	*
	'end'
	'project'?
	';'?
	rulePragmaList
;

// Rule DomainDefinition
ruleDomainDefinition:
	'domain'
	RULE_ID
	'is'
	(
		ruleObjectDeclaration
		    |
		ruleDomainServiceDeclaration
		    |
		ruleTerminatorDefinition
		    |
		ruleRelationshipDefinition
		    |
		ruleObjectDefinition
		    |
		ruleTypeForwardDeclaration
		    |
		ruleTypeDeclaration
		    |
		ruleExceptionDeclaration
	)*
	'end'
	'domain'?
	';'?
	rulePragmaList
;

// Rule BuiltinLibraryDefinition
ruleBuiltinLibraryDefinition:
	'builtin'
	'is'
	(
		ruleBuiltinTypeDeclaration
		    |
		ruleCharacteristic
	)*
	'end'
	'builtin'?
	';'
;

// Rule BuiltinTypeDeclaration
ruleBuiltinTypeDeclaration:
	(
		ruleTypeDeclaration
		    |
		'anonymous'
		?
		'builtin'
		RULE_ID
		';'
	)
;

// Rule Characteristic
ruleCharacteristic:
	(
		'<'
		ruleTypeParameter
		(
			','
			ruleTypeParameter
		)*
		'>'
	)?
	(
		'('
		ruleAbstractTypeReference
		')'
		    |
		ruleAbstractTypeReference
	)
	'\''
	ruleCharacteristicID
	ruleParameterList?
	(
		'return'
		ruleAbstractTypeReferenceWithRange
	)?
	';'
;

// Rule TypeParameter
ruleTypeParameter:
	'enum'
	?
	RULE_ID
;

// Rule AbstractTypeReferenceWithRange
ruleAbstractTypeReferenceWithRange:
	(
		ruleAbstractTypeReference
		    |
		ruleRangeTypeReference
	)
;

// Rule RangeTypeReference
ruleRangeTypeReference:
	'range'
	'of'
	ruleAbstractTypeReference
;

// Rule ExceptionDeclaration
ruleExceptionDeclaration:
	ruleVisibility
	?
	'exception'
	RULE_ID
	';'
	rulePragmaList
;

// Rule TypeForwardDeclaration
ruleTypeForwardDeclaration:
	ruleVisibility
	?
	(
		'type'
		    |
		'subtype'
	)
	RULE_ID
	';'
	rulePragmaList
;

// Rule TypeDeclaration
ruleTypeDeclaration:
	ruleVisibility
	?
	(
		'type'
		    |
		'subtype'
	)
	RULE_ID
	'is'
	ruleAbstractTypeDefinition
	';'
	';'?
	rulePragmaList
;

// Rule AbstractTypeDefinition
ruleAbstractTypeDefinition:
	(
		ruleStructureTypeDefinition
		    |
		ruleEnumerationTypeDefinition
		    |
		ruleConstrainedTypeDefinition
		    |
		ruleAbstractTypeReferenceWithCA
		    |
		ruleUnconstrainedArrayDefinition
	)
;

// Rule ConstrainedTypeDefinition
ruleConstrainedTypeDefinition:
	ruleNamedTypeReference
	ruleAbstractTypeConstraint
;

// Rule AbstractTypeConstraint
ruleAbstractTypeConstraint:
	(
		ruleRangeConstraint
		    |
		ruleDeltaConstraint
		    |
		ruleDigitsConstraint
	)
;

// Rule RangeConstraint
ruleRangeConstraint:
	'range'
	ruleExpression
;

// Rule DeltaConstraint
ruleDeltaConstraint:
	'delta'
	ruleConstExpression
	ruleRangeConstraint
;

// Rule DigitsConstraint
ruleDigitsConstraint:
	'digits'
	ruleConstExpression
	ruleRangeConstraint
;

// Rule StructureTypeDefinition
ruleStructureTypeDefinition:
	'structure'
	ruleStructureComponentDefinition
	*
	'end'
	'structure'?
;

// Rule StructureComponentDefinition
ruleStructureComponentDefinition:
	RULE_ID
	':'
	ruleAbstractTypeReference
	(
		':='
		ruleConstExpression
	)?
	';'
	rulePragmaList
;

// Rule EnumerationTypeDefinition
ruleEnumerationTypeDefinition:
	'enum'
	'('
	(
		ruleEnumerator
		(
			','
			ruleEnumerator
		)*
	)?
	')'
;

// Rule Enumerator
ruleEnumerator:
	RULE_ID
	(
		(
			'='
			    |
			':='
		)
		ruleConstExpression
	)?
;

// Rule UnconstrainedArrayDefinition
ruleUnconstrainedArrayDefinition:
	'array'
	'('
	ruleNamedTypeReference
	'range'
	'<>'
	')'
	'of'
	ruleAbstractTypeReference
;

// Rule AbstractTypeReference
ruleAbstractTypeReference:
	(
		ruleNamedTypeReference
		    |
		ruleInstanceTypeReference
		    |
		ruleAbstractCollectionTypeReference
	)
;

// Rule AbstractTypeReferenceWithCA
ruleAbstractTypeReferenceWithCA:
	(
		ruleAbstractTypeReference
		    |
		ruleConstrainedArrayTypeReference
	)
;

// Rule InstanceTypeReference
ruleInstanceTypeReference:
	'anonymous'
	?
	'instance'
	'of'
	ruleScopedName
;

// Rule NamedTypeReference
ruleNamedTypeReference:
	'anonymous'
	?
	ruleScopedName
;

// Rule ConstrainedArrayTypeReference
ruleConstrainedArrayTypeReference:
	ruleScopedName
	'('
	ruleExpression
	')'
;

// Rule AbstractCollectionTypeReference
ruleAbstractCollectionTypeReference:
	(
		ruleSequenceTypeReference
		    |
		ruleArrayTypeReference
		    |
		ruleSetTypeReference
		    |
		ruleBagTypeReference
		    |
		ruleDictionaryTypeReference
	)
;

// Rule SequenceTypeReference
ruleSequenceTypeReference:
	'anonymous'
	?
	'sequence'
	(
		'('
		ruleExpression
		')'
	)?
	'of'
	ruleAbstractTypeReference
;

// Rule ArrayTypeReference
ruleArrayTypeReference:
	'anonymous'
	?
	'array'
	'('
	ruleExpression
	')'
	'of'
	ruleAbstractTypeReference
;

// Rule SetTypeReference
ruleSetTypeReference:
	'anonymous'
	?
	'set'
	'of'
	ruleAbstractTypeReference
;

// Rule BagTypeReference
ruleBagTypeReference:
	'anonymous'
	?
	'bag'
	'of'
	ruleAbstractTypeReference
;

// Rule DictionaryTypeReference
ruleDictionaryTypeReference:
	'anonymous'
	?
	'dictionary'
	(
		ruleAbstractDictKeyTypeRef
		?
		'of'
		ruleAbstractTypeReference
	)?
;

// Rule AbstractDictKeyTypeRef
ruleAbstractDictKeyTypeRef:
	(
		ruleNamedTypeReference
		    |
		ruleInstanceTypeReference
	)
;

// Rule TerminatorDefinition
ruleTerminatorDefinition:
	'terminator'
	RULE_ID
	'is'
	ruleTerminatorServiceDeclaration
	*
	'end'
	'terminator'?
	';'
	rulePragmaList
;

// Rule TerminatorServiceDeclaration
ruleTerminatorServiceDeclaration:
	ruleVisibility
	?
	(
		'service'
		    |
		'function'
	)
	RULE_ID
	ruleParameterList
	(
		'return'
		ruleAbstractTypeReference
	)?
	';'
	rulePragmaList
;

// Rule ObjectDeclaration
ruleObjectDeclaration:
	'object'
	RULE_ID
	';'
	rulePragmaList
;

// Rule ObjectDefinition
ruleObjectDefinition:
	'object'
	RULE_ID
	'is'
	(
		ruleAttributeDefinition
		    |
		ruleIdentifierDefinition
		    |
		ruleObjectServiceDeclaration
		    |
		ruleEventDefinition
		    |
		ruleStateDeclaration
		    |
		ruleTransitionTable
	)*
	'end'
	'object'?
	';'
	rulePragmaList
;

// Rule AttributeDefinition
ruleAttributeDefinition:
	RULE_ID
	':'
	'preferred'
	?
	'unique'
	?
	(
		'referential'
		'('
		(
			ruleAttributeReferential
			(
				','
				ruleAttributeReferential
			)*
		)?
		')'
	)?
	ruleAbstractTypeReference
	(
		':='
		ruleConstExpression
	)?
	';'
	rulePragmaList
;

// Rule AttributeReferential
ruleAttributeReferential:
	ruleScopedName
	'.'
	(
		ruleObjectOrRoleName
		'.'
		RULE_ID
		    |
		RULE_ID
		'.'
		RULE_ID
		    |
		RULE_ID
	)
;

// Rule ObjectOrRoleName
ruleObjectOrRoleName:
	RULE_ID
	'.'
	RULE_ID
;

// Rule ObjectServiceDeclaration
ruleObjectServiceDeclaration:
	ruleVisibility
	?
	'instance'
	?
	(
		'deferred'
		'('
		RULE_ID
		')'
	)?
	(
		'service'
		    |
		'function'
	)
	RULE_ID
	ruleParameterList
	(
		'return'
		ruleAbstractTypeReference
	)?
	';'
	rulePragmaList
;

// Rule IdentifierDefinition
ruleIdentifierDefinition:
	'identifier'
	'is'
	'('
	(
		RULE_ID
		(
			','
			RULE_ID
		)*
	)?
	')'
	';'
	rulePragmaList
;

// Rule EventDefinition
ruleEventDefinition:
	ruleEventType
	?
	'event'
	RULE_ID
	ruleParameterList
	';'
	rulePragmaList
;

// Rule StateDeclaration
ruleStateDeclaration:
	ruleStateTypeSyntax
	?
	'state'
	RULE_ID
	ruleParameterList
	';'
	rulePragmaList
;

// Rule StateTypeSyntax
ruleStateTypeSyntax:
	(
		'assigner'
		'start'?
		    |
		'creation'
		    |
		'terminal'
	)
;

// Rule TransitionTable
ruleTransitionTable:
	ruleTransTableType
	?
	'transition'
	'is'
	ruleTransitionRow
	+
	'end'
	'transition'?
	';'
	rulePragmaList
;

// Rule TransitionRow
ruleTransitionRow:
	(
		RULE_ID
		    |
		(
			'Non_Existent'
			    |
			'Non_Existant'
			    |
			'non_existent'
			    |
			'non_existant'
		)
	)
	'('
	(
		ruleTransitionOption
		(
			','
			ruleTransitionOption
		)*
	)?
	')'
	';'
	rulePragmaList
;

// Rule TransitionOption
ruleTransitionOption:
	(
		RULE_ID
		'.'
	)?
	RULE_ID
	'=>'
	(
		RULE_ID
		    |
		'Ignore'
		    |
		(
			'Cannot_Happen'
			    |
			'cannot_happen'
		)
	)
;

// Rule DomainServiceDeclaration
ruleDomainServiceDeclaration:
	ruleVisibility
	?
	(
		'service'
		    |
		'function'
	)
	RULE_ID
	ruleParameterList
	(
		'return'
		ruleAbstractTypeReference
	)?
	';'
	rulePragmaList
;

// Rule RelationshipDefinition
ruleRelationshipDefinition:
	'relationship'
	(
		ruleRegularRelationshipDefinition
		    |
		ruleAssocRelationshipDefinition
		    |
		ruleSubtypeRelationshipDefinition
	)
	';'
	rulePragmaList
;

// Rule RegularRelationshipDefinition
ruleRegularRelationshipDefinition:
	RULE_ID
	'is'
	ruleRelationshipEnd
	','
	ruleRelationshipEnd
;

// Rule AssocRelationshipDefinition
ruleAssocRelationshipDefinition:
	RULE_ID
	'is'
	ruleRelationshipEnd
	','
	ruleRelationshipEnd
	'using'
	'one'
	?
	RULE_ID
;

// Rule RelationshipEnd
ruleRelationshipEnd:
	RULE_ID
	ruleConditionality
	RULE_ID
	ruleMultiplicity
	RULE_ID
;

// Rule SubtypeRelationshipDefinition
ruleSubtypeRelationshipDefinition:
	RULE_ID
	'is'
	RULE_ID
	'is_a'
	'('
	(
		RULE_ID
		(
			','
			RULE_ID
		)*
	)?
	')'
;

// Rule RelationshipNavigation
ruleRelationshipNavigation:
	ruleScopedName
	(
		'.'
		(
			RULE_ID
			    |
			ruleObjectOrRoleName
		)
	)?
;

// Rule DomainServiceDefinition
ruleDomainServiceDefinition:
	ruleVisibility
	?
	(
		'service'
		    |
		'function'
	)
	RULE_ID
	'::'
	RULE_ID
	ruleParameterList
	(
		'return'
		ruleAbstractTypeReference
	)?
	'is'
	ruleCodeBlock
	(
		'service'
		    |
		'function'
	)?
	';'?
	rulePragmaList
;

// Rule ObjectServiceDefinition
ruleObjectServiceDefinition:
	ruleVisibility
	?
	'instance'
	?
	(
		'deferred'
		RULE_ID
	)?
	(
		'service'
		    |
		'function'
	)
	RULE_ID
	'::'
	RULE_ID
	'.'
	RULE_ID
	ruleParameterList
	(
		'return'
		ruleAbstractTypeReference
	)?
	'is'
	ruleCodeBlock
	(
		'service'
		    |
		'function'
	)?
	';'?
	rulePragmaList
;

// Rule TerminatorServiceDefinition
ruleTerminatorServiceDefinition:
	ruleVisibility
	?
	(
		'service'
		    |
		'function'
	)
	RULE_ID
	'::'
	RULE_ID
	'~>'
	RULE_ID
	ruleParameterList
	(
		'return'
		ruleAbstractTypeReference
	)?
	'is'
	ruleCodeBlock
	(
		'service'
		    |
		'function'
	)?
	';'?
	rulePragmaList
;

// Rule StateDefinition
ruleStateDefinition:
	ruleStateTypeSyntax
	?
	'state'
	RULE_ID
	'::'
	RULE_ID
	'.'
	RULE_ID
	ruleParameterList
	'is'
	ruleCodeBlock
	'state'?
	';'?
	rulePragmaList
;

// Rule AbstractStatement
ruleAbstractStatement:
	(
		ruleCodeBlockStatement
		    |
		ruleAssignStatement
		    |
		ruleExitStatement
		    |
		ruleReturnStatement
		    |
		ruleDelayStatement
		    |
		ruleRaiseStatement
		    |
		ruleDeleteStatement
		    |
		ruleEraseStatement
		    |
		ruleScheduleStatement
		    |
		ruleCancelTimerStatement
		    |
		ruleGenerateStatement
		    |
		ruleIfStatement
		    |
		ruleCaseStatement
		    |
		ruleForStatement
		    |
		ruleWhileStatement
	)
	';'
	rulePragmaList
;

// Rule AssignStatement
ruleAssignStatement:
	ruleExpression
	(
		':='
		ruleExpression
	)?
;

// Rule ExitStatement
ruleExitStatement:
	'exit'
	(
		'when'
		ruleExpression
	)?
;

// Rule ReturnStatement
ruleReturnStatement:
	'return'
	ruleExpression
;

// Rule DelayStatement
ruleDelayStatement:
	'delay'
	ruleExpression
;

// Rule RaiseStatement
ruleRaiseStatement:
	'raise'
	ruleScopedName
	(
		'('
		ruleExpression
		?
		')'
	)?
;

// Rule DeleteStatement
ruleDeleteStatement:
	'delete'
	ruleExpression
;

// Rule EraseStatement
ruleEraseStatement:
	'erase'
	ruleExpression
;

// Rule ScheduleStatement
ruleScheduleStatement:
	'schedule'
	ruleExpression
	ruleGenerateStatement
	ruleScheduleType
	ruleExpression
	(
		'delta'
		ruleExpression
	)?
;

// Rule CancelTimerStatement
ruleCancelTimerStatement:
	'cancel'
	ruleExpression
;

// Rule GenerateStatement
ruleGenerateStatement:
	'generate'
	(
		ruleScopedName
		'.'
	)?
	RULE_ID
	'('
	(
		ruleExpression
		(
			','
			ruleExpression
		)*
	)?
	')'
	(
		'to'
		ruleExpression
	)?
;

// Rule IfStatement
ruleIfStatement:
	'if'
	ruleExpression
	'then'
	ruleAbstractStatement
	*
	ruleElsifBlock
	*
	ruleElseBlock
	?
	'end'
	'if'?
;

// Rule ElsifBlock
ruleElsifBlock:
	'elsif'
	ruleExpression
	'then'
	ruleAbstractStatement
	*
;

// Rule ElseBlock
ruleElseBlock:
	'else'
	ruleAbstractStatement
	*
;

// Rule WhileStatement
ruleWhileStatement:
	'while'
	ruleExpression
	'loop'
	ruleAbstractStatement
	*
	'end'
	'loop'?
;

// Rule CaseStatement
ruleCaseStatement:
	'case'
	ruleExpression
	'is'
	ruleCaseAlternative
	*
	ruleCaseOthers
	?
	'end'
	'case'?
;

// Rule CaseAlternative
ruleCaseAlternative:
	'when'
	ruleExpression
	(
		'|'
		ruleExpression
	)*
	'=>'
	ruleAbstractStatement
	*
;

// Rule CaseOthers
ruleCaseOthers:
	'when'
	'others'
	'=>'
	ruleAbstractStatement
	*
;

// Rule ForStatement
ruleForStatement:
	'for'
	ruleLoopVariable
	'in'
	'reverse'
	?
	ruleExpression
	'loop'
	ruleAbstractStatement
	*
	'end'
	'loop'?
;

// Rule LoopVariable
ruleLoopVariable:
	RULE_ID
;

// Rule CodeBlockStatement
ruleCodeBlockStatement:
	'declare'?
	ruleCodeBlock
;

// Rule CodeBlock
ruleCodeBlock:
	ruleVariableDeclaration
	*
	'begin'
	ruleAbstractStatement
	*
	(
		'exception'
		ruleExceptionHandler
		*
		ruleDefaultExceptionHandler
		?
	)?
	'end'
;

// Rule VariableDeclaration
ruleVariableDeclaration:
	RULE_ID
	':'
	'readonly'
	?
	ruleAbstractTypeReferenceWithCA
	(
		':='
		ruleExpression
	)?
	';'
	rulePragmaList
;

// Rule ExceptionHandler
ruleExceptionHandler:
	'when'
	ruleScopedName
	'=>'
	ruleAbstractStatement
	*
;

// Rule DefaultExceptionHandler
ruleDefaultExceptionHandler:
	'when'
	'others'
	'=>'
	ruleAbstractStatement
	*
;

// Rule FindCondition
ruleFindCondition:
	ruleFindLogicalOr
;

// Rule FindLogicalOr
ruleFindLogicalOr:
	ruleFindLogicalXor
	(
		'or'
		ruleFindLogicalXor
	)*
;

// Rule FindLogicalXor
ruleFindLogicalXor:
	ruleFindLogicalAnd
	(
		'xor'
		ruleFindLogicalAnd
	)*
;

// Rule FindLogicalAnd
ruleFindLogicalAnd:
	ruleFindPrimary
	(
		'and'
		ruleFindPrimary
	)*
;

// Rule FindPrimary
ruleFindPrimary:
	(
		ruleFindEquality
		    |
		ruleFindUnary
	)
;

// Rule FindUnary
ruleFindUnary:
	(
		'not'
		ruleFindUnary
		    |
		'('
		ruleFindCondition
		')'
	)
;

// Rule FindEquality
ruleFindEquality:
	ruleFindRelationExp
	(
		(
			'='
			    |
			'/='
		)
		ruleAdditiveExp
	)?
;

// Rule FindRelationExp
ruleFindRelationExp:
	ruleFindName
	(
		(
			'<'
			    |
			'>'
			    |
			'<='
			    |
			'>='
		)
		ruleAdditiveExp
	)?
;

// Rule FindName
ruleFindName:
	ruleFindReceiverAttribute
	(
		'.'
		RULE_ID
		    |
		'['
		ruleExpression
		']'
	)*
;

// Rule FindReceiverAttribute
ruleFindReceiverAttribute:
	RULE_ID
;

// Rule ConstExpression
ruleConstExpression:
	ruleExpression
;

// Rule Expression
ruleExpression:
	ruleStreamExpression
;

// Rule StreamExpression
ruleStreamExpression:
	ruleRangeExpression
	(
		ruleStreamOperator
		ruleRangeExpression
	)*
;

// Rule StreamOperator
ruleStreamOperator:
	(
		'<<'
		    |
		'>>'
		    |
		'<<<'
		    |
		'>>>'
	)
;

// Rule RangeExpression
ruleRangeExpression:
	ruleLogicalOr
	(
		'..'
		ruleLogicalOr
	)?
;

// Rule LogicalOr
ruleLogicalOr:
	ruleLogicalXor
	(
		'or'
		ruleLogicalXor
	)*
;

// Rule LogicalXor
ruleLogicalXor:
	ruleLogicalAnd
	(
		'xor'
		ruleLogicalAnd
	)*
;

// Rule LogicalAnd
ruleLogicalAnd:
	ruleEquality
	(
		'and'
		ruleEquality
	)*
;

// Rule Equality
ruleEquality:
	ruleRelationalExp
	(
		(
			'='
			    |
			'/='
		)
		ruleRelationalExp
	)*
;

// Rule RelationalExp
ruleRelationalExp:
	ruleAdditiveExp
	(
		(
			'<'
			    |
			'>'
			    |
			'<='
			    |
			'>='
		)
		ruleAdditiveExp
	)*
;

// Rule AdditiveExp
ruleAdditiveExp:
	ruleMultExp
	(
		(
			'+'
			    |
			'-'
			    |
			'&'
			    |
			'union'
			    |
			'not_in'
		)
		ruleMultExp
	)*
;

// Rule MultExp
ruleMultExp:
	ruleUnaryExp
	(
		(
			'*'
			    |
			'/'
			    |
			'mod'
			    |
			'**'
			    |
			'rem'
			    |
			'intersection'
			    |
			'disunion'
		)
		ruleUnaryExp
	)*
;

// Rule UnaryExp
ruleUnaryExp:
	(
		ruleUnaryOperator
		ruleUnaryExp
		    |
		ruleLinkExpression
	)
;

// Rule UnaryOperator
ruleUnaryOperator:
	(
		'-'
		    |
		'+'
		    |
		'not'
		    |
		'abs'
	)
;

// Rule LinkExpression
ruleLinkExpression:
	(
		ruleNavigateExpression
		    |
		ruleLinkType
		ruleNavigateExpression
		ruleRelationshipNavigation
		(
			(
				(ruleNavigateExpression
				)=>
				ruleNavigateExpression
			)
			(
				'using'
				ruleNavigateExpression
			)?
		)?
	)
;

// Rule NavigateExpression
ruleNavigateExpression:
	ruleExtendedExpression
	(
		(
			'->'
			ruleRelationshipNavigation
			(
				'('
				ruleFindCondition
				')'
			)?
			    |
			'with'
			ruleExtendedExpression
			'->'
			ruleRelationshipNavigation
			    |
			'ordered_by'
			ruleSortOrder
			    |
			'reverse_ordered_by'
			ruleSortOrder
		)
	)*
;

// Rule ExtendedExpression
ruleExtendedExpression:
	(
		rulePostfixExpression
		    |
		ruleCreateExpression
		    |
		ruleFindExpression
	)
;

// Rule SortOrder
ruleSortOrder:
	'('
	(
		ruleSortOrderComponent
		(
			','
			ruleSortOrderComponent
		)*
	)?
	')'
;

// Rule SortOrderComponent
ruleSortOrderComponent:
	'reverse'
	?
	ruleSortOrderFeature
;

// Rule SortOrderFeature
ruleSortOrderFeature:
	RULE_ID
	(
		'.'
		RULE_ID
	)*
;

// Rule CreateExpression
ruleCreateExpression:
	'create'
	'unique'
	?
	RULE_ID
	'('
	(
		ruleCreateArgument
		(
			','
			ruleCreateArgument
		)*
	)?
	')'
;

// Rule CreateArgument
ruleCreateArgument:
	(
		RULE_ID
		'=>'
		ruleExpression
		    |
		'Current_State'
		'=>'
		RULE_ID
	)
;

// Rule FindExpression
ruleFindExpression:
	ruleFindType
	rulePostfixNoActionCallExpression
	'('
	ruleFindCondition
	?
	')'
;

// Rule PostfixExpression
rulePostfixExpression:
	rulePrimaryExpression
	(
		(
			('(')=>
			'('
		)
		(
			ruleExpression
			(
				','
				ruleExpression
			)*
		)?
		')'
		    |
		'.'
		RULE_ID
		    |
		'~>'
		RULE_ID
		'('
		(
			ruleExpression
			(
				','
				ruleExpression
			)*
		)?
		')'
		    |
		'['
		ruleExpression
		']'
		    |
		'\''
		ruleCharacteristicID
		(
			(
				('(')=>
				'('
			)
			(
				ruleExpression
				(
					','
					ruleExpression
				)*
			)?
			')'
		)?
	)*
;

// Rule CharacteristicID
ruleCharacteristicID:
	(
		RULE_ID
		    |
		'range'
		    |
		'delta'
	)
;

// Rule PostfixNoActionCallExpression
rulePostfixNoActionCallExpression:
	rulePrimaryNoActionCallExpression
	(
		'.'
		RULE_ID
		    |
		'['
		ruleExpression
		']'
		    |
		'\''
		RULE_ID
	)*
;

// Rule PrimaryNoActionCallExpression
rulePrimaryNoActionCallExpression:
	(
		ruleLiteral
		    |
		ruleParenthesisedExpression
		    |
		ruleSimpleFeatureCall
		    |
		ruleTypeNameExpression
	)
;

// Rule PrimaryExpression
rulePrimaryExpression:
	(
		ruleLiteral
		    |
		ruleParenthesisedExpression
		    |
		ruleSimpleFeatureCall
		    |
		ruleTypeNameExpression
	)
;

// Rule TypeNameExpression
ruleTypeNameExpression:
	(
		ruleInstanceTypeReference
		    |
		ruleAbstractCollectionTypeReference
	)
;

// Rule SimpleFeatureCall
ruleSimpleFeatureCall:
	ruleScopedName
;

// Rule ParenthesisedExpression
ruleParenthesisedExpression:
	'('
	ruleExpression
	(
		(
			','
			ruleExpression
		)+
	)?
	')'
;

// Rule Literal
ruleLiteral:
	(
		ruleIntegerLiteral
		    |
		ruleRealLiteral
		    |
		ruleCharacterLiteral
		    |
		ruleStringLiteral
		    |
		ruleDurationLiteral
		    |
		ruleTimestampLiteral
		    |
		ruleBooleanLiteral
		    |
		ruleNullLiteral
		    |
		ruleFlushLiteral
		    |
		ruleThisLiteral
		    |
		ruleConsoleLiteral
		    |
		ruleEndlLiteral
		    |
		ruleLineNoLiteral
		    |
		ruleFileNameLiteral
	)
;

// Rule RealLiteral
ruleRealLiteral:
	RULE_REAL
;

// Rule IntegerLiteral
ruleIntegerLiteral:
	RULE_INT
;

// Rule StringLiteral
ruleStringLiteral:
	RULE_STRING
;

// Rule CharacterLiteral
ruleCharacterLiteral:
	RULE_CHAR
;

// Rule DurationLiteral
ruleDurationLiteral:
	RULE_DURATION
;

// Rule TimestampLiteral
ruleTimestampLiteral:
	RULE_TIMESTAMP
;

// Rule BooleanLiteral
ruleBooleanLiteral:
	(
		'true'
		    |
		'false'
	)
;

// Rule NullLiteral
ruleNullLiteral:
	'null'
;

// Rule FlushLiteral
ruleFlushLiteral:
	'flush'
;

// Rule ThisLiteral
ruleThisLiteral:
	'this'
;

// Rule ConsoleLiteral
ruleConsoleLiteral:
	'console'
;

// Rule EndlLiteral
ruleEndlLiteral:
	'endl'
;

// Rule LineNoLiteral
ruleLineNoLiteral:
	'#LINE#'
;

// Rule FileNameLiteral
ruleFileNameLiteral:
	'#FILE#'
;

// Rule Visibility
ruleVisibility:
	(
		'public'
		    |
		'private'
	)
;

// Rule EventType
ruleEventType:
	(
		'assigner'
		    |
		'creation'
	)
;

// Rule TransTableType
ruleTransTableType:
	'assigner'
;

// Rule ParameterMode
ruleParameterMode:
	(
		'in'
		    |
		'out'
	)
;

// Rule Conditionality
ruleConditionality:
	(
		'unconditionally'
		    |
		'conditionally'
	)
;

// Rule Multiplicity
ruleMultiplicity:
	(
		'one'
		    |
		'many'
	)
;

// Rule LinkType
ruleLinkType:
	(
		'link'
		    |
		'unlink'
	)
;

// Rule ScheduleType
ruleScheduleType:
	(
		'at'
		    |
		'delay'
	)
;

// Rule FindType
ruleFindType:
	(
		'find'
		    |
		'find_all'
		    |
		'find_one'
		    |
		'find_only'
	)
;

RULE_ID : ('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'_'|'0'..'9')*;

RULE_REAL : RULE_INT '.' RULE_INT;

RULE_INT : ('0'..'9')+;

RULE_STRING : '"' ('\\' .|~(('\\'|'"')))* '"';

RULE_CHAR : '\'' . '\'';

RULE_DURATION : '@P' ( options {greedy=false;} : . )*'@';

RULE_TIMESTAMP : '@' ( options {greedy=false;} : . )*'@';

RULE_SL_COMMENT : '//' ~(('\n'|'\r'))* ('\r'? '\n')? {skip();};

RULE_WS : (' '|'\t'|'\r'|'\n')+ {skip();};

RULE_ANY_OTHER : .;
