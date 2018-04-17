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
--   Date and Time:   15:18 Вторник Апрель 17, 2018
--   Exported By:     FCR
--   Flashback:       0
--   Export Type:     Page Export
--   Version:         5.1.4.00.08
--   Instance ID:     218235226215706
--

prompt --application/pages/delete_00006
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>6);
end;
/
prompt --application/pages/page_00006
begin
wwv_flow_api.create_page(
 p_id=>6
,p_user_interface_id=>wwv_flow_api.id(11866208218552473)
,p_name=>'Forgot'
,p_page_mode=>'NORMAL'
,p_step_title=>'Смена забытого пароля'
,p_allow_duplicate_submissions=>'N'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'Forgot'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(11816008337552279)
,p_page_template_options=>'#DEFAULT#'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'Y'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'GERA'
,p_last_upd_yyyymmddhh24miss=>'20180417151320'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(23878724818029184)
,p_plug_name=>'Смена забытого пароля'
,p_icon_css_classes=>'fa-key-alt'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(11832482636552332)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26429859466419369)
,p_plug_name=>'Вход в личный кабинет'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(11823090257552314)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(12025879278770982)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(26429859466419369)
,p_button_name=>'Enter'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--link'
,p_button_template_id=>wwv_flow_api.id(11855494343552396)
,p_button_image_alt=>'Вход в личный кабинет'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_redirect_url=>'f?p=&APP_ID.:101:&SESSION.::&DEBUG.:RP::'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(12009855798323215)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(23878724818029184)
,p_button_name=>'SEND_MAIL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(11855494343552396)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Сменить пароль'
,p_button_position=>'REGION_TEMPLATE_NEXT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12010283167323225)
,p_name=>'P6_EMAIL'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(23878724818029184)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Email'
,p_placeholder=>'ваш email '
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_field_template=>wwv_flow_api.id(11854888287552385)
,p_item_icon_css_classes=>'fa-envelope-user'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'EMAIL'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(12011027873323243)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Reset password'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    new_guid varchar2(100);',
'BEGIN',
'    new_guid := #OWNER#.LK_AUTH.add_email_guid(:P6_EMAIL);',
'    apex_mail.send(',
'            p_to         => :P6_EMAIL,',
'            p_from       => ''online@kapremont68.ru'', ',
'            p_subj       => ''online.kapremont68.ru - Смена забытого пароля'',',
'            p_body       => ''Для смены пароля перейдите по адресу http://online.kapremont68.ru:8080/ords/f?p=lk:reset:::::resetid:''||new_guid,',
'            p_body_html  => ''<a href="http://online.kapremont68.ru:8080/ords/f?p=lk:reset:::::resetid:''||new_guid||''">Сменить пароль для online.kapremont68.ru</a>''',
'    );',
'    APEX_MAIL.PUSH_QUEUE;        ',
'END;    '))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(12009855798323215)
,p_process_success_message=>'Проверьте почту для продолжения смены пароля'
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
