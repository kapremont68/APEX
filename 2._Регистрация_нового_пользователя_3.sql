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
--   Date and Time:   14:01 Среда Апрель 25, 2018
--   Exported By:     FCR
--   Flashback:       0
--   Export Type:     Page Export
--   Version:         5.1.4.00.08
--   Instance ID:     218235226215706
--

prompt --application/pages/delete_00002
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>2);
end;
/
prompt --application/pages/page_00002
begin
wwv_flow_api.create_page(
 p_id=>2
,p_user_interface_id=>wwv_flow_api.id(11866208218552473)
,p_name=>'Register'
,p_page_mode=>'NORMAL'
,p_step_title=>'Регистрация нового пользователя'
,p_allow_duplicate_submissions=>'N'
,p_warn_on_unsaved_changes=>'N'
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
,p_last_upd_yyyymmddhh24miss=>'20180418165946'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2379394129885548)
,p_plug_name=>'Вход в личный кабинет'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(11823090257552314)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(11869623119706003)
,p_plug_name=>'Регистрация нового пользователя'
,p_icon_css_classes=>'fa-user-plus'
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
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2379570319885550)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(2379394129885548)
,p_button_name=>'Enter'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--link'
,p_button_template_id=>wwv_flow_api.id(11855494343552396)
,p_button_image_alt=>'Вход в личный кабинет'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_redirect_url=>'f?p=&APP_ID.:101:&SESSION.::&DEBUG.:RP::'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(11870107042706004)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(11869623119706003)
,p_button_name=>'SEND_MAIL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(11855494343552396)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Зарегистрировать'
,p_button_position=>'REGION_TEMPLATE_NEXT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(12035478274060017)
,p_branch_name=>'Go Enter'
,p_branch_action=>'f?p=&APP_ID.:101:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11870981001706014)
,p_name=>'P2_PASSWORD'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(11869623119706003)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Пароль'
,p_placeholder=>'придумайте и запомните пароль'
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
 p_id=>wwv_flow_api.id(11871324748706017)
,p_name=>'P2_EMAIL'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(11869623119706003)
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
 p_id=>wwv_flow_api.id(11871785595706018)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Add New User'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    new_guid varchar2(100);',
'BEGIN',
'    #OWNER#.LK_AUTH.ADD_NEW_USER(',
'        P_EMAIL => :P2_EMAIL,',
'        P_PASSWORD => :P2_PASSWORD',
'    );',
'    new_guid := #OWNER#.LK_AUTH.add_email_guid(:P2_EMAIL);',
'    apex_mail.send(',
'            p_to         => :P2_EMAIL,',
'            p_from       => ''online@kapremont68.ru'', ',
'            p_subj       => ''online.kapremont68.ru - Подтверждение регистрации'',',
'            p_body       => ''Для подтвеждения регистрации перейдите по адресу http://online.kapremont68.ru:8080/ords/f?p=lk:confirm:::::guid:''||new_guid,',
'            p_body_html  => ''<a href="http://online.kapremont68.ru:8080/ords/f?p=lk:confirm:::::guid:''||new_guid||''">Подтвердить регистрацию на online.kapremont68.ru</a>''',
'    );',
'    APEX_MAIL.PUSH_QUEUE;        ',
'END;    '))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Проверьте почту для подтверждения регистрации'
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
