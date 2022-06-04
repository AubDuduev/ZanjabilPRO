//
//  RegistrationServices.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 06.03.2022.
//
import Resolver

extension Resolver: ResolverRegistering {

    public static func registerAllServices() {
       
        self.application()
        
        self.simple()
        
    }
    
    private static func simple(){
        Resolver.register {
            JSONEncoderService()
        }
        
        Resolver.register {
            TestingAddressService()
        }
        
        Resolver.register {
            WarningService()
        }
        
        Resolver.register {
            MainCollectionViewsBuilder()
        }
        
        Resolver.register {
            NetworkService()
        }
        
        Resolver.register {
            InfoAlertService()
        }
        
        Resolver.register {
            LoadingService()
        }
        
        Resolver.register {
            LottieService()
        }
        
        Resolver.register {
            OrdersService()
        }
        
        Resolver.register {
            AlertService()
        }

		Resolver.register {
			FeedbackGeneratorService()
		}
		
		Resolver.register {
			RequestsRESTService()
		}
    }
    
    private static func application(){
        
        Resolver.register {
            AddressesService()
        }
        .scope(.application)
        
        Resolver.register {
            MainTabBarRouter()
        }
        .scope(.application)
        
        Resolver.register {
            MainCreateController()
        }
        .scope(.application)
        
        Resolver.register {
            MainViewControllersBuilder()
        }
        .scope(.application)
        
        Resolver.register {
            MainRouter()
        }
        .scope(.application)
        
        Resolver.register {
            MainViewsBuilder()
        }
        .scope(.application)
        
        Resolver.register {
            CoreDataService()
        }
        .scope(.application)
        
        Resolver.register {
            LocalBasketService()
        }
        .scope(.application)
        
        Resolver.register {
            CreateAddressService()
        }
        .scope(.application)
        
        Resolver.register {
            MainCellsBuilder()
        }
        .scope(.application)
        
        Resolver.register {
            MenuService()
        }
        .scope(.application)
		
		Resolver.register {
			ChangeCurrentCategoryService()
		}
		.scope(.application)
		
		Resolver.register {
			ChangeUserNameService()
		}
		.scope(.application)
		
		Resolver.register {
			LocationService()
		}
		.scope(.application)
		
		Resolver.register {
			YandexMapService()
		}
		.scope(.application)
		
		Resolver.register {
			DaDataService()
		}
		.scope(.application)
		
		Resolver.register {
			MapService()
		}
		.scope(.application)
		
    }
}

