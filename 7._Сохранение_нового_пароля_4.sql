prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2016.08.24'
,p_release=>'5.1.4.00.08'
,p_default_workspace_id=>11800973272798664
,p_default_application_id=>103
,p_default_owner=>'FCR'
);
end;
/
 
prompt APPLICATION 103 - LK
--
-- Application Export:
--   Application:     103
--   Name:            LK
--   Date and Time:   16:08 Среда Апрель 25, 2018
--   Exported By:     FCR
--   Flashback:       0
--   Export Type:     Page Export
--   Version:         5.1.4.00.08
--   Instance ID:     218235226215706
--

prompt --application/pages/delete_00007
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>7);
end;
/
prompt --application/pages/page_00007
begin
wwv_flow_api.create_page(
 p_id=>7
,p_user_interface_id=>wwv_flow_api.id(11866208218552473)
,p_name=>'Reset'
,p_alias=>'RESET'
,p_page_mode=>'NORMAL'
,p_step_title=>'Сохранение нового пароля'
,p_allow_duplicate_submissions=>'N'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'Reset'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(12055386858033796)
,p_step_template=>wwv_flow_api.id(11816008337552279)
,p_page_template_options=>'#DEFAULT#'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'Y'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'GERA'
,p_last_upd_yyyymmddhh24miss=>'20180418134247'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(14404274964648388)
,p_plug_name=>'Вход в личный кабинет'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(11823090257552314)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P7_CONFIRM_STATUS'
,p_plug_display_when_cond2=>'Y'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(23883855339368901)
,p_plug_name=>'Смена пароля'
,p_icon_css_classes=>'fa-key-alt'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(11832482636552332)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P7_CONFIRM_STATUS'
,p_plug_display_when_cond2=>'Y'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(23971439496992524)
,p_plug_name=>'Что-то пошло не так'
,p_region_template_options=>'#DEFAULT#:t-Alert--wizard:t-Alert--defaultIcons:t-Alert--danger'
,p_plug_template=>wwv_flow_api.id(11820808239552295)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Возможно, ссылка для подтверждения была использована ранее, или содержит ошибку. ',
'Получите новую ссылку с помощью смены забытого пароля.'))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P7_CONFIRM_STATUS'
,p_plug_display_when_cond2=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(12025189311762842)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(14404274964648388)
,p_button_name=>'Enter'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--link'
,p_button_template_id=>wwv_flow_api.id(11855494343552396)
,p_button_image_alt=>'Вход в личный кабинет'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_redirect_url=>'f?p=&APP_ID.:101:&SESSION.::&DEBUG.:RP::'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(12061482705252117)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(23971439496992524)
,p_button_name=>'OK2'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large'
,p_button_template_id=>wwv_flow_api.id(11855494343552396)
,p_button_is_hot=>'Y'
,p_button_image_alt=>' OK '
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:101:&SESSION.::&DEBUG.:RP::'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(12014984792662901)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(23883855339368901)
,p_button_name=>'SEND_MAIL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(11855494343552396)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Сохранить'
,p_button_position=>'REGION_TEMPLATE_NEXT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(12035362760060016)
,p_branch_name=>'Go Enter'
,p_branch_action=>'f?p=&APP_ID.:101:&SESSION.::&DEBUG.:RP,101::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>30
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12015766033662903)
,p_name=>'P7_PASSWORD'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(23883855339368901)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Пароль'
,p_placeholder=>'придумайте и запомните новый пароль'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_cMaxlength=>50
,p_field_template=>wwv_flow_api.id(11854888287552385)
,p_item_icon_css_classes=>'fa-key'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12034669894060009)
,p_name=>'P7_CONFIRM_STATUS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(23883855339368901)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(12016163636662904)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Update password'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    LK_AUTH.update_password(:P7_PASSWORD, :GUID);',
'END;    '))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Новый пароль успешно сохранен'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(12035028831060013)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Session'
,p_attribute_01=>'RESET_SESSION_STATE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(12060817385249515)
,p_process_sequence=>20
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CHECK_CONFIRM_GUID'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    :P7_CONFIRM_STATUS := LK_AUTH.check_reset_guid(:GUID);',
'    :P7_REQUEST := :REQUEST;',
'end;    ',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
