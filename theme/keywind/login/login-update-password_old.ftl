<#import "layouts/main.ftl" as layout>
<#import "components/atoms/button.ftl" as button>
<#import "components/atoms/button-group.ftl" as buttonGroup>
<#import "components/atoms/checkbox.ftl" as checkbox>
<#import "components/atoms/form.ftl" as form>
<#import "components/atoms/input.ftl" as input>

<@layout.registrationLayout
  displayMessage=!messagesPerField.existsError("password", "password-confirm")
  ;
  section
>
  <#if section="header">
    ${msg("Actualiza tu contraseña")}
  <#elseif section="form">
    <@form.kw action=url.loginAction method="post">
      <input
        autocomplete="username"
        name="username"
        type="hidden"
        value="${username}"
      >
      <input autocomplete="current-password" name="password" type="hidden">
      <@input.kw
        autocomplete="new-password"
        autofocus=true
        invalid=messagesPerField.existsError("password", "password-confirm")
        label=msg("passwordNew")
        name="password-new"
        type="password"
      />
      <ul class="text-sm text-gray-500 pl-2 list-disc list-inside">
        <li>
          Al menos 6 caracteres
        </li>
        <li>
          Al menos 1 letra mayúscula
        </li>
        <li>
          Al menos 1 carácter especial (@#$%&._*)
        </li>
      </ul>
      <@input.kw
        autocomplete="new-password"
        invalid=messagesPerField.existsError("password-confirm")
        label=msg("passwordConfirm")
        message=kcSanitize(messagesPerField.get("password-confirm"))
        name="password-confirm"
        type="password"
      />
      <#if isAppInitiatedAction??>
        <@checkbox.kw
          checked=true
          label=msg("logoutOtherSessions")
          name="logout-sessions"
          value="on"
        />
      </#if>
      <@buttonGroup.kw>
        <#if isAppInitiatedAction??>
          <@button.kw color="blue" type="submit">
            ${msg("Guardar contraseña")}
          </@button.kw>
          <@button.kw color="secondary" name="cancel-aia" type="submit" value="true">
            ${msg("doCancel")}
          </@button.kw>
        <#else>
          <@button.kw color="blue" type="submit">
            ${msg("Guardar contraseña")}
          </@button.kw>
        </#if>
      </@buttonGroup.kw>
    </@form.kw>
  </#if>
</@layout.registrationLayout>
