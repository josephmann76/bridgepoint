/**
 * generated by Xtext 2.9.2
 */
package org.xtuml.bp.xtext.masl.masl.structure;

import org.eclipse.emf.common.util.EList;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Object Definition</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link org.xtuml.bp.xtext.masl.masl.structure.ObjectDefinition#getAttributes <em>Attributes</em>}</li>
 *   <li>{@link org.xtuml.bp.xtext.masl.masl.structure.ObjectDefinition#getIdentifiers <em>Identifiers</em>}</li>
 *   <li>{@link org.xtuml.bp.xtext.masl.masl.structure.ObjectDefinition#getServices <em>Services</em>}</li>
 *   <li>{@link org.xtuml.bp.xtext.masl.masl.structure.ObjectDefinition#getEvents <em>Events</em>}</li>
 *   <li>{@link org.xtuml.bp.xtext.masl.masl.structure.ObjectDefinition#getStates <em>States</em>}</li>
 *   <li>{@link org.xtuml.bp.xtext.masl.masl.structure.ObjectDefinition#getTransitions <em>Transitions</em>}</li>
 * </ul>
 *
 * @see org.xtuml.bp.xtext.masl.masl.structure.StructurePackage#getObjectDefinition()
 * @model
 * @generated
 */
public interface ObjectDefinition extends AbstractNamed, Pragmatized {
	/**
	 * Returns the value of the '<em><b>Attributes</b></em>' containment reference list.
	 * The list contents are of type {@link org.xtuml.bp.xtext.masl.masl.structure.AttributeDefinition}.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Attributes</em>' containment reference list isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Attributes</em>' containment reference list.
	 * @see org.xtuml.bp.xtext.masl.masl.structure.StructurePackage#getObjectDefinition_Attributes()
	 * @model containment="true"
	 * @generated
	 */
	EList<AttributeDefinition> getAttributes();

	/**
	 * Returns the value of the '<em><b>Identifiers</b></em>' containment reference list.
	 * The list contents are of type {@link org.xtuml.bp.xtext.masl.masl.structure.IdentifierDefinition}.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Identifiers</em>' containment reference list isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Identifiers</em>' containment reference list.
	 * @see org.xtuml.bp.xtext.masl.masl.structure.StructurePackage#getObjectDefinition_Identifiers()
	 * @model containment="true"
	 * @generated
	 */
	EList<IdentifierDefinition> getIdentifiers();

	/**
	 * Returns the value of the '<em><b>Services</b></em>' containment reference list.
	 * The list contents are of type {@link org.xtuml.bp.xtext.masl.masl.structure.ObjectServiceDeclaration}.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Services</em>' containment reference list isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Services</em>' containment reference list.
	 * @see org.xtuml.bp.xtext.masl.masl.structure.StructurePackage#getObjectDefinition_Services()
	 * @model containment="true"
	 * @generated
	 */
	EList<ObjectServiceDeclaration> getServices();

	/**
	 * Returns the value of the '<em><b>Events</b></em>' containment reference list.
	 * The list contents are of type {@link org.xtuml.bp.xtext.masl.masl.structure.EventDefinition}.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Events</em>' containment reference list isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Events</em>' containment reference list.
	 * @see org.xtuml.bp.xtext.masl.masl.structure.StructurePackage#getObjectDefinition_Events()
	 * @model containment="true"
	 * @generated
	 */
	EList<EventDefinition> getEvents();

	/**
	 * Returns the value of the '<em><b>States</b></em>' containment reference list.
	 * The list contents are of type {@link org.xtuml.bp.xtext.masl.masl.structure.StateDeclaration}.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>States</em>' containment reference list isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>States</em>' containment reference list.
	 * @see org.xtuml.bp.xtext.masl.masl.structure.StructurePackage#getObjectDefinition_States()
	 * @model containment="true"
	 * @generated
	 */
	EList<StateDeclaration> getStates();

	/**
	 * Returns the value of the '<em><b>Transitions</b></em>' containment reference list.
	 * The list contents are of type {@link org.xtuml.bp.xtext.masl.masl.structure.TransitionTable}.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Transitions</em>' containment reference list isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Transitions</em>' containment reference list.
	 * @see org.xtuml.bp.xtext.masl.masl.structure.StructurePackage#getObjectDefinition_Transitions()
	 * @model containment="true"
	 * @generated
	 */
	EList<TransitionTable> getTransitions();

} // ObjectDefinition
