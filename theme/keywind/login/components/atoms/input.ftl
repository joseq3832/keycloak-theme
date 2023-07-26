<#macro
  kw
  autofocus=false
  disabled=false
  invalid=false
  label=""
  message=""
  name=""
  required=true
  rest...
>
  <div>
    <label class="mb-1 ml-2 text-sm text-gray-500" for="${name}">
      ${label}
    </label>
    <input
      <#if autofocus>autofocus</#if>
      <#if disabled>disabled</#if>
      <#if required>required</#if>

      aria-invalid="${invalid?c}"
      class="block border-secondary-200 mt-1 rounded-md w-full focus:border-primary-300 focus:ring focus:ring-primary-200 focus:ring-opacity-50 sm:text-sm"
      id="${name}"
      name="${name}"
      <#--  placeholder="${label}"  -->

      <#list rest as attrName, attrValue>
        ${attrName}="${attrValue}"
      </#list>
    >
    <#if invalid?? && message??>
      <div class="mt-2 text-red-600 text-sm">
        ${message?no_esc}
      </div>
    </#if>
    <div class="mt-2 text-red-600 text-sm" id="${name}-required-message" style="display: none;">
      Campo Requerido
    </div>
  </div>
  <script>
    // JavaScript code to show/hide the required message for each component
    (function() {
      const inputElement = document.getElementById("${name}");
      const requiredMessageElement = document.getElementById("${name}-required-message");

      inputElement.addEventListener("input", () => {
        const value = inputElement.value.trim();
        if (value === "") {
          requiredMessageElement.style.display = "block";
        } else {
          requiredMessageElement.style.display = "none";
        }
      });
    })();
  </script>
</#macro>
