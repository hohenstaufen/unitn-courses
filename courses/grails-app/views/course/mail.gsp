<g:applyLayout name="base">

  <content tag="container">

    <h2><g:message code="course.mail.title" default="Send mail" /></h2>

    <g:form method="post">
      <fieldset>
        <g:hiddenField name="id" value="${courseInstance?.id}" />
        <richui:richTextEditor name="mail_text" value="" width="525" />
        <div class="form-actions">
          <g:actionSubmit action="mail_send" class="btn btn-success" value="${message(code: 'course.send.label', default: 'Send')}" />
        </div>
      </fieldset>
    </g:form>

  </content>

</g:applyLayout>
