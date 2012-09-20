class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller:"index", action:"index")
        "500"(view:'/error')
        // mapping for external supervisor login (by token)
        "/supervisor/external_login/$token"(controller: "supervisor", action: "external_login")
    }

}
