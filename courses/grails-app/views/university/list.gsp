<g:applyLayout name="base">
  <content tag="container">

    <g:link action='create'>
      <button class="btn btn-success">
        <i class="icon-plus-sign icon-white"></i>
        <g:message code="university.nav.new" default="New university" />
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

            <g:sortableColumn property="nameUniversity" title="${message(code: 'university.nameUniversity.label', default: 'University Name')}" />
            <g:sortableColumn property="country" title="${message(code: 'university.country.label', default: 'Country')}" />
            <g:sortableColumn property="location" title="${message(code: 'university.location.label', default: 'Location')}" />

            <th>
              <a href="#"><g:message code='country.edit.label' default='Edit' /></a>
            </th>

          </tr>
        </thead>
        <tbody>
        <g:each in="${universityInstanceList}" status="i" var="universityInstance">
          <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td><g:link action="show" id="${universityInstance.id}">${fieldValue(bean: universityInstance, field: "nameUniversity")}</g:link></td>

            <td>
              <g:if test="${universityInstance.country}">
                ${fieldValue(bean: universityInstance.country, field: "name")}
                <g:if test="${universityInstance.country.region}">
                  - ${fieldValue(bean: universityInstance.country, field: "region")}
                </g:if>
              </g:if>
            </td>

            <td>${fieldValue(bean: universityInstance, field: "location")}</td>

            <td>
              <g:link action="edit" id="${universityInstance.id}">
                <i class="icon-pencil"></i>
              </g:link>
            </td>

          </tr>
        </g:each>
        </tbody>
      </table>
      <div class="pagination">
        <g:paginate total="${universityInstanceTotal}" />
      </div>
    </div>
    <script type="text/javascript">
      menu_active("#menu_university");
    </script>
  </content>
</g:applyLayout>
