/**
 * generated by Xtext 2.9.2
 */
package org.xtuml.bp.xtext.masl.masl.behavior.impl;

import org.eclipse.emf.common.notify.Notification;
import org.eclipse.emf.common.notify.NotificationChain;

import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.InternalEObject;

import org.eclipse.emf.ecore.impl.ENotificationImpl;

import org.xtuml.bp.xtext.masl.masl.behavior.BehaviorPackage;
import org.xtuml.bp.xtext.masl.masl.behavior.Expression;
import org.xtuml.bp.xtext.masl.masl.behavior.RaiseStatement;

import org.xtuml.bp.xtext.masl.masl.structure.ExceptionDeclaration;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>Raise Statement</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * </p>
 * <ul>
 *   <li>{@link org.xtuml.bp.xtext.masl.masl.behavior.impl.RaiseStatementImpl#getException <em>Exception</em>}</li>
 *   <li>{@link org.xtuml.bp.xtext.masl.masl.behavior.impl.RaiseStatementImpl#getArgument <em>Argument</em>}</li>
 * </ul>
 *
 * @generated
 */
public class RaiseStatementImpl extends StatementImpl implements RaiseStatement {
	/**
	 * The cached value of the '{@link #getException() <em>Exception</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getException()
	 * @generated
	 * @ordered
	 */
	protected ExceptionDeclaration exception;

	/**
	 * The cached value of the '{@link #getArgument() <em>Argument</em>}' containment reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getArgument()
	 * @generated
	 * @ordered
	 */
	protected Expression argument;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected RaiseStatementImpl() {
		super();
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	protected EClass eStaticClass() {
		return BehaviorPackage.Literals.RAISE_STATEMENT;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public ExceptionDeclaration getException() {
		if (exception != null && exception.eIsProxy()) {
			InternalEObject oldException = (InternalEObject)exception;
			exception = (ExceptionDeclaration)eResolveProxy(oldException);
			if (exception != oldException) {
				if (eNotificationRequired())
					eNotify(new ENotificationImpl(this, Notification.RESOLVE, BehaviorPackage.RAISE_STATEMENT__EXCEPTION, oldException, exception));
			}
		}
		return exception;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public ExceptionDeclaration basicGetException() {
		return exception;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void setException(ExceptionDeclaration newException) {
		ExceptionDeclaration oldException = exception;
		exception = newException;
		if (eNotificationRequired())
			eNotify(new ENotificationImpl(this, Notification.SET, BehaviorPackage.RAISE_STATEMENT__EXCEPTION, oldException, exception));
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public Expression getArgument() {
		return argument;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public NotificationChain basicSetArgument(Expression newArgument, NotificationChain msgs) {
		Expression oldArgument = argument;
		argument = newArgument;
		if (eNotificationRequired()) {
			ENotificationImpl notification = new ENotificationImpl(this, Notification.SET, BehaviorPackage.RAISE_STATEMENT__ARGUMENT, oldArgument, newArgument);
			if (msgs == null) msgs = notification; else msgs.add(notification);
		}
		return msgs;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void setArgument(Expression newArgument) {
		if (newArgument != argument) {
			NotificationChain msgs = null;
			if (argument != null)
				msgs = ((InternalEObject)argument).eInverseRemove(this, EOPPOSITE_FEATURE_BASE - BehaviorPackage.RAISE_STATEMENT__ARGUMENT, null, msgs);
			if (newArgument != null)
				msgs = ((InternalEObject)newArgument).eInverseAdd(this, EOPPOSITE_FEATURE_BASE - BehaviorPackage.RAISE_STATEMENT__ARGUMENT, null, msgs);
			msgs = basicSetArgument(newArgument, msgs);
			if (msgs != null) msgs.dispatch();
		}
		else if (eNotificationRequired())
			eNotify(new ENotificationImpl(this, Notification.SET, BehaviorPackage.RAISE_STATEMENT__ARGUMENT, newArgument, newArgument));
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public NotificationChain eInverseRemove(InternalEObject otherEnd, int featureID, NotificationChain msgs) {
		switch (featureID) {
			case BehaviorPackage.RAISE_STATEMENT__ARGUMENT:
				return basicSetArgument(null, msgs);
		}
		return super.eInverseRemove(otherEnd, featureID, msgs);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public Object eGet(int featureID, boolean resolve, boolean coreType) {
		switch (featureID) {
			case BehaviorPackage.RAISE_STATEMENT__EXCEPTION:
				if (resolve) return getException();
				return basicGetException();
			case BehaviorPackage.RAISE_STATEMENT__ARGUMENT:
				return getArgument();
		}
		return super.eGet(featureID, resolve, coreType);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public void eSet(int featureID, Object newValue) {
		switch (featureID) {
			case BehaviorPackage.RAISE_STATEMENT__EXCEPTION:
				setException((ExceptionDeclaration)newValue);
				return;
			case BehaviorPackage.RAISE_STATEMENT__ARGUMENT:
				setArgument((Expression)newValue);
				return;
		}
		super.eSet(featureID, newValue);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public void eUnset(int featureID) {
		switch (featureID) {
			case BehaviorPackage.RAISE_STATEMENT__EXCEPTION:
				setException((ExceptionDeclaration)null);
				return;
			case BehaviorPackage.RAISE_STATEMENT__ARGUMENT:
				setArgument((Expression)null);
				return;
		}
		super.eUnset(featureID);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public boolean eIsSet(int featureID) {
		switch (featureID) {
			case BehaviorPackage.RAISE_STATEMENT__EXCEPTION:
				return exception != null;
			case BehaviorPackage.RAISE_STATEMENT__ARGUMENT:
				return argument != null;
		}
		return super.eIsSet(featureID);
	}

} //RaiseStatementImpl
