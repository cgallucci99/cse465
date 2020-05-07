import sys

def isLongPhoneNumber(str):
    return False

def isLongPhoneNumber2(str):
    return False

def isRealLiteralPart1(str):
    return False
    
def isEmailAddress(str):
    return False

if __name__ == "__main__":
	print(isLongPhoneNumber("513-529-1809"))
	print(isLongPhoneNumber(" 513-529-1809 "))
	print(isLongPhoneNumber("513 529 1809"))
	print(isLongPhoneNumber("013-529-1809"))

	print(isLongPhoneNumber2("513-529-1809"))
	print(isLongPhoneNumber2("513-029-1809"))
	print(isLongPhoneNumber2("013-529-1809"))
	print(isLongPhoneNumber2("013-029-1809"))
	
	print(isRealLiteralPart1("12.0"))
	print(isRealLiteralPart1("0.0E-12"))
	print(isRealLiteralPart1(".-12"))

	print(isEmailAddress("johndoe@domainsample.com"))
	print(isEmailAddress("john.doe@domainsample.net"))
	print(isEmailAddress("john.doe43@domainsample.co.uk"))
	print(isEmailAddress("@domainsample.com"))

	print(isEmailAddress("johndoedomainsample.com"))
	print(isEmailAddress("john.doe@.net"))
	print(isEmailAddress("john.doe43@domainsample"))
