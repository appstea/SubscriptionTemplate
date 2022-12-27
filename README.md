# SubscriptionTemplate

## Clone repo
- Open Xcode
- In top menu choose: Source Control -> Clone...
- Make a copy of template project using your github account

## Run on iOS Simulator
- Open project
- Wait until package dependencies would be resolved
- In Xcode select build & run destination and choose iPhone 14 Pro in iOS Simulators
<img width="436" alt="Screenshot 2022-12-27 at 2 57 48 PM" src="https://user-images.githubusercontent.com/1862110/209677378-5693d775-9d83-4be5-a369-8a390535515a.png">
- In top menu choose: Product -> Run or press cmd + R to run template on iOS Simulator

## Run on iOS Device
- Follow steps from https://developer.apple.com/documentation/xcode/running-your-app-in-simulator-or-on-a-device

## Customize your setup
### Bundle id
- Obtain bundle id for your application
- Open Xcode and add bundle id to project:
<img width="1020" alt="Screenshot 2022-12-27 at 3 07 52 PM" src="https://user-images.githubusercontent.com/1862110/209678213-db029f47-c87f-48fa-84d8-a70024d7b5fc.png">

### Supported devices
- Open project in Xcode
- Select destinations you want to remove
<img width="1073" alt="Screenshot 2022-12-27 at 3 21 28 PM" src="https://user-images.githubusercontent.com/1862110/209680962-cf6a45d4-6c06-4cbd-b804-82b931a96e5b.png">

### Supported localizations
- Follow steps from: https://developer.apple.com/documentation/xcode/adding-support-for-languages-and-regions

These locales are currently supported:
* ar
* en
* es
* fr
* he
* pt-BR
* pr-PT
* ru
* tr
* uk

### Firebase
To setup Firebase you need:
- Register your application in Firebase Console
- Obtain your copy GoogleService-Info.plist file
- Replace existing GoogleService-Info.plist file in project with yours one
<img width="266" alt="Screenshot 2022-12-27 at 3 40 48 PM" src="https://user-images.githubusercontent.com/1862110/209682085-8bc5067a-fad7-4470-bae3-2feef03539e4.png">

Firebase is enabled by default. To disable Firebase in project:
- Open Integration.swift file
<img width="269" alt="Screenshot 2022-12-27 at 3 43 49 PM" src="https://user-images.githubusercontent.com/1862110/209682541-2dffb366-2b61-40b0-894a-659d7444beb0.png">
- Set value `isFirebaseEnabled: true` to `isFirebaseEnabled: false`

### Branch
To setup Branch you need:
- Obtain your Branch key (it should looks like: `key_live_pj3V9nLR39qPjoKPG34IFcjnCDmV0OCI`)
- Open Info.plist file
- Fill your obtained key in field Value for Key `branch_key`

Branch analytics is enabled by default. To disable Branch in project:
- Open Integration.swift file
<img width="269" alt="Screenshot 2022-12-27 at 3 43 49 PM" src="https://user-images.githubusercontent.com/1862110/209682541-2dffb366-2b61-40b0-894a-659d7444beb0.png">
- Set value `isBranchEnabled: true` to `isBranchEnabled: false`

### RevenueCat
- Create your products in RevenueCat (must contain one trial product)
- Open Integration.swift file
<img width="269" alt="Screenshot 2022-12-27 at 3 43 49 PM" src="https://user-images.githubusercontent.com/1862110/209682541-2dffb366-2b61-40b0-894a-659d7444beb0.png">
- Set value `offering: "com.appstea.proto.first"` to `offering: "<your.offering.id.here>"`

### Links
- Open Integration.swift file
<img width="269" alt="Screenshot 2022-12-27 at 3 43 49 PM" src="https://user-images.githubusercontent.com/1862110/209682541-2dffb366-2b61-40b0-894a-659d7444beb0.png">
- Set value `policy: "https://appstea.com/legal/privacy-policy/"` to `policy: "<your_link_to_privacy_policy_here>"`
- Set value `terms: "https://appstea.com/legal/terms-of-use/"` to `terms: "<your_link_to_terms_of_use_here>"`

### Paywall UI
- Open Assets.xcassets file:
<img width="499" alt="Screenshot 2022-12-27 at 4 01 25 PM" src="https://user-images.githubusercontent.com/1862110/209684581-dbc03566-0db4-4cb6-9199-245eaf234361.png">
- Add you image in Folder Images:
<img width="499" alt="Screenshot 2022-12-27 at 4 01 18 PM" src="https://user-images.githubusercontent.com/1862110/209684628-8e8f19ad-2e1b-4024-9e41-f3a9fa70a0fa.png">
- Open Integration.swift file
<img width="269" alt="Screenshot 2022-12-27 at 3 43 49 PM" src="https://user-images.githubusercontent.com/1862110/209682541-2dffb366-2b61-40b0-894a-659d7444beb0.png">
- Replace code:
`
fileprivate extension Config.UI.Paywall {

  static func custom() -> Self? {
    nil
//    var result = Self()
//    result.textColor = .red
//    return result
  }

}
`
with code:
`fileprivate extension Config.UI.Paywall {

  static func custom() -> Self? {
    var result = Self()
    if let image = UIImage(named: "<your_image_name_here>") {
      result.image = .init(image)
    }
    return result
  }
  
}`

Content of Free and Paid screens are located in files 
FreeViewController.swift:

<img width="281" alt="Screenshot 2022-12-27 at 4 38 54 PM" src="https://user-images.githubusercontent.com/1862110/209688917-6da0543a-9202-437a-b354-e7c78b7191ce.png">

and PaidViewController.swift:

<img width="280" alt="Screenshot 2022-12-27 at 4 39 00 PM" src="https://user-images.githubusercontent.com/1862110/209688932-4e2266cf-51df-4b18-83d2-153ae49c20c7.png">

