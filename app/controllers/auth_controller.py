from app.services.auth_service import Auth_Login_Service, Recover_Password_Service, Register_Service


class AuthController:
    def __init__(self):
        self.service_login = Auth_Login_Service()
        self.service_password = Recover_Password_Service()
        self.service_register = Register_Service()

    def login(self):
        return self.service_login.Login_Service()

    def logout(self):
        return self.service_login.Logout_Service()

    def verify_mfa(self):
        return self.service_login.Verify_MFA_Service()

    def recover_password_code(self):
        return self.service_password.Recover_Password()

    def recover_password_verify(self):
        return self.service_password.Verify_Code()
    
    def recover_password_new(self):
        return self.service_password.New_Password()

    def register(self):
        return self.service_register.Register()
    