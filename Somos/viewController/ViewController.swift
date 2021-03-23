//
//  ViewController.swift
//  Somos
//
//  Created by Jayme Antonio da Rosa Caironi on 16/03/21.
//

import UIKit
import FirebaseAuth
//import FirebaseAnalytics
import Firebase
//import FirebaseUI

class ViewController: UIViewController {
    

    @IBOutlet weak var pesquisaUsu: UITextField!
    
    var provider = OAuthProvider(providerID: "github.com")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
/*        let providers: [FUIAuthProvider] = [
          FUIEmailAuth(),
          FUIGoogleAuth(),
          FUIFacebookAuth(),
          FUIPhoneAuth(authUI: FUIAuth.defaultAuthUI()),
          FUIOAuth.appleAuthProvider(),
          FUIOAuth.twitterAuthProvider(),
          FUIOAuth.githubAuthProvider(),
          FUIOAuth.microsoftAuthProvider(),
          FUIOAuth.yahooAuthProvider(),
        ]
        authUI?.providers = providers


        */
 
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
/*    func loginButton(_ loginButton: GitLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
       if let error = error {
          print("Github login with error: \(error.localizedDescription)")
        } else {
          // User logs in successfully and can continue with Firebase Authentication sign-in
        }
      } */
    
    
    
   @IBAction func procurarUsu(_ sender: Any) {
       performSegue(withIdentifier: "segueUsuario", sender: self)
    
    
/*    provider.getCredentialWith(nil) { credential, error in
          if error != nil {
            // Handle error.
          }
          if credential != nil {
            Auth().signIn(with: credential) { authResult, error in
              if error != nil {
                // Handle error.
              }
              // User is signed in.
              // IdP data available in authResult.additionalUserInfo.profile.

              guard let oauthCredential = authResult.credential as? OAuthCredential else { return }
              // GitHub OAuth access token can also be retrieved by:
              // oauthCredential.accessToken
              // GitHub OAuth ID token can be retrieved by calling:
              // oauthCredential.idToken
            }
          }
        }
    
    
    var actionCodeSettings = ActionCodeSettings()
    actionCodeSettings.url = URL(string: "https://example.appspot.com")
    actionCodeSettings.handleCodeInApp = true
    actionCodeSettings.setAndroidPackageName("com.firebase.example", installIfNotAvailable: false, minimumVersion: "12")

    let provider = FUIEmailAuth(authUI: FUIAuth.defaultAuthUI()!,
                                signInMethod: FIREmailLinkAuthSignInMethod,
                                forceSameDevice: false,
                                allowNewEmailAccounts: true,
                                actionCodeSetting: actionCodeSettings)
 
 */
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
       
        if segue.identifier == "segueUsuario"{
            if let destination = segue.destination as? UsuarioViewController {
                destination.pesquisaUsu = pesquisaUsu.text!
            }
        }
    }
}

