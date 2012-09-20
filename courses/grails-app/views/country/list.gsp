<g:applyLayout name="base">
  <content tag="container">

    <g:link action='create'>
      <button class="btn btn-success">
        <i class="icon-plus-sign icon-white"></i>
        <g:message code="country.nav.new" default="New Country" />
      </button>
    </g:link>
    <hr/>

    <div id="list-country" class="content" role="main">
      <g:if test="${flash.message}">
      <div class="alert alert-info" role="status">${flash.message}</div>
      </g:if>
      <table class="table table-striped">
        <thead>
          <tr>

            <g:sortableColumn property="name" title="${message(code: 'country.name.label', default: 'Name')}" />

            <g:sortableColumn property="region" title="${message(code: 'country.region.label', default: 'Region')}" />

            <th>
              <a href="#"><g:message code='country.edit.label' default='Edit' /></a>
            </th>

          </tr>
        </thead>
        <tbody>
        <g:each in="${countryInstanceList}" status="i" var="countryInstance">
          <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td>
              <g:link action="show" id="${countryInstance.id}">
                ${fieldValue(bean: countryInstance, field: "name")}
              </g:link>
            </td>

            <td>${fieldValue(bean: countryInstance, field: "region")}</td>

            <td>
              <g:link action="edit" id="${countryInstance.id}">
                <i class="icon-pencil"></i>
              </g:link>
            </td>

          </tr>
        </g:each>
        </tbody>
      </table>
      <div class="pagination">
        <g:paginate total="${countryInstanceTotal}" />
      </div>
      <script type="text/javascript">
        menu_active("#menu_country");
      </script>
  </content>
</g:applyLayout>
