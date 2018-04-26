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
--   Date and Time:   13:35 Четверг Апрель 26, 2018
--   Exported By:     FCR
--   Flashback:       0
--   Export Type:     Page Export
--   Version:         5.1.4.00.08
--   Instance ID:     218235226215706
--

prompt --application/pages/delete_00016
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>16);
end;
/
prompt --application/pages/page_00016
begin
wwv_flow_api.create_page(
 p_id=>16
,p_user_interface_id=>wwv_flow_api.id(11866208218552473)
,p_name=>'AddAccount'
,p_page_mode=>'MODAL'
,p_step_title=>'Добавление помещения'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(14461578485778309)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'GERA'
,p_last_upd_yyyymmddhh24miss=>'20180426133351'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(14108807820619945)
,p_plug_name=>'Добавление помещения в "Мои помещения"'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(11832695845552332)
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
 p_id=>wwv_flow_api.id(14109228880619945)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(14108807820619945)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(11855494343552396)
,p_button_image_alt=>'Отмена'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(14109320895619945)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(14108807820619945)
,p_button_name=>'SUBMIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(11855494343552396)
,p_button_image_alt=>'Добавить'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14110113471619948)
,p_name=>'P16_ACC_NUM'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(14108807820619945)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Номер счета'
,p_placeholder=>'номер вашего лицевого счета из квитанции'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_field_template=>wwv_flow_api.id(11854986137552390)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14110569892619948)
,p_name=>'P16_FLAT_NUM'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(14108807820619945)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Номер квартиры (помещения)'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_field_template=>wwv_flow_api.id(11854986137552390)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14110964570619948)
,p_name=>'P16_HOUSE_ID'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(14108807820619945)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Адрес дома'
,p_placeholder=>'выберите адрес дома из списка'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'select ADDR, HOUSE_ID from V_HOUSE_ADDR order by ADDR'
,p_cSize=>50
,p_field_template=>wwv_flow_api.id(11854986137552390)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'    При выборе адреса из списка не листайте весь список целиком, в нем несколько тысяч записей. Воспользуйтесь поиском, он отфильтрует лишнее.',
'</p>',
'<p> В строке поиска используйте знак процента (без пробелов) для разделения элементов адреса:</p>',
'<u>',
'    <li>город%улица%дом</li>',
'    <li>район%населенныйПункт%улица%дом</li>',
'</u>',
'<br>',
'',
'<p>Можно указывать не все элементы (но в правильной последовательности).</p>    ',
'<p>Названия можно писать не полностью.</p>    ',
'<p>Регистр букв не имеет значения.</p>',
'',
'Примеры:',
'<ul>    ',
'<li>тамбов%советская%148</li>',
'<li>кирс%красн%жел</li>',
'<li>строит%южн%15</li>',
'<li>тамб%васил%1</li>',
'</ul>    ',
'',
''))
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(14298698197239726)
,p_name=>'Cancel'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(14109228880619945)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(14298796141239727)
,p_event_id=>wwv_flow_api.id(14298698197239726)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(14111323863619950)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Run Stored Procedure'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#OWNER#.LK_INFO.ADD_USER_ACCOUNT(',
'P_USER_EMAIL => :APP_USER,',
'P_ACC_NUM => :P16_ACC_NUM,',
'P_FLAT_NUM => :P16_FLAT_NUM,',
'P_HOUSE_ID => :P16_HOUSE_ID);'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(14109320895619945)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(14299815586239738)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
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
