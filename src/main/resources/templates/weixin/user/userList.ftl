[#include "/include/header.ftl" /]

    <#list groups as group>
    <li><a href="${group.id}" target="_self">${group.name}(${group.count})</a></li>
    </#list>


[#include "/include/footer.ftl" /]