.//====================================================================
.//
.// This function creates a workflow.
.//
.//====================================================================
.function create_wfl
  .param string name
  .param inst_ref s_sync
  .param inst_ref cme
  .//
  .assign attr_name = name
INSERT INTO W_WOF VALUES ( '${name}', ${s_sync.Sync_ID}, '${cme.Key_Lett}', \
'${cme.Specialism}', '${cme.Label}');\
  .create object instance w_wof of W_WOF
  .assign w_wof.Name = name
  .relate w_wof to s_sync across R2001
  .relate w_wof to cme across R2012
.end function
.//====================================================================
.//
.// This function creates a workflow step.
.//
.//====================================================================
.function create_step
  .param frag_ref wfl
  .param inst_ref blk
  .param string parent_id
  .param string prev_id
  .param string id
  .//
  .assign attr_wfl = wfl
  .assign attr_id = ""
  .select any attr_w_step from instances of W_STEP where (false)
  .// This may look a bit bizarre.  The first time create_step is called,
  .// it simply returns a new ID and creates a partially set up W_STEP.  This
  .// is because the step may or may not be used.  It is conditioned upon
  .// further processing.  create_step is called a second time and the W_STEP
  .// is fully configured when it is known to be needed.
  .if ( "0" == id )
    .assign attr_id = "${blk.Block_Id}"
    .create object instance w_step of W_STEP
    .assign w_step.Step_ID = attr_id
    .assign w_step.buffer = ""
	.assign attr_w_step = w_step
  .else
    .assign attr_id = id
    .select any w_step from instances of W_STEP where ( "${selected.Step_ID}" == "${id}")
    .if (empty w_step)
      .create object instance w_step of W_STEP
      .assign w_step.Step_ID = attr_id
      .assign w_step.buffer = ""
    .end if
    .select any w_wof from instances of W_WOF where ( "${selected.Name}" == "${wfl.name}" )
    .relate w_step to w_wof across R2005
	.select any w_step_parent from instances of W_STEP where ( "${selected.Step_ID}" == "${parent_id}" )
    .relate w_step to w_step_parent across R2007.'contains'
	.select any w_step_previous from instances of W_STEP where ( "${selected.Step_ID}" == "${prev_id}" )
    .relate w_step to w_step_previous across R2008.'precedes'
    .relate w_step to blk across R2006
	.assign attr_w_step = w_step
  .end if
.end function
.//====================================================================
.//
.// This function translates a block by iterating over its statements.
.// When it encounters a 'from instances of where' or 'related by where'
.// statement that makes a USER bridge call in the where clause, this
.// function adds either a Context Item (W_CTI) instance or a Field
.// (W_FLD) instance to the current workflow step. Context Items are
.// created for 'from instances of' statements and Fields are added
.// for 'related by' statements.
.//
.// This data is used later in function_body.inc and wizard.inc to pre-
.// set values before entering the code generated from the rest of the
.// action language. It is also used in ui_processing.inc to suppress
.// emission of code implementing the selection statments, because the
.// selections have already been supplied, either by the user from the
.// context of the action (for example, the currently selected item in
.// a tree) or by the user making a selection or entering a value in a
.// widget such as a text field.
.//
.// This function is recursive, and each time it recurses, a new step
.// is added to the workflow. This allows conditionals to be computed
.// and the appropriate fields to be enabled/disabled or shown/hidden.
.//
.//====================================================================
.function wfl_pop_blck_xlate
  .param frag_ref step
  .param inst_ref blck
  .//
  .assign wfl = step.wfl
  .assign w_step = step.w_step
  .select any w_wfl from instances of W_WOF where ( "${selected.Name}" == "${wfl.name}" )
  .select many statements related by blck->ACT_SMT[R602]
  .select many else_statements  related by blck->ACT_SMT[R602]->ACT_E[R603]->ACT_SMT[R603]
  .select many elif_statements  related by blck->ACT_SMT[R602]->ACT_EL[R603]->ACT_SMT[R603]
  .assign statements = statements - else_statements
  .assign statements = statements - elif_statements
  .select any last_statement from instances of ACT_SMT where (false)
  .for each last_statement in statements
    .if (last_statement.Previous_Statement_Id == 0)
      .break for
    .end if
  .end for
  .assign statement = last_statement
  .select one prev_stmt related by last_statement->ACT_SMT[R661.'precedes']
  .while (not_empty prev_stmt)
    .assign statement = prev_stmt
    .select one prev_stmt related by prev_stmt->ACT_SMT[R661.'precedes']
  .end while
  .assign prev_step_id = "0"
  .assign srw_stmt_num = 0
  .while (not_empty statement)
    .select any fiw_stmt related by statement->ACT_FIW[R603]
    .if (not_empty fiw_stmt) 
      .// NOTE: UNLIKE Tiny Java Core . . . . . 
      .// We DON'T want to emit code for 'from instances of where' statements, 
      .// because these items will already have been supplied by the context 
      .// and passed as parameters. So skip this statement . . .
      .select one fiw_val related by fiw_stmt->V_VAL[R610]
      .invoke hubi = has_user_bridge_invocation( fiw_val )
      .if (hubi.result)
        .select one inst_ref related by fiw_stmt->V_VAR[R665]->V_INT[R814]
        .select one inst_set related by fiw_stmt->V_VAR[R665]->V_INS[R814]
        .if (not_empty inst_ref)
          .select one var related by inst_ref->V_VAR[R814]
          .select one clazz related by inst_ref->O_OBJ[R818]
