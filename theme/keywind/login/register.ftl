<#import "./document.ftl" as document>
<#import "components/atoms/button.ftl" as button>
<#import "components/atoms/button-group.ftl" as buttonGroup>
<#import "components/atoms/form-secondary.ftl" as form>
<#import "components/atoms/input.ftl" as input>
<#import "components/atoms/cities.ftl" as cities>
<#import "components/atoms/cancel.ftl" as cancel>


<html>
    <head>
      <@document.kw script=script />
    </head>
    <body class="w-full bg-white pt-10 pb-4 px-2 md:px-4 lg:px-6 flex flex-col items-center">
      <div class="px-6 mb-4 pb-4 w-full border-b border-gray-200">
        <h1 class="text-xl font-semibold text-[#E0252D]">
          Registro de cuenta de usuario
        </h1>
      </div>
      <div class="w-full">
        <@form.kw action=url.registrationAction method="post">
          <div class="w-full bg-gray-100 rounded-lg p-6 flex flex-col gap-10">
            <div class="flex flex-col border-b border-gray-300">
              <div class="flex flex-col gap-1.5">
                <h3 class="text-lg text-gray-700 font-semibold">Información Personal</h3>
                <p class="text-sm text-gray-500">Ingresa tus datos y correo donde <br/> deseas recibir notificaciones.</p>
              </div>
              <div class="flex max-w-md w-full items-center justify-center my-8 mx-auto">
                <div class="w-full">
                  <div class="m-0 space-y-4">
                    <div class="grid grid-cols-2 gap-4 w-full">
                      <@input.kw
                        autocomplete="given-name"
                        autofocus=true
                        invalid=messagesPerField.existsError("firstName")
                        label=msg("firstName")
                        message=kcSanitize(messagesPerField.get("firstName"))
                        name="firstName"
                        type="text"
                        value=(register.formData.firstName)!''
                      />
                      <@input.kw
                        autocomplete="family-name"
                        invalid=messagesPerField.existsError("lastName")
                        label=msg("lastName")
                        message=kcSanitize(messagesPerField.get("lastName"))
                        name="lastName"
                        type="text"
                        value=(register.formData.lastName)!''
                      />
                    </div>
                    <@input.kw
                      autocomplete="email"
                      invalid=messagesPerField.existsError("email")
                      label=msg("email")
                      message=kcSanitize(messagesPerField.get("email"))
                      name="email"
                      type="email"
                      value=(register.formData.email)!''
                    />
                    <@cities.kw />
                  </div>
                </div>
              </div>
            </div>
            <div class="flex flex-col border-b border-gray-300">
              <div class="flex flex-col gap-1.5">
                <h3 class="text-lg text-gray-700 font-semibold">Crear contraseña</h3>
                <p class="text-sm text-gray-500">Registra la nueva contraseña con <br/> la que ingresarás a tu cuenta.</p>
              </div>
              <div class="flex max-w-md w-full items-center justify-center my-8 mx-auto">
                <div class="w-full">
                  <div class="m-0 space-y-4">
                    <@input.kw
                      autocomplete="new-password"
                      invalid=messagesPerField.existsError("password", "password-confirm")
                      label=msg("password")
                      message=kcSanitize(messagesPerField.getFirstError("password", "password-confirm"))
                      name="password"
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
                  </div>
                </div>
              </div>
            </div>
            <div class="flex flex-col">
              <div class="flex max-w-md w-full items-center justify-center my-4 mx-auto">
                <div class="w-full">
                  <div class="m-0">
                    <div class="flex items-center mb-3 gap-3 hover:cursor-pointer">
                      <input type="checkbox" class="rounded hover:cursor-pointer" id="user.attributes.subscribe" name="user.attributes.subscribe"/>
                      <label for="user.attributes.subscribe" class="text-sm hover:cursor-pointer">Acepto recibir boletines y correos informativos (Opcional)</label>
                    </div>
                    <div class="flex items-center mb-3 gap-3 hover:cursor-pointer">
                      <input type="checkbox" class="rounded hover:cursor-pointer" id="user.attributes.terms" name="user.attributes.terms" />
                      <label for="user.attributes.terms" class="text-sm hover:cursor-pointer">Estoy de acuerdo con los <a href="#" target="_blank" class="underline text-gray-600">Términos y Condiciones</a> del sitio y <a href="#" target="_blank" class="underline text-gray-600">Privacidad de Datos</a> (Obligatorio)</label>
                    </div>
                    <div class="grid grid-cols-2 mt-8 gap-4">
                      <@button.kw color="blue" type="submit">
                        ${msg("doRegister")}
                      </@button.kw>
                      <@cancel.kw href=url.loginUrl>
                        ${kcSanitize(msg("Cancelar"))?no_esc}
                      </@cancel.kw>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </@form.kw>
      </div>
    </body>
  </html>

