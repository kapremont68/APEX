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
--   Date and Time:   15:51 Среда Май 30, 2018
--   Exported By:     FCR
--   Flashback:       0
--   Export Type:     Page Export
--   Version:         5.1.4.00.08
--   Instance ID:     218235226215706
--

prompt --application/pages/delete_00003
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>3);
end;
/
prompt --application/pages/page_00003
begin
wwv_flow_api.create_page(
 p_id=>3
,p_user_interface_id=>wwv_flow_api.id(11866208218552473)
,p_name=>'qqq'
,p_page_mode=>'NORMAL'
,p_step_title=>'qqq'
,p_step_sub_title=>'qqq'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(14539594654014623)
,p_page_template_options=>'#DEFAULT#'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'Y'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'GERA'
,p_last_upd_yyyymmddhh24miss=>'20180529155820'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(37163436093164835)
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
 p_id=>wwv_flow_api.id(23085723930235503)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(37163436093164835)
,p_button_name=>'New'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(11855494343552396)
,p_button_image_alt=>'Go URL'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>':P3_URL'
,p_button_execute_validations=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(23055347400544895)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(37163436093164835)
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
 p_id=>wwv_flow_api.id(23055793235544898)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(37163436093164835)
,p_button_name=>'SUBMIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(11855494343552396)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Добавить'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14359679654151125)
,p_name=>'P3_NEW'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(37163436093164835)
,p_prompt=>'New'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select ADDR, HOUSE_ID from V_HOUSE_ADDR order by ADDR'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(11854986137552390)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14360050721151129)
,p_name=>'P3_HOUSE_ID_1'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(37163436093164835)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Адрес дома'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'select ADDR, HOUSE_ID from V_HOUSE_ADDR order by ADDR'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'найдите адрес дома в списке'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(11854986137552390)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'    При выборе адреса из списка не листайте весь список целиком, в нем несколько тысяч записей. Воспользуйтесь поиском, он отфильтрует лишнее.',
'</p>',
'<p> В строке поиска используйте пробел для разделения элементов адреса:</p>',
'<ul>',
'    <li>город улица дом</li>',
'    <li>район населенныйПункт улица дом</li>',
'</ul>',
'<br>',
'',
'<p>Можно указывать не все элементы (но в правильной последовательности).</p>    ',
'<p>Названия можно писать не полностью.</p>    ',
'<p>Регистр букв не имеет значения.</p>',
'',
'Примеры:',
'<ul>    ',
'<li>тамбов советская 148</li>',
'<li>кирс красн жел</li>',
'<li>строит южн 15</li>',
'<li>тамб васил 1</li>',
'</ul>    ',
'',
''))
,p_attribute_01=>'ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23056112145544900)
,p_name=>'P3_HOUSE_ID'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(37163436093164835)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Адрес дома'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>'select ADDR, HOUSE_ID from V_HOUSE_ADDR order by ADDR'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'найдите адрес дома в списке'
,p_field_template=>wwv_flow_api.id(11854986137552390)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'    При выборе адреса из списка не листайте весь список целиком, в нем несколько тысяч записей. Воспользуйтесь поиском, он отфильтрует лишнее.',
'</p>',
'<p> В строке поиска используйте пробел для разделения элементов адреса:</p>',
'<ul>',
'    <li>город улица дом</li>',
'    <li>район населенныйПункт улица дом</li>',
'</ul>',
'<br>',
'',
'<p>Можно указывать не все элементы (но в правильной последовательности).</p>    ',
'<p>Названия можно писать не полностью.</p>    ',
'<p>Регистр букв не имеет значения.</p>',
'',
'Примеры:',
'<ul>    ',
'<li>тамбов советская 148</li>',
'<li>кирс красн жел</li>',
'<li>строит южн 15</li>',
'<li>тамб васил 1</li>',
'</ul>    ',
'',
''))
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'MW'
,p_attribute_10=>'400'
,p_attribute_14=>'Y'
,p_attribute_15=>'20'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23085815932235504)
,p_name=>'P3_URL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(37163436093164835)
,p_prompt=>'URL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(11854986137552390)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(23058610377544917)
,p_name=>'Cancel'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(23055347400544895)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23059152458544917)
,p_event_id=>wwv_flow_api.id(23058610377544917)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(23057868250544914)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Run Stored Procedure'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#OWNER#.LK_INFO.ADD_USER_ACCOUNT(',
'P_USER_EMAIL => :APP_USER,',
'P_ACC_NUM => :P3_ACC_NUM,',
'P_FLAT_NUM => :P3_FLAT_NUM,',
'P_HOUSE_ID => :P3_HOUSE_ID);'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(23055793235544898)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(23058251029544915)
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