INSERT INTO W_CTI VALUES ('${var.Name}', '${wfl.name}', '${statement.Statement_Id}', '${clazz.Key_Lett}', '${fiw_stmt.cardinality}');
          .create object instance w_cti of W_CTI
          .assign w_cti.Name = var.Name
          .assign w_cti.Type = fiw_stmt.cardinality
		  .relate w_cti to w_wfl across R2003
		  .relate w_cti to statement across R2004
		  .relate w_cti to clazz across R2002
        .elif (not_empty inst_set)
          .select one var related by inst_set->V_VAR[R814]
          .select one clazz related by inst_set->O_OBJ[R819]
INSERT INTO W_CTI VALUES ('${var.Name}', '${wfl.name}', '${statement.Statement_Id}', '${clazz.Key_Lett}', '${fiw_stmt.cardinality}');
          .create object instance w_cti of W_CTI
          .assign w_cti.Name = var.Name
          .assign w_cti.Type = fiw_stmt.cardinality
		  .relate w_cti to w_wfl across R2003
		  .relate w_cti to statement across R2004
		  .relate w_cti to clazz across R2002
        .else
          .print "ERROR: From instances where statement does not specify instance reference or set . . . . internal generation error"
        .end if
      .end if
    .end if
    .select any srw_stmt related by statement->ACT_SEL[R603]->ACT_SRW[R664]
    .if (not_empty srw_stmt)
      .// NOTE: AGAIN, UNLIKE Tiny Java Core . . . . . 
      .// We DON'T want to emit standard architecture code for 'related by where'
      .// statements, because these items are the subject of GUI navigations by
      .// the user. So instead of normal processing, we create a dialog field
      .// here.
      .select one srw_val related by srw_stmt->V_VAL[R611]
      .invoke hubi = has_user_bridge_invocation( srw_val )
      .if (hubi.result)
        .if(hubi.Method_Name == "selectExisting")
          .// here we need to provide the existing associated element
          .// to the element selector
          .select one result related by srw_stmt->ACT_SEL[R664]->V_VAR[R638]
          .select one sel_stmt related by srw_stmt->ACT_SEL[R664]
          .invoke llic = get_last_link_in_chain(sel_stmt)
          .assign last_link = llic.last_link
          .select one clazz related by last_link->O_OBJ[R678]
INSERT INTO W_CTI VALUES ('${result.Name}', '${wfl.name}', '${statement.Statement_Id}', '${clazz.Key_Lett}', 'one');
          .create object instance w_cti of W_CTI
          .assign w_cti.Name = result.Name
          .assign w_cti.Type = "one"
		  .relate w_cti to w_wfl across R2003
		  .relate w_cti to statement across R2004
          .relate w_cti to clazz across R2002
        .else
          .assign srw_stmt_num = srw_stmt_num + 1
          .select one result related by srw_stmt->ACT_SEL[R664]->V_VAR[R638]
          .select one sel_stmt related by srw_stmt->ACT_SEL[R664]
          .invoke llic = get_last_link_in_chain(sel_stmt)
          .assign last_link = llic.last_link
          .select one clazz related by last_link->O_OBJ[R678]
INSERT INTO W_FLD VALUES ('USER_${result.Name}', '${result.Name}', \
'${statement.Statement_Id}', '${clazz.Key_Lett}', '${step.id}', \
'${sel_stmt.cardinality}', \
          .create object instance w_fld of W_FLD
          .assign w_fld.Name = "USER_" + result.Name
          .assign w_fld.Instance_Handle = result.Name
          .assign w_fld.Cardinality = sel_stmt.cardinality
          .assign w_fld.buffer = ""
          .if (hubi.Method_Name == "selectOne")
'Combo', '');
            .assign w_fld.Type = "Combo"
          .elif (hubi.Method_Name == "selectOneWithInt")
'Combo', '');
            .assign w_fld.Type = "Combo"
          .elif (hubi.Method_Name == "selectMany")
'List', '');
            .assign w_fld.Type = "List"
          .else
'${hubi.Method_Name}', '');
            .assign w_fld.Type = hubi.Method_Name
          .end if
          .relate w_fld to w_step across R2009
          .relate w_fld to statement across R2010
          .relate w_fld to clazz across R2011
          .select one function related by blck->ACT_ACT[R601]->ACT_FNB[R698]->S_SYNC[R695]
          .// only support two custom labels
          .assign label = ""
          .if ( srw_stmt_num == 1 )
            .assign label = "${function.Descrip:Label1}"
          .elif ( srw_stmt_num == 2 )
            .assign label = "${function.Descrip:Label2}"
          .end if
          .if ( label != "" )
