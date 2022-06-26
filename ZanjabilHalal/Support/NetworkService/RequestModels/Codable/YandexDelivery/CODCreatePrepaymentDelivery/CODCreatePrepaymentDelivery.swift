//
//  CODCreatePrepaymentDelivery.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 25.06.2022.
//
import Foundation

struct CODCreatePrepaymentDelivery {
	
	let optionalReturn     : Bool?
	let skipAct            : Bool?
	let skipClientNotify   : Bool?
	let skipDoorToDoor     : Bool?
	let skipEmergencyNotify: Bool?
	let referralSource     : String?
	let comment            : String?
	let toDateTime         : String?               //"2021-12-08T13:00:00+03:00"
	let emergencyContact   : CODEmergencyContact?
	let sendPackages       : [CODSendPackage]?
	let clientRequirements : CODClientRequirements?
	
	
	enum CodingKeys: String, CodingKey {
		case optionalReturn      = "optional_return" /*Не требуется возврат товаров в случае отмены заказа.
													  Возможные значения:
													  true (курьер оставляет товар себе)
													  false (по умолчанию, требуется вернуть товар)*/
		case skipAct             = "skip_act"          //Не показывать акт
		case skipClientNotify    = "skip_client_notify"//Не отправлять отправителю/получателю смс-нотификации, когда к нему направится курьер.
		case skipDoorToDoor      = "skip_door_to_door" /*Отказ от доставки до двери (выключить опцию "От двери до двери").
													    Возможные значения:
													    true (курьер доставит заказ только на улицу, до подъезда)
													    false (по умолчанию, доставка от двери до двери)*/
		case skipEmergencyNotify = "skip_emergency_notify"//Не отправлять нотификации emergency(получателю) контакту
		case referralSource      = "referral_source"
		case clientRequirements  = "client_requirements"
		case comment             = "comment"
		case toDateTime          = "due" /*Создать заказ к определенному времени (например, заказ на завтра).
		                                Без указания данного поля поиск будет осуществлен на ближайшее время.
		                                Согласуйте с менеджером использование опции!*/
		case emergencyContact    = "emergency_contact" //Информация о контактном лице с номером телефона
		case sendPackages        = "items"             // Информация о отправляемом товаре
		
	}
}

extension CODCreatePrepaymentDelivery: Decodable {
	
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		self.clientRequirements  = try? values.decode(CODClientRequirements.self, forKey: .clientRequirements )
		self.emergencyContact    = try? values.decode(CODEmergencyContact?.self,  forKey: .emergencyContact   )
		self.sendPackages        = try? values.decode([CODSendPackage]?.self,     forKey: .sendPackages       )
		self.comment             = try? values.decode(String?.self,               forKey: .comment            )
		self.toDateTime          = try? values.decode(String?.self,               forKey: .toDateTime         )
		self.referralSource      = try? values.decode(String?.self,               forKey: .referralSource     )
		self.optionalReturn      = try? values.decode(Bool?.self,                 forKey: .optionalReturn     )
		self.skipAct             = try? values.decode(Bool?.self,                 forKey: .skipAct            )
		self.skipClientNotify    = try? values.decode(Bool?.self,                 forKey: .skipClientNotify   )
		self.skipDoorToDoor      = try? values.decode(Bool?.self,                 forKey: .skipDoorToDoor     )
		self.skipEmergencyNotify = try? values.decode(Bool?.self,                 forKey: .skipEmergencyNotify)
	}
}

extension CODCreatePrepaymentDelivery: Encodable {
	
	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(clientRequirements,  forKey: .clientRequirements)
		try container.encode(emergencyContact,    forKey: .emergencyContact)
		try container.encode(sendPackages,        forKey: .sendPackages)
		try container.encode(comment,             forKey: .comment)
		try container.encode(toDateTime,          forKey: .toDateTime)
		try container.encode(referralSource,      forKey: .referralSource)
		try container.encode(optionalReturn,      forKey: .optionalReturn)
		try container.encode(skipAct,             forKey: .skipAct)
		try container.encode(skipClientNotify,    forKey: .skipClientNotify)
		try container.encode(skipDoorToDoor,      forKey: .skipDoorToDoor)
		try container.encode(skipEmergencyNotify, forKey: .skipEmergencyNotify)
	}
}










