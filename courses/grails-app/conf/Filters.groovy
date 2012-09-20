class SecurityFilters {
    def filters = {
        loginCheck(controller: 'index|userCredential', action: '*|external_login', invert: true) {
            before = {
                if (!session.user) {
                    redirect(uri: '/')
                    return false
                }
                return true
            }
        }
    }
}