INSERT INTO W_CFL VALUES ('USER_${result.Name}', '${step.id}', '${label}');
            .create object instance w_cfl of W_CFL
            .assign w_cfl.Label = label
            .assign name = "USER_" + result.Name
			.select any w_fld from instances of W_FLD where (("${selected.Name}" == "${name}") and ("${selected.Step_ID}" == "${step.id}"))
			.relate w_cfl to w_fld across R2014
          .end if
        .end if
      .else
        .print "${statement.buffer}"
      .end if .// if hubi.result
    .end if
    .select one at_stmt related by statement->ACT_AI[R603]
    .if ( not_empty at_stmt )
      .select one at_val related by at_stmt->V_VAL[R609]
      .invoke hubi = has_user_bridge_invocation( at_val )
      .if (hubi.result)
        .// We DON'T want to emit standard architecture code for 'USER::bridge call'
        .// statements, because these items are the subject of GUI navigations by
        .// the user. So instead of normal processing, we create a dialog field
        .// here.
        .select one transient_asgn related by statement->ACT_AT[R603]
INSERT INTO W_FLD VALUES ('USER_${transient_asgn.Target_Variable_Name}', '${transient_asgn.Target_Variable_Name}', \
'${transient_asgn.Statement_Id}', '', '${step.id}', \
        .create object instance w_fld of W_FLD
        .assign w_fld.Name = "USER_" + transient_asgn.Target_Variable_Name
        .assign w_fld.Instance_Handle = transient_asgn.Target_Variable_Name
        .assign w_fld.Cardinality = ""
        .assign w_fld.buffer = ""
        .if ((hubi.Method_Name == "getString") OR (hubi.Method_Name == "getStringDef"))
'', 'Text', '');
          .assign w_fld.Type = "Text"
        .elif (hubi.Method_Name == "getMLString")
'', 'MLText', '');
          .assign w_fld.Type = "MLText"
        .else
'', '${hubi.Method_Name}', '');
          .assign w_fld.Type = hubi.Method_Name
        .end if
        .relate w_fld to w_step across R2009
        .relate w_fld to trasient_asgn across R2010
      .end if
    .end if
    .select any for_blk related by statement->ACT_FOR[R603]->ACT_BLK[R605]
    .if (not_empty for_blk)
      .invoke new_step = create_step(step.wfl, for_blk, step.id, prev_step_id, "0")
      .invoke inner_blck = wfl_pop_blck_xlate(new_step, for_blk)
      .if (inner_blck.body != "")
        .invoke new_step = create_step(step.wfl, for_blk, step.id, prev_step_id, new_step.id)
        .assign prev_step_id = new_step.id
${inner_blck.body}\
      .end if
    .end if
    .select any else_blk related by statement->ACT_E[R603]->ACT_BLK[R606]
    .if (not_empty else_blk)
      .invoke new_step = create_step(step.wfl, else_blk, step.id, prev_step_id, "0")
      .invoke inner_blck = wfl_pop_blck_xlate(new_step, else_blk)
      .if (inner_blck.body != "")
        .invoke new_step = create_step(step.wfl, else_blk, step.id, prev_step_id, new_step.id)
        .assign prev_step_id = new_step.id
${inner_blck.body}\
      .end if
    .end if
    .select any if_blk related by statement->ACT_IF[R603]->ACT_BLK[R607]
    .if (not_empty if_blk)
      .invoke new_step = create_step(step.wfl, if_blk, step.id, prev_step_id, "0")
      .invoke inner_blck = wfl_pop_blck_xlate(new_step, if_blk)
      .if (inner_blck.body != "")
        .invoke new_step = create_step(step.wfl, if_blk, step.id, prev_step_id, new_step.id)
        .assign prev_step_id = new_step.id
${inner_blck.body}\
      .end if
    .end if
    .select any whl_blk related by statement->ACT_WHL[R603]->ACT_BLK[R608]
    .if (not_empty whl_blk)
      .invoke new_step = create_step(step.wfl, whl_blk, step.id, prev_step_id, "0")
      .invoke inner_blck = wfl_pop_blck_xlate(new_step, whl_blk)
      .if (inner_blck.body != "")
        .invoke new_step = create_step(step.wfl, whl_blk, step.id, prev_step_id, new_step.id)
        .assign prev_step_id = new_step.id
${inner_blck.body}\
      .end if
    .end if
    .select any eli_blk related by statement->ACT_EL[R603]->ACT_BLK[R658]
    .if (not_empty eli_blk)
      .invoke new_step = create_step(step.wfl, eli_blk, step.id, prev_step_id, "0")
      .invoke inner_blck = wfl_pop_blck_xlate(new_step, eli_blk)
      .if (inner_blck.body != "")
        .invoke new_step = create_step(step.wfl, eli_blk, step.id, prev_step_id, new_step.id)
        .assign prev_step_id = new_step.id
${inner_blck.body}\
      .end if
    .end if
    .select one next_statement related by statement->ACT_SMT[R661.'succeeds']
    .assign statement = next_statement
  .end while
.end function
.//
