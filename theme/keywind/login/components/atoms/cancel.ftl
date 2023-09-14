<#macro kw color="" component="a" size="" rest...>
    <${component}
    class="bg-white text-white h-fit focus:ring-gray-700 hover:bg-gray-100/90 !text-black border border-gray-300 w-full px-5 px-4 py-2 text-sm flex justify-center rounded-lg focus:outline-none focus:ring-2 focus:ring-offset-2"

    <#list rest as attrName, attrValue>
      ${attrName}="${attrValue}"
    </#list>
  >
    <#nested>
  </${component}>
</#macro>
