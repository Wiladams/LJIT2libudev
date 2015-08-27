--[[
	Generate some valid kernel module alias names with:
	find /sys -name modalias -print0 | xargs -0 cat | sort -u

	Some sample modalias values
	acpi:LNXCPU:
	platform:coretemp
	platform:dell-laptop
--]]

return {
'acpi:ACPI0003:',
'acpi:ACPI0008:',
'acpi:BCM0102:PNP0C31:',
'acpi:DLL040A:PNP0F13:',
'acpi:INT0800:',
'acpi:LNXCPU:',
'acpi:LNXPWRBN:',
'acpi:LNXSYBUS:',
'acpi:LNXSYSTM:',
'acpi:LNXVIDEO:',
'acpi:PNP0000:',
'acpi:PNP0100:',
'acpi:PNP0103:',
'acpi:PNP0200:',
'acpi:PNP0303:',
'acpi:PNP0401:',
'acpi:PNP0501:',
'acpi:PNP0A03:',
'acpi:PNP0A05:',
'acpi:PNP0A08:PNP0A03:',
'acpi:PNP0B00:',
'acpi:PNP0C02:',
'acpi:PNP0C04:',
'acpi:PNP0C09:',
'acpi:PNP0C0A:',
'acpi:PNP0C0C:',
'acpi:PNP0C0D:',
'acpi:PNP0C0E:',
'acpi:PNP0C0F:',
'acpi:PNP0C14:',
'acpi:SMO8800:',
'acpi:ZIC0101:',
'cpu:type:x86,ven0000fam0006mod0025:feature:,0000,0001,0002,0003,0004,0005,0006,0007,0008,0009,000B,000C,000D,000E,000F,0010,0011,0013,0015,0016,0017,0018,0019,001A,001B,001C,001D,001F,002B,0034,003B,003D,0068,006B,006C,006D,006F,0070,0072,0074,0075,0076,0078,007C,0080,0081,0082,0083,0084,0085,0086,0087,0088,0089,008D,008E,008F,0091,0093,0094,0097,0099,00C0,00E0,00E1,00E7,0100,0101,0102,0103,0104',
'dmi:bvnDellInc.:bvrA07:bd02/15/2011:svnDellInc.:pnLatitudeE6410:pvr0001:rvnDellInc.:rn0K42JR:rvrA03:cvnDellInc.:ct9:cvr:',
'input:b0000v0000p0000e0000-e0,5,kramlsfw2,',
'input:b0000v0000p0000e0000-e0,5,kramlsfw4,',
'input:b0000v0000p0000e0000-e0,5,kramlsfw6,',
'input:b0000v0000p0000e0000-e0,5,kramlsfw6,8,',
'input:b0003v05CAp1814e0331-e0,1,kD4,ramlsfw',
'input:b0011v0001p0001eAB41-e0,1,4,11,14,k71,72,73,74,75,76,77,79,7A,7B,7C,7D,7E,7F,80,8C,8D,8E,8F,94,98,9B,9C,9D,9E,9F,A2,A3,A4,A5,A6,AC,AD,B7,B8,B9,BF,CD,D4,D7,D9,E0,E1,E2,E3,EC,F0,ram4,l0,1,2,sfw',
'input:b0011v0002p0008e0000-e0,1,2,k110,111,112,r0,1,amlsfw',
'input:b0011v0002p0008e0300-e0,1,3,k110,111,112,145,14A,14D,14E,14F,ra0,1,18,2F,35,36,39,mlsfw',
'input:b0019v0000p0000e0000-e0,1,4,k71,72,73,94,CA,E0,E1,E3,E4,EC,F0,ram4,lsfw',
'input:b0019v0000p0001e0000-e0,1,k74,ramlsfw',
'input:b0019v0000p0003e0000-e0,1,k8E,ramlsfw',
'input:b0019v0000p0005e0000-e0,5,kramlsfw0,',
'input:b0019v0000p0006e0000-e0,1,kE0,E1,E3,F1,F2,F3,F4,F5,ramlsfw',
'pci:v000010DEd00000A6Csv00001028sd0000040Abc03sc00i00',
'pci:v000010DEd00000BE3sv00001028sd0000040Abc04sc03i00',
'pci:v00001180d0000E822sv00001028sd0000040Abc08sc05i01',
'pci:v00001180d0000E832sv00001028sd0000040Abc0Csc00i10',
'pci:v00008086d00000044sv00001028sd0000040Abc06sc00i00',
'pci:v00008086d00000045sv00001028sd0000040Abc06sc04i00',
'pci:v00008086d000010EAsv00001028sd0000040Abc02sc00i00',
'pci:v00008086d00002448sv00001028sd0000040Abc06sc04i01',
'pci:v00008086d00002C62sv00008086sd00008086bc06sc00i00',
'pci:v00008086d00002D01sv00008086sd00008086bc06sc00i00',
'pci:v00008086d00002D10sv00008086sd00008086bc06sc00i00',
'pci:v00008086d00002D11sv00008086sd00008086bc06sc00i00',
'pci:v00008086d00002D12sv00008086sd00008086bc06sc00i00',
'pci:v00008086d00002D13sv00008086sd00008086bc06sc00i00',
'pci:v00008086d00003B07sv00001028sd0000040Abc06sc01i00',
'pci:v00008086d00003B2Fsv00001028sd0000040Abc01sc06i01',
'pci:v00008086d00003B30sv00001028sd0000040Abc0Csc05i00',
'pci:v00008086d00003B32sv00001028sd0000040Abc11sc80i00',
'pci:v00008086d00003B34sv00001028sd0000040Abc0Csc03i20',
'pci:v00008086d00003B3Csv00001028sd0000040Abc0Csc03i20',
'pci:v00008086d00003B42sv00001028sd0000040Abc06sc04i00',
'pci:v00008086d00003B44sv00001028sd0000040Abc06sc04i00',
'pci:v00008086d00003B46sv00001028sd0000040Abc06sc04i00',
'pci:v00008086d00003B48sv00001028sd0000040Abc06sc04i00',
'pci:v00008086d00003B56sv00001028sd0000040Abc04sc03i00',
'pci:v00008086d00003B64sv00001028sd0000040Abc07sc80i00',
'pci:v00008086d00003B67sv00001028sd0000040Abc07sc00i02',
'pci:v00008086d0000422Bsv00008086sd00001121bc02sc80i00',
'platform:alarmtimer',
'platform:coretemp',
'platform:dcdbas',
'platform:dell-laptop',
'platform:Fixed MDIO bus',
'platform:i8042',
'platform:iTCO_wdt',
'platform:microcode',
'platform:pcspkr',
'platform:reg-dummy',
'platform:regulatory',
'platform:serial8250',
'platform:vesa-framebuffer',
'scsi:t-0x00',
'scsi:t-0x05',
'serio:ty01pr00id00ex00',
'serio:ty06pr00id00ex00',
'usb:v05CAp1814d0331dcEFdsc02dp01ic0Eisc01ip00in00',
'usb:v05CAp1814d0331dcEFdsc02dp01ic0Eisc02ip00in01',
'usb:v0A5Cp5801d0101dc00dsc00dp00ic0Bisc00ip00in01',
'usb:v0A5Cp5801d0101dc00dsc00dp00icFEisc00ip00in00',
'usb:v1D6Bp0002d0316dc09dsc00dp00ic09isc00ip00in00',
'usb:v413Cp8187d0517dcE0dsc01dp01icE0isc01ip01in00',
'usb:v413Cp8187d0517dcE0dsc01dp01icE0isc01ip01in01',
'usb:v413Cp8187d0517dcE0dsc01dp01icFEisc01ip00in03',
'usb:v413Cp8187d0517dcE0dsc01dp01icFFiscFFipFFin02',
'usb:v8087p0020d0000dc09dsc00dp01ic09isc00ip00in00',
'wmi:05901221-D566-11D1-B2F0-00A0C9062910',
'wmi:8D9DDCBC-A997-11DA-B012-B622A1EF5492',
'wmi:9DBB5994-A997-11DA-B012-B622A1EF5492',
'wmi:A3776CE0-1E88-11DB-A98B-0800200C9A66',
'wmi:A80593CE-A997-11DA-B012-B622A1EF5492',
}