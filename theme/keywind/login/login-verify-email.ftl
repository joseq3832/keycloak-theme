<#import "template.ftl" as layout>
<#import "components/atoms/link.ftl" as link>

<@layout.registrationLayout displayInfo=true; section>
    <#if section = "header">
        ${msg("emailVerifyTitle")}
    <#elseif section = "form">
    <div>
      <div class="block mb-4 text-gray-700 px-1">
        <p class="block mb-3">
          ${msg("emailVerifyInstruction1")}
        </p>
        <p>
          ${msg("emailVerifyInstruction2")}
         </p>
      </div>
      <div class="flex items-center justify-center">
        <a href="${url.loginAction}" class="bg-[#E0252D] text-white px-4 py-2 rounded-full w-full text-center text-sm font-semibold" role="button">${msg("emailResend")}</a>
      </div>
      <div class="block mt-4 flex justify-center">
        <@link.kw color="secondary" href=url.loginUrl size="small">
          ${kcSanitize(msg("backToLogin"))?no_esc}
        </@link.kw>
      </div>
    </div>
    </#if>
</@layout.registrationLayout>
