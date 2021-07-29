<?xml version="1.0" encoding="UTF-8"?>
<!-- DTE_v1.2 to UBL 2.1 Colombia (Gosocket) :: By Eric Van Boxsom - Juan Camilo Arce :: Version 2.1.27 :: Last Update: 28-07-2021  - Juan Camilo Arce
	
										:::::::::::::::::::::::::::::::::::::::::
										:::::::::Release Notes 2.1.27 ::::::::::::
										:::::::::::::::::::::::::::::::::::::::::
										:::::::::PRODUCTION ENVIRONMENT::::::::::
										:::::::::::::::::::::::::::::::::::::::::
- Fixed TaxTotal at detail level.
- Fixed WithholdingTaxTotal at detail level.
- Change the structure of the QRCode.
- Change the condition of the Contact of the receiver. 
- Added QRCode into the Personalizados section.
- Added Condition for UUID in Contingency Invoice
- Added more reference document types: 04
- Fix the Coutry name of the Receptor
- Added PricingReference at detail level for CN and DN.
- Fix the namespace sts for CN and DN.
- Change the place where AllowanceCharge are in the Credit Note
- Change the value BaseAmount of the AllowanceCharge for all documents
- Added payableroundingamount in the LegalMonetaryTotal for Invoice, CN and DN.
- Added 3 decimal to the Percent in all kind of WithholdingTaxTotal (Invoice).
- Added ImpresionReferencia into the Personalizados section.
- Addes StandardItemIdentification with code 999 for Invoice.
- Change de value ActualDeliveryDate and ActualDeliveryTime for Invoice, CN and DN.
- Change the value of the Tag Note for Invoice, Cn and DN
- Added StandardItemIdentification with code EAN13 for Invoice, CN and DN 
- Added PartyIdentification when AdditionalAccountID=2 for Invoice, CN and DN
- Added a contdition for the StandardItemIdentification for Inoice, CN and DN.
- Addes IssueDate for ReceiptDocumentReference and DespatchDocumentReference for Invoice, CN and DN.(2.1.21)
- Change the value BaseAmount of the AllowanceCharge for all documents (2.1.21)
- Add a condicion for InformationContentProviderParty the codes 20,22,23 and 30,32,33 for CN and DN.(2.1.21)
- Add custom tag HoraGeneracion and FechaGeneracion por FV,CN and DN .(2.1.21)
- Add condition for Billing reference when the reference is a prepaid reference for FV,CN and DN .(
- Add the Tag SupplierAssignedAccountID into the AccountingCustomerParty for Invoice, CN and DN (2.1.22)
- Change the condition for the PrepaidPayment method for Invoice(2.1.22)
- Add InvoicePeriod por CN and DN (2.1.23)
- Add a new kind of document (102 -Nomina Individual)(103 Nomina individaul de Ajuste) (2.1.25)
- Remove the namespaces at the global stylesheet xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
	xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:sts="dian:gov:co:facturaelectronica:Structures-2-1"(2.1.25)
- Change the position of the namespace xmlns:fn="http://www.w3.org/2005/xpath-functions" (2.1.25)
- Add the Transport information at the level of the details (2.1.25)
- Se modifico la logica del campo del contacto del emisor, en caso de no tener email se registrara por defecto col_intercambio@einvoicing.signature-cloud.com para la FV, NC y ND. (2.1.26)
- Se agrego las variables SumImpBase01, SumImpBase02, SumImpBase03, SumImpBase04 en la seccion de totales de los impuestos para calcular el RoundingAmount para la FV, NC y ND. (2.1.26)
- Se agrego el elemento RoundingAmount a nivel de impuestos 01,02, 03 y 04 para la FV, NC y ND. (2.1.26)
- Se agrego las variables SumBaseImpDet01, SumBaseImpDet02, SumBaseImpDet03, SumBaseImpDet04 en la seccion de los detalles de los impuestos para calcular el RoundingAmount para la FV, NC y ND. (2.1.26)
- Se agrego el elemento RoundingAmount a nivel de impuestos 01,02, 03 y 04 a nivel de detalle para la FV, NC y ND. (2.1.26)
- Se agrega al ProfileID de la FV DIAN 2.1: Factura Electrónica de Venta (2.1.27)
- Se agrega al ProfileID de la NC DIAN 2.1: Nota Crédito de Factura Electrónica de Venta. (2.1.27)
- Se agrega al ProfileID de la ND DIAN 2.1: Nota Débito de Factura Electrónica de Venta. (2.1.27)
- Se modifica la logica de RegistrationAddress para el adquiriente linea 1433 FV. (2.1.27)
- Se modifica la logica de RegistrationAddress para el adquiriente linea 6575 NC. (2.1.27)
- Se modifica la logica de RegistrationAddress para el adquiriente linea 10984 ND. (2.1.27) 
- Se modifica la logica para el Identificador del tributo del adquiriente para el numero de documento del receptor sea igual a '222222222222' FV, NC, ND. (2.1.27)
-->
<xsl:stylesheet version="3.0" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
	xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xades="http://uri.etsi.org/01903/v1.3.2#"
	xmlns:xades141="http://uri.etsi.org/01903/v1.4.1#">
	<xsl:output method="xml" encoding="UTF-8" omit-xml-declaration="no" indent="yes"/>
	<xsl:template match="/">
		
		<xsl:variable name="DocType" select="if (exists(/DTE/Documento/Encabezado/IdDoc/Tipo)) then normalize-space(/DTE/Documento/Encabezado/IdDoc/Tipo) else normalize-space(/DTE/Documentos/Nomina/Resumen/TipoNomina) "/>
		<!--<xsl:variable name="DocTypeNomina" select="normalize-space(/DTE/Documentos/Nomina/Resumen/TipoNomina)"/>-->
		<xsl:if test="$DocType = '01'">
			<xsl:call-template name="INVOICE"/>
		</xsl:if>
		<xsl:if test="$DocType = '02'">
			<xsl:call-template name="INVOICE"/>
		</xsl:if>
		<xsl:if test="$DocType = '03'">
			<xsl:call-template name="INVOICE"/>
		</xsl:if>
		<xsl:if test="$DocType = '04'">
			<xsl:call-template name="INVOICE"/>
		</xsl:if>
		<xsl:if test="$DocType = '05'">
			<xsl:call-template name="INVOICE"/>
		</xsl:if>
		<xsl:if test="$DocType = '07' or $DocType = '91'">
			<xsl:call-template name="CREDITNOTE"/>
		</xsl:if>
		<xsl:if test="$DocType = '08' or $DocType = '92'">
			<xsl:call-template name="DEBITNOTE"/>
		</xsl:if>
		<xsl:if test="$DocType = '102'">
			<xsl:call-template name="NominaIndividual"/>
		</xsl:if>
		<xsl:if test="$DocType = '103'">
			<xsl:call-template name="NominaIndividualDeAjuste"/>
		</xsl:if>
		<xsl:if test="boolean(/Response)">
			<xsl:call-template name="RESPONSE"/>
		</xsl:if>
	</xsl:template>
	<xsl:template name="INVOICE">
		<!--Gosocket DTE v1.2 CO to UBL 2.1 OASIS Oficial-->
		<Invoice xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
			xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
			xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
			xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
			xmlns:sts="dian:gov:co:facturaelectronica:Structures-2-1"
			xmlns:xades="http://uri.etsi.org/01903/v1.3.2#"
			xmlns:xades141="http://uri.etsi.org/01903/v1.4.1#"
			xmlns:fn="http://www.w3.org/2005/xpath-functions">
			<!--xsi:schemaLocation="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2 
			http://docs.oasis-open.org/ubl/os-UBL-2.1/xsd/maindoc/UBL-Invoice-2.1.xsd">-->
			
			<!--var CurrencyType-->
			<xsl:variable name="MonedaC" select="normalize-space(//Moneda)"/>
			<!-- var CUFEString -->
			<xsl:variable name="CUFEString">
				<xsl:value-of
					select="
						concat(/DTE/Documento/Encabezado/IdDoc/Serie, /DTE/Documento/Encabezado/IdDoc/Numero, substring(/DTE/Documento/Encabezado/IdDoc/FechaEmis, 1, 10), if (string-length(substring-after(/DTE/Documento/Encabezado/IdDoc/FechaEmis, 'T')) != 9) then
						concat(substring-after(/DTE/Documento/Encabezado/IdDoc/FechaEmis, 'T'), '-05:00')
						else
							concat(substring(/DTE/Documento/Encabezado/IdDoc/FechaEmis, 12, 8), '-05:00'), format-number(/DTE/Documento/Encabezado/Totales/SubTotal, '#0.00'), '01', if (not(/DTE/Documento/Encabezado/Impuestos[TipoImp = '01']/MontoImp)) then
							'0.00'
						else
							format-number(sum(/DTE/Documento/Encabezado/Impuestos[TipoImp = '01']/MontoImp), '#0.00'), '04', if (not(/DTE/Documento/Encabezado/Impuestos[TipoImp = '04']/MontoImp)) then
							'0.00'
						else
							format-number(sum(/DTE/Documento/Encabezado/Impuestos[TipoImp = '04']/MontoImp), '#0.00'), '03', if (not(/DTE/Documento/Encabezado/Impuestos[TipoImp = '03']/MontoImp)) then
							'0.00'
						else
							format-number(sum(/DTE/Documento/Encabezado/Impuestos[TipoImp = '03']/MontoImp), '#0.00'), format-number(/DTE/Documento/Encabezado/Totales/VlrPagar, '#0.00'), /DTE/Documento/Encabezado/Emisor/IDEmisor, /DTE/Documento/Encabezado/Receptor/DocRecep/NroDocRecep, /DTE/Documento/CAE/ClaveTC, /DTE/Documento/Encabezado/IdDoc/Ambiente)"
				/>
			</xsl:variable>
			<xsl:variable name="CodigoSoftware">
				<xsl:choose>
					<xsl:when test="/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo'">
						<xsl:text>fa326ca7-c1f8-40d3-a6fc-24d7c1040607</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>56f2ae4e-9812-4fad-9255-08fcfcd5ccb0</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<!--EXTENSIONES DEFINIDAS POR DIAN-->
			<xsl:element name="ext:UBLExtensions">
				<xsl:element name="ext:UBLExtension">
					<xsl:element name="ext:ExtensionContent">
						<sts:DianExtensions>
							<xsl:element name="sts:InvoiceControl">
								<xsl:element name="sts:InvoiceAuthorization">
									<xsl:value-of select="/DTE/Documento/CAE/NroResolucion"/>
								</xsl:element>
								<xsl:element name="sts:AuthorizationPeriod">
									<xsl:element name="cbc:StartDate">
										<xsl:value-of select="/DTE/Documento/CAE/FechaResolucion"/>
									</xsl:element>
									<xsl:choose>
										<xsl:when
											test="/DTE/Documento/CAE/Plazo != '' and string(normalize-space(/DTE/Documento/CAE/Plazo)) castable as xs:date">
											<xsl:element name="cbc:EndDate">
												<xsl:value-of select="/DTE/Documento/CAE/Plazo"/>
											</xsl:element>
										</xsl:when>
										<xsl:when
											test="/DTE/Documento/CAE/Plazo != '' and string(normalize-space(/DTE/Documento/CAE/Plazo)) castable as xs:integer">
											<xsl:element name="cbc:EndDate">
												<xsl:value-of
												select="xs:date(/DTE/Documento/CAE/FechaResolucion) + xs:yearMonthDuration(concat('P', /DTE/Documento/CAE/Plazo, 'M'))"
												/>
											</xsl:element>
										</xsl:when>
										<xsl:otherwise>
											<xsl:element name="cbc:EndDate">
												<xsl:value-of
												select="xs:date(/DTE/Documento/CAE/FechaResolucion) + xs:yearMonthDuration('P18M')"
												/>
											</xsl:element>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:element>
								<xsl:element name="sts:AuthorizedInvoices">
									<xsl:choose>
										<xsl:when test="/DTE/Documento/CAE/Serie != ''">
											<xsl:element name="sts:Prefix">
												<xsl:value-of select="/DTE/Documento/CAE/Serie"/>
											</xsl:element>
										</xsl:when>
										<xsl:otherwise/>
									</xsl:choose>
									<xsl:element name="sts:From">
										<xsl:value-of select="/DTE/Documento/CAE/NumeroInicial"/>
									</xsl:element>
									<xsl:element name="sts:To">
										<xsl:value-of select="/DTE/Documento/CAE/NumeroFinal"/>
									</xsl:element>
								</xsl:element>
							</xsl:element>
							<xsl:element name="sts:InvoiceSource">
								<xsl:element name="cbc:IdentificationCode">
									<xsl:attribute name="listAgencyID">
										<xsl:text>6</xsl:text>
									</xsl:attribute>
									<xsl:attribute name="listAgencyName">
										<xsl:text>United Nations Economic Commission for Europe</xsl:text>
									</xsl:attribute>
									<xsl:attribute name="listSchemeURI">
										<xsl:text>urn:oasis:names:specification:ubl:codelist:gc:CountryIdentificationCode-2.1</xsl:text>
									</xsl:attribute>
									<xsl:text>CO</xsl:text>
								</xsl:element>
							</xsl:element>
							<xsl:element name="sts:SoftwareProvider">
								<xsl:element name="sts:ProviderID">
									<xsl:attribute name="schemeID">
										<xsl:choose>
											<xsl:when test="/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo'">
												<xsl:call-template name="calculNIT-dv">
													<xsl:with-param name="NIT">
														<xsl:text>800197268</xsl:text>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="calculNIT-dv">
													<xsl:with-param name="NIT">
														<xsl:text>900508908</xsl:text>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
									<xsl:attribute name="schemeName">
										<xsl:text>31</xsl:text>
									</xsl:attribute>
									<xsl:attribute name="schemeAgencyID">
										<xsl:text>195</xsl:text>
									</xsl:attribute>
									<xsl:attribute name="schemeAgencyName">
										<xsl:text>CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)</xsl:text>
									</xsl:attribute>
									<xsl:choose>
										<xsl:when test="/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo'">
											<!-- NIT DIAN como proveedor tecnologico (Facturador Gratuito) -->
											<xsl:text>800197268</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<!-- NIT Gosocket como proveedor tecnologico (Todos los productos) -->
											<xsl:text>900508908</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:element>
								<xsl:element name="sts:SoftwareID">
									<xsl:attribute name="schemeAgencyID">
										<xsl:text>195</xsl:text>
									</xsl:attribute>
									<xsl:attribute name="schemeAgencyName">
										<xsl:text>CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)</xsl:text>
									</xsl:attribute>
									<xsl:choose>
										<xsl:when
											test="/DTE/Documento/Encabezado/IdDoc/Area/IdArea != ''">
											<xsl:value-of
												select="/DTE/Documento/Encabezado/IdDoc/Area/IdArea"
											/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="$CodigoSoftware"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:element>
							</xsl:element>
							<xsl:element name="sts:SoftwareSecurityCode">
								<xsl:attribute name="schemeAgencyID">
									<xsl:text>195</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="schemeAgencyName">
									<xsl:text>CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)</xsl:text>
								</xsl:attribute>
								<xsl:choose>
									<!-- Test si existe Codigo Software y Pin software en DTE. -->
									<xsl:when test="/DTE/Documento/Encabezado/IdDoc/Area/IdArea != '' and /DTE/Documento/Encabezado/IdDoc/Area/IdRevision != ''">
										<!-- Clave seguridad del software en caso de tener la informacion en DTE. -->
										<xsl:variable name="CodigoSeguridad">
											<xsl:value-of select="concat(/DTE/Documento/Encabezado/IdDoc/Area/IdArea, /DTE/Documento/Encabezado/IdDoc/Area/IdRevision, /DTE/Documento/Encabezado/IdDoc/Serie, /DTE/Documento/Encabezado/IdDoc/Numero)" />
										</xsl:variable>
										<xsl:value-of select="$CodigoSeguridad" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:choose>
											<xsl:when test="/DTE/Documento/Encabezado/IdDoc/Ambiente = 2">
												<!-- Si es ambiente de pruebas -->
												<xsl:variable name="CodigoSeguridad">
													<xsl:value-of select="concat($CodigoSoftware, '20191', /DTE/Documento/Encabezado/IdDoc/Serie, /DTE/Documento/Encabezado/IdDoc/Numero)" />
												</xsl:variable>
												<xsl:value-of select="$CodigoSeguridad"/>
											</xsl:when>
											<xsl:otherwise>
												<!-- Si es ambiente de producción -->
												<xsl:variable name="CodigoSeguridad">
													<xsl:value-of select="concat($CodigoSoftware, '20191', /DTE/Documento/Encabezado/IdDoc/Serie, /DTE/Documento/Encabezado/IdDoc/Numero)" />
												</xsl:variable>
												<xsl:value-of select="$CodigoSeguridad"/>
												<!--<xsl:value-of
												select="crypto:hash($CodigoSeguridad, 'SHA-384')"
												/>-->
											</xsl:otherwise>
										</xsl:choose>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:element>
							<xsl:element name="sts:AuthorizationProvider">
								<xsl:element name="sts:AuthorizationProviderID">
									<xsl:attribute name="schemeID">
										<xsl:call-template name="calculNIT-dv">
											<xsl:with-param name="NIT">
												<xsl:text>800197268</xsl:text>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:attribute>
									<xsl:attribute name="schemeName">
										<xsl:text>31</xsl:text>
									</xsl:attribute>
									<xsl:attribute name="schemeAgencyID">
										<xsl:text>195</xsl:text>
									</xsl:attribute>
									<xsl:attribute name="schemeAgencyName">
										<xsl:text>CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)</xsl:text>
									</xsl:attribute>
									<xsl:text>800197268</xsl:text>
								</xsl:element>
							</xsl:element>
							<xsl:element name="sts:QRCode">
								<xsl:variable name="CUFE">
									<!--<xsl:value-of select="crypto:hash($CUFEString, 'SHA-384')"/>-->
									<xsl:value-of select="$CUFEString"/>
								</xsl:variable>
								<!--<xsl:value-of select="concat('FechaFactura=',substring(/DTE/Documento/Encabezado/IdDoc/FechaEmis, 1, 10))"/>
								<xsl:text>
								</xsl:text>-->
								<xsl:choose>
									<xsl:when test="/DTE/Documento/Encabezado/IdDoc/Ambiente = 2 and not(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo')">
										<xsl:value-of select="concat('https://catalogo-vpfe-hab.dian.gov.co/document/searchqr?documentkey=',$CUFE)"/>
									</xsl:when>
									<xsl:when test="/DTE/Documento/Encabezado/IdDoc/Ambiente = 1 and not(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo')">
										<xsl:value-of select="concat('https://catalogo-vpfe.dian.gov.co/document/searchqr?documentkey=',$CUFE)"/>
									</xsl:when>
									<xsl:when test="/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo'">
										<xsl:value-of select="concat('https://catalogo-vpfe.dian.gov.co/document/searchqr?documentkey=',$CUFE)"/>
									</xsl:when>
								</xsl:choose>
							</xsl:element>
						</sts:DianExtensions>
					</xsl:element>
				</xsl:element>
				<!-- Lugar donde va la firma digital -->
				<!--<xsl:element name="ext:UBLExtension">
					<xsl:element name="ext:ExtensionContent"/>
				</xsl:element>-->
			</xsl:element>
			<!--VersionUBL-->
			<xsl:element name="cbc:UBLVersionID">
				<xsl:text>UBL 2.1</xsl:text>
			</xsl:element>
			<!--Customization ID-->
			<xsl:element name="cbc:CustomizationID">
				<xsl:choose>
					<xsl:when
						test="not(/DTE/Documento/Encabezado/IdDoc/TipoServicio) or /DTE/Documento/Encabezado/IdDoc/TipoServicio = ''">
						<xsl:text>10</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/TipoServicio"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<!--VersionProfile-->
			<xsl:element name="cbc:ProfileID">
				<xsl:text>DIAN 2.1: Factura Electrónica de Venta</xsl:text>
			</xsl:element>
			<!--Ambiente de destino-->
			<xsl:variable name="Ambiente">
				<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/Ambiente"/>
			</xsl:variable>
			<xsl:element name="cbc:ProfileExecutionID">
				<xsl:value-of select="$Ambiente"/>
			</xsl:element>
			<!--Number of the Invoice-->
			<xsl:element name="cbc:ID">
				<xsl:value-of
					select="normalize-space(concat(/DTE/Documento/Encabezado/IdDoc/Serie, /DTE/Documento/Encabezado/IdDoc/Numero))"
				/>
			</xsl:element>
			<!--CUFE of the Invoice-->
			<xsl:element name="cbc:UUID">
				<xsl:attribute name="schemeID">
					<xsl:value-of select="$Ambiente"/>
				</xsl:attribute>
				<xsl:choose>
					<xsl:when test="/DTE/Documento/Encabezado/IdDoc/Tipo !='03'">
						<xsl:attribute name="schemeName">
						<xsl:text>CUFE-SHA384</xsl:text></xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="schemeName">
						<xsl:text>CUDE-SHA384</xsl:text></xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:variable name="CUFE">
					<!--<xsl:value-of select="crypto:hash($CUFEString, 'SHA-384')"/>-->
					<xsl:value-of select="$CUFEString"/>
				</xsl:variable>
				<xsl:value-of select="$CUFE"/>
			</xsl:element>
			<!--Issuing Date of the document -->
			<xsl:element name="cbc:IssueDate">
				<xsl:value-of select="substring(/DTE/Documento/Encabezado/IdDoc/FechaEmis, 1, 10)"/>
			</xsl:element>
			<!--Issuing Time of the document -->
			<xsl:element name="cbc:IssueTime">
				<xsl:value-of
					select="concat(substring(/DTE/Documento/Encabezado/IdDoc/FechaEmis, 12, 8), '-05:00')"
				/>
			</xsl:element>
			<!--Due Date -->
			<!--<xsl:if test="/DTE/Documento/Encabezado/IdDoc/FechaVenc != ''">
				<xsl:element name="cbc:DueDate">
					<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/FechaVenc"/>
				</xsl:element>
			</xsl:if>-->
			<!--Document Type-->
			<xsl:element name="cbc:InvoiceTypeCode">
				<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/Tipo"/>
			</xsl:element>
			<xsl:if test="/DTE/Documento/Encabezado/IdDoc/IndServicio != ''">
				<xsl:element name="cbc:Note">
					<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/IndServicio"/>
				</xsl:element>
			</xsl:if>
			<xsl:for-each select="DTE/Personalizados/DocPersonalizado/campoString[@name = 'Notas']">
				<xsl:if test=". != ''">
					<xsl:element name="cbc:Note">
						<xsl:value-of select="."/>
					</xsl:element>
				</xsl:if>
			</xsl:for-each>
			<!--<xsl:element name="cbc:TaxPointDate">
				<!-\-Agregar n meses al periodo actual de facturacion -\->
				<xsl:variable name="TaxPointDate_Month">
					<xsl:choose>
						<xsl:when test="/DTE/Documento/Encabezado/IdDoc/PeriodoTributario != ''">
							<xsl:value-of
								select="xs:date(substring-before(/DTE/Documento/Encabezado/IdDoc/FechaEmis, 'T')) + xs:yearMonthDuration(concat('P', /DTE/Documento/Encabezado/IdDoc/PeriodoTributario, 'M'))"
							/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of
								select="xs:date(substring-before(/DTE/Documento/Encabezado/IdDoc/FechaEmis, 'T')) + xs:yearMonthDuration(concat('P', '2', 'M'))"
							/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="TaxPointDate_Day">
					<xsl:value-of
						select="xs:date($TaxPointDate_Month) - xs:dayTimeDuration(concat('P', day-from-date(xs:date($TaxPointDate_Month)) - 1, 'D')) + xs:yearMonthDuration('P1M') - xs:dayTimeDuration('P1D')"
					/>
				</xsl:variable>
				<xsl:value-of
					select="concat(substring($TaxPointDate_Month, 1, 8), substring($TaxPointDate_Day, 9, 2))"
				/>
			</xsl:element>-->
			<!--Document Currency Type-->
			<xsl:element name="cbc:DocumentCurrencyCode">
				<xsl:attribute name="listID">
					<xsl:text>ISO 4217 Alpha</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="listAgencyID">
					<xsl:text>6</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="listAgencyName">
					<xsl:text>United Nations Economic Commission for Europe</xsl:text>
				</xsl:attribute>
				<xsl:value-of select="$MonedaC"/>
			</xsl:element>
			<xsl:element name="cbc:LineCountNumeric">
				<xsl:value-of select="count(/DTE/Documento/Detalle)"/>
			</xsl:element>
			<!-- Periodo de Facturacion -->
			<xsl:if test="/DTE/Documento/Encabezado/IdDoc/PeriodoDesde">
				<xsl:element name="cac:InvoicePeriod">
					<xsl:element name="cbc:StartDate">
						<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/PeriodoDesde"/>
					</xsl:element>
					<xsl:element name="cbc:EndDate">
						<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/PeriodoHasta"/>
					</xsl:element>
				</xsl:element>
			</xsl:if>
			<!--Reference for Purchase Order-->
			<xsl:variable name="OrdenCompra">
				<xsl:value-of select="/DTE/Documento/Referencia[TpoDocRef = 'OC'][1]/NumeroRef"/>
			</xsl:variable>
			<xsl:if test="$OrdenCompra != ''">
				<xsl:element name="cac:OrderReference">
					<xsl:element name="cbc:ID">
						<xsl:value-of select="$OrdenCompra"/>
					</xsl:element>
					<xsl:if test="/DTE/Documento/Referencia[TpoDocRef = 'OC'][1]/FechaRef">
						<xsl:element name="cbc:IssueDate">
							<xsl:value-of select="/DTE/Documento/Referencia[TpoDocRef = 'OC'][1]/FechaRef"/>
						</xsl:element>
					</xsl:if>
				</xsl:element>
			</xsl:if>
				<!--Referencias (Invoice | CreditNote | DebitNote)-->
			<xsl:for-each select="/DTE/Documento/Referencia">
				<xsl:choose>
					<xsl:when test="(TpoDocRef = '01' and (not(MontosRef/Monto) or MontosRef/Monto = '')) or TpoDocRef = '02' or TpoDocRef = '04'">
						<xsl:element name="cac:BillingReference">
							<xsl:element name="cac:InvoiceDocumentReference">
								<xsl:element name="cbc:ID">
									<xsl:value-of select="concat(SerieRef, NumeroRef)"/>
								</xsl:element>
								<xsl:element name="cbc:UUID">
									<xsl:attribute name="schemeName">
										<xsl:choose>
											<xsl:when test="string-length(ECB01) = 40">
												<xsl:value-of select="'CUFE-SHA1'"/>
											</xsl:when>
											<xsl:when test="string-length(ECB01) = 64">
												<xsl:value-of select="'CUFE-SHA256'"/>
											</xsl:when>
											<xsl:when test="string-length(ECB01) = 96">
												<xsl:value-of select="'CUFE-SHA384'"/>
											</xsl:when>
											<xsl:when test="string-length(ECB01) = 128">
												<xsl:value-of select="'CUFE-SHA512'"/>
											</xsl:when>
											<xsl:otherwise/>
										</xsl:choose>
									</xsl:attribute>
									<xsl:value-of select="ECB01"/>
								</xsl:element>
								<xsl:if test="FechaRef">
									<xsl:element name="cbc:IssueDate">
										<xsl:value-of select="FechaRef"/>
									</xsl:element>
								</xsl:if>
								<xsl:if test="RazonRef">
									<xsl:element name="cbc:DocumentDescription">
										<xsl:value-of select="RazonRef"/>
									</xsl:element>
								</xsl:if>
							</xsl:element>
						</xsl:element>
					</xsl:when>
					<xsl:when test="TpoDocRef = '03'">
						<xsl:element name="cac:BillingReference">
							<xsl:element name="cac:InvoiceDocumentReference">
								<xsl:element name="cbc:ID">
									<xsl:value-of select="concat(SerieRef, NumeroRef)"/>
								</xsl:element>
								<xsl:element name="cbc:UUID">
									<xsl:attribute name="schemeName">
										<xsl:choose>
											<xsl:when test="string-length(ECB01) = 40">
												<xsl:value-of select="'CUDE-SHA1'"/>
											</xsl:when>
											<xsl:when test="string-length(ECB01) = 64">
												<xsl:value-of select="'CUDE-SHA256'"/>
											</xsl:when>
											<xsl:when test="string-length(ECB01) = 96">
												<xsl:value-of select="'CUDE-SHA384'"/>
											</xsl:when>
											<xsl:when test="string-length(ECB01) = 128">
												<xsl:value-of select="'CUDE-SHA512'"/>
											</xsl:when>
											<xsl:otherwise/>
										</xsl:choose>
									</xsl:attribute>
									<xsl:value-of select="ECB01"/>
								</xsl:element>
								<xsl:if test="FechaRef">
									<xsl:element name="cbc:IssueDate">
										<xsl:value-of select="FechaRef"/>
									</xsl:element>
								</xsl:if>
								<xsl:if test="RazonRef">
									<xsl:element name="cbc:DocumentDescription">
										<xsl:value-of select="RazonRef"/>
									</xsl:element>
								</xsl:if>
							</xsl:element>
						</xsl:element>
					</xsl:when>
					<xsl:when test="TpoDocRef = '07' or TpoDocRef = '91'">
						<xsl:element name="cac:BillingReference">
							<xsl:element name="cac:CreditNoteDocumentReference">
								<xsl:element name="cbc:ID">
									<xsl:value-of select="concat(SerieRef, NumeroRef)"/>
								</xsl:element>
								<xsl:if test="ECB01 != ''">
									<xsl:element name="cbc:UUID">
										<xsl:attribute name="schemeName">
											<xsl:choose>
												<xsl:when test="string-length(ECB01) = 40">
												<xsl:value-of select="'CUDE-SHA1'"/>
												</xsl:when>
												<xsl:when test="string-length(ECB01) = 64">
												<xsl:value-of select="'CUDE-SHA256'"/>
												</xsl:when>
												<xsl:when test="string-length(ECB01) = 96">
												<xsl:value-of select="'CUDE-SHA384'"/>
												</xsl:when>
												<xsl:when test="string-length(ECB01) = 128">
												<xsl:value-of select="'CUDE-SHA512'"/>
												</xsl:when>
												<xsl:otherwise/>
											</xsl:choose>
										</xsl:attribute>
										<xsl:value-of select="ECB01"/>
									</xsl:element>
								</xsl:if>
								<xsl:if test="FechaRef">
									<xsl:element name="cbc:IssueDate">
										<xsl:value-of select="FechaRef"/>
									</xsl:element>
								</xsl:if>
							</xsl:element>
						</xsl:element>
					</xsl:when>
					<xsl:when test="TpoDocRef = '08' or TpoDocRef = '92'">
						<xsl:element name="cac:BillingReference">
							<xsl:element name="cac:DebitNoteDocumentReference">
								<xsl:element name="cbc:ID">
									<xsl:value-of select="concat(SerieRef, NumeroRef)"/>
								</xsl:element>
								<xsl:if test="ECB01 != ''">
									<xsl:element name="cbc:UUID">
										<xsl:attribute name="schemeName">
											<xsl:choose>
												<xsl:when test="string-length(ECB01) = 40">
												<xsl:value-of select="'CUDE-SHA1'"/>
												</xsl:when>
												<xsl:when test="string-length(ECB01) = 64">
												<xsl:value-of select="'CUDE-SHA256'"/>
												</xsl:when>
												<xsl:when test="string-length(ECB01) = 96">
												<xsl:value-of select="'CUDE-SHA384'"/>
												</xsl:when>
												<xsl:when test="string-length(ECB01) = 128">
												<xsl:value-of select="'CUDE-SHA512'"/>
												</xsl:when>
												<xsl:otherwise/>
											</xsl:choose>
										</xsl:attribute>
										<xsl:value-of select="ECB01"/>
									</xsl:element>
								</xsl:if>
								<xsl:if test="FechaRef">
									<xsl:element name="cbc:IssueDate">
										<xsl:value-of select="FechaRef"/>
									</xsl:element>
								</xsl:if>
							</xsl:element>
						</xsl:element>
					</xsl:when>
					<xsl:otherwise/>
				</xsl:choose>
			</xsl:for-each>
			<xsl:for-each select="/DTE/Documento/Referencia">
				<!--Despatch Document Reference -->
				<xsl:if test="TpoDocRef = '09'">
					<xsl:element name="cac:DespatchDocumentReference">
						<xsl:element name="cbc:ID">
							<xsl:value-of select="concat(SerieRef, NumeroRef)"/>
						</xsl:element>
						<xsl:if test="FechaRef">
							<xsl:element name="cbc:IssueDate">
								<xsl:value-of select="FechaRef"/>
							</xsl:element>
						</xsl:if>
					</xsl:element>
				</xsl:if>
				<!--Receipt Document Reference -->
				<xsl:if test="TpoDocRef = '20'">
					<xsl:element name="cac:ReceiptDocumentReference">
						<xsl:element name="cbc:ID">
							<xsl:value-of select="concat(SerieRef, NumeroRef)"/>
						</xsl:element>
						<xsl:if test="FechaRef">
							<xsl:element name="cbc:IssueDate">
								<xsl:value-of select="FechaRef"/>
							</xsl:element>
						</xsl:if>
					</xsl:element>
				</xsl:if>
				<!-- Additional Document Reference -->
				<xsl:if test="TpoDocRef = '99'">
					<xsl:element name="cac:AdditionalDocumentReference">
						<xsl:element name="cbc:ID">
							<xsl:value-of select="concat(SerieRef, NumeroRef)"/>
						</xsl:element>
						<xsl:if test="ECB01 != ''">
							<xsl:element name="cbc:UUID">
								<xsl:attribute name="schemeName">
									<xsl:choose>
										<xsl:when test="string-length(ECB01) = 40">
											<xsl:value-of select="'CUFE-SHA1'"/>
										</xsl:when>
										<xsl:when test="string-length(ECB01) = 64">
											<xsl:value-of select="'CUFE-SHA256'"/>
										</xsl:when>
										<xsl:when test="string-length(ECB01) = 96">
											<xsl:value-of select="'CUFE-SHA384'"/>
										</xsl:when>
										<xsl:when test="string-length(ECB01) = 128">
											<xsl:value-of select="'CUFE-SHA512'"/>
										</xsl:when>
										<xsl:otherwise/>
									</xsl:choose>
								</xsl:attribute>
								<xsl:value-of select="ECB01"/>
							</xsl:element>
						</xsl:if>
						<xsl:element name="cbc:DocumentTypeCode">
							<xsl:value-of select="TpoDocRef"/>
						</xsl:element>
					</xsl:element>
				</xsl:if>
				<!--<xsl:if test="TpoDocRef = '01' and //IdDoc/Tipo = '03'">
					<xsl:element name="cac:AdditionalDocumentReference">
						<xsl:element name="cbc:ID">
							<xsl:value-of select="concat(SerieRef, NumeroRef)"/>
						</xsl:element>
						<xsl:element name="cbc:UUID">
							<xsl:attribute name="schemeName">
								<xsl:choose>
									<xsl:when test="string-length(ECB01) = 40">
										<xsl:value-of select="'CUFE-SHA1'"/>
									</xsl:when>
									<xsl:when test="string-length(ECB01) = 64">
										<xsl:value-of select="'CUFE-SHA256'"/>
									</xsl:when>
									<xsl:when test="string-length(ECB01) = 96">
										<xsl:value-of select="'CUFE-SHA384'"/>
									</xsl:when>
									<xsl:when test="string-length(ECB01) = 128">
										<xsl:value-of select="'CUFE-SHA512'"/>
									</xsl:when>
									<xsl:otherwise/>
								</xsl:choose>
							</xsl:attribute>
							<xsl:value-of select="ECB01"/>
						</xsl:element>
						<xsl:element name="cbc:DocumentTypeCode">
							<xsl:value-of select="TpoDocRef"/>
						</xsl:element>
					</xsl:element>
				</xsl:if>-->
			</xsl:for-each>
			<xsl:for-each select="/DTE/Documento/Referencia">
				<!--REFERENCIA-->
				<xsl:choose>
					<xsl:when
						test="TpoDocRef != '01' and TpoDocRef != '02' and TpoDocRef != '03' and TpoDocRef != '04' and TpoDocRef != '07' and TpoDocRef != '08' and TpoDocRef != '91' and TpoDocRef != '92' and TpoDocRef != '09' and TpoDocRef != '20' and TpoDocRef != '100' and TpoDocRef != 'OC'">
						<!--Otro tipo de referencia-->
						<xsl:element name="cac:AdditionalDocumentReference">
							<xsl:element name="cbc:ID">
								<xsl:value-of select="NumeroRef"/>
							</xsl:element>
							<xsl:if test="FechaRef != ''">
								<xsl:element name="cbc:IssueDate">
									<xsl:value-of select="substring(FechaRef, 1, 10)"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cbc:DocumentTypeCode">
								<xsl:value-of select="TpoDocRef"/>
							</xsl:element>
							<xsl:variable name="DocRefDesc">
								<xsl:call-template name="TipoDocRef">
									<xsl:with-param name="TpoDocRef">
										<xsl:value-of select="TpoDocRef"/>
									</xsl:with-param>
								</xsl:call-template>
							</xsl:variable>
							<xsl:if test="$DocRefDesc != ''">
								<xsl:element name="cbc:DocumentType">
									<xsl:value-of select="$DocRefDesc"/>
								</xsl:element>
							</xsl:if>
						</xsl:element>
					</xsl:when>
				</xsl:choose>
				<!--Contract Reference-->
				<xsl:if test="TpoDocRef = '100'">
					<!-- Additional Document Reference -->
					<xsl:element name="cac:ProjectReference">
						<xsl:element name="cbc:ID">
							<xsl:value-of select="concat(SerieRef, NumeroRef)"/>
						</xsl:element>
						<xsl:element name="cbc:UUID">
							<xsl:attribute name="schemeName">
								<xsl:value-of select="'Proy'"/>
							</xsl:attribute>
							<xsl:value-of select="ECB01"/>
						</xsl:element>
					</xsl:element>
				</xsl:if>
			</xsl:for-each>
			<!--Pais Emisor en letras -->
			<xsl:variable name="PaisEmis">
				<xsl:call-template name="countryName">
					<xsl:with-param name="Pais"
						select="normalize-space(/DTE/Documento/Encabezado/Emisor/DomFiscal/Pais)"/>
				</xsl:call-template>
			</xsl:variable>
			<!--Issuer of the document-->
			<xsl:element name="cac:AccountingSupplierParty">
				<xsl:element name="cbc:AdditionalAccountID">
					<xsl:value-of select="/DTE/Documento/Encabezado/Emisor/TipoContribuyente"/>
				</xsl:element>
				<xsl:element name="cac:Party">
					<xsl:if
						test="/DTE/Documento/Encabezado/Emisor/CodigoEmisor/TpoCdgIntEmisor = 'CIIU'">
						<xsl:element name="cbc:IndustryClassificationCode">
							<xsl:value-of
								select="/DTE/Documento/Encabezado/Emisor/CodigoEmisor[TpoCdgIntEmisor = 'CIIU']/CdgIntEmisor"
							/>
						</xsl:element>
					</xsl:if>
					<xsl:if test="/DTE/Documento/Encabezado/IdDoc/PtoEmis !=''">
						<xsl:element name="cac:PartyName">
							<!--Nombre Tienda -->
							<xsl:element name="cbc:Name">
								<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/PtoEmis"/>
							</xsl:element>
						</xsl:element>
					</xsl:if>
					<xsl:if test="/DTE/Documento/Encabezado/IdDoc/Establecimiento !=''">
						<xsl:element name="cac:PartyName">
							<!--Establecimiento-->
							<xsl:element name="cbc:Name">
								<xsl:value-of
									select="/DTE/Documento/Encabezado/IdDoc/Establecimiento"/>
							</xsl:element>
						</xsl:element>
					</xsl:if>
					<xsl:element name="cac:PartyName">
						<!--Name of the Issuer-->
						<xsl:element name="cbc:Name">
							<xsl:value-of
								select="/DTE/Documento/Encabezado/Emisor/NombreEmisor/PrimerNombre"
							/>
						</xsl:element>
					</xsl:element>
					<!--Fiscal Address-->
					<xsl:element name="cac:PhysicalLocation">
						<xsl:element name="cac:Address">
							<xsl:element name="cbc:ID">
								<xsl:choose>
									<xsl:when test="(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo') or (/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturoGS')">
										<xsl:value-of select="/DTE/Documento/Encabezado/Emisor/LugarExped/CodigoPostal"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="/DTE/Documento/Encabezado/Emisor/LugarExped/Ciudad"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:element>
							<xsl:element name="cbc:CityName">
								<xsl:choose>
									<xsl:when test="(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo') or (/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturoGS')">
										<xsl:call-template name="cityName">
											<xsl:with-param name="Municipio"
												select="normalize-space(/DTE/Documento/Encabezado/Emisor/LugarExped/CodigoPostal)"
											/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="cityName">
											<xsl:with-param name="Municipio"
												select="normalize-space(/DTE/Documento/Encabezado/Emisor/LugarExped/Ciudad)"
											/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:element>
							<xsl:choose>
								<xsl:when test="/DTE/Documento/Encabezado/Emisor/LugarExped/CodigoPostal !='' and (not(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo') or not(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturoGS'))">
									<xsl:element name="cbc:PostalZone">
										<xsl:value-of select="/DTE/Documento/Encabezado/Emisor/LugarExped/CodigoPostal"/>
									</xsl:element>
								</xsl:when>
								<xsl:otherwise>
									<xsl:element name="cbc:PostalZone">
										<xsl:value-of select="/DTE/Documento/Encabezado/Emisor/LugarExped/GLN"/>
									</xsl:element>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:element name="cbc:CountrySubentity">
								<xsl:variable name="CountrySubentityNameS">
									<xsl:call-template name="countrySubentityName">
										<xsl:with-param name="Departamento"
											select="normalize-space(/DTE/Documento/Encabezado/Emisor/LugarExped/Departamento)"
										/>
									</xsl:call-template>
								</xsl:variable>
								<xsl:value-of select="$CountrySubentityNameS"/>
							</xsl:element>
							<xsl:element name="cbc:CountrySubentityCode">
								<xsl:value-of
									select="/DTE/Documento/Encabezado/Emisor/LugarExped/Departamento"
								/>
							</xsl:element>
							<xsl:element name="cac:AddressLine">
								<xsl:element name="cbc:Line">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Emisor/LugarExped/Calle"/>
								</xsl:element>
							</xsl:element>
							<xsl:element name="cac:Country">
								<xsl:element name="cbc:IdentificationCode">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Emisor/LugarExped/Pais"/>
								</xsl:element>
								<xsl:element name="cbc:Name">
									<xsl:attribute name="languageID">
								<xsl:text>es</xsl:text>
							</xsl:attribute>
									<xsl:value-of
										select="concat(substring($PaisEmis, 1, 1), translate(substring($PaisEmis, 2, 100), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'))"
									/>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:element>
					<!-- Identification of the Company -->
					<xsl:element name="cac:PartyTaxScheme">
						<xsl:element name="cbc:RegistrationName">
							<xsl:value-of select="/DTE/Documento/Encabezado/Emisor/NmbEmisor"/>
						</xsl:element>
						<xsl:element name="cbc:CompanyID">
							<xsl:attribute name="schemeID">
								<xsl:call-template name="calculNIT-dv">
									<xsl:with-param name="NIT"
										select="normalize-space(/DTE/Documento/Encabezado/Emisor/IDEmisor)"
									/>
								</xsl:call-template>
							</xsl:attribute>
							<xsl:attribute name="schemeName">
								<xsl:value-of select="'31'"/>
							</xsl:attribute>
							<xsl:attribute name="schemeAgencyID">
								<xsl:text>195</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="schemeAgencyName">
								<xsl:text>CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)</xsl:text>
							</xsl:attribute>
							<xsl:value-of
								select="normalize-space(/DTE/Documento/Encabezado/Emisor/IDEmisor)"
							/>
						</xsl:element>
						<xsl:element name="cbc:TaxLevelCode">
							<xsl:attribute name="listName">
								<xsl:value-of
									select="/DTE/Documento/Encabezado/Emisor/RegimenContable/text()"
								/>
							</xsl:attribute>
							<xsl:value-of
								select="/DTE/Documento/Encabezado/Emisor/CodigoEmisor[TpoCdgIntEmisor = 'TpoObl']/CdgIntEmisor/text()"
							/>
						</xsl:element>
						<xsl:element name="cac:RegistrationAddress">
							<xsl:element name="cbc:ID">
								<xsl:choose>
									<xsl:when test="(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo') or (/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturoGS')">
										<xsl:value-of select="/DTE/Documento/Encabezado/Emisor/DomFiscal/CodigoPostal"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="/DTE/Documento/Encabezado/Emisor/DomFiscal/Ciudad"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:element>
							<xsl:element name="cbc:CityName">
								<xsl:choose>
									<xsl:when test="(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo') or (/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturoGS')">
										<xsl:call-template name="cityName">
											<xsl:with-param name="Municipio"
												select="normalize-space(/DTE/Documento/Encabezado/Emisor/DomFiscal/CodigoPostal)"
											/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="cityName">
											<xsl:with-param name="Municipio"
												select="normalize-space(/DTE/Documento/Encabezado/Emisor/DomFiscal/Ciudad)"
											/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:element>
							<xsl:choose>
								<xsl:when test="/DTE/Documento/Encabezado/Emisor/DomFiscal/CodigoPostal !='' and (not(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo') or not(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturoGS'))">
									<xsl:element name="cbc:PostalZone">
										<xsl:value-of select="/DTE/Documento/Encabezado/Emisor/DomFiscal/CodigoPostal"/>
									</xsl:element>
								</xsl:when>
								<xsl:otherwise>
									<xsl:element name="cbc:PostalZone">
										<xsl:value-of select="/DTE/Documento/Encabezado/Emisor/DomFiscal/GLN"/>
									</xsl:element>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:element name="cbc:CountrySubentity">
								<xsl:variable name="CountrySubentityNameS">
									<xsl:call-template name="countrySubentityName">
										<xsl:with-param name="Departamento"
											select="normalize-space(/DTE/Documento/Encabezado/Emisor/DomFiscal/Departamento)"
										/>
									</xsl:call-template>
								</xsl:variable>
								<xsl:value-of select="$CountrySubentityNameS"/>
							</xsl:element>
							<xsl:element name="cbc:CountrySubentityCode">
								<xsl:value-of
									select="/DTE/Documento/Encabezado/Emisor/DomFiscal/Departamento"
								/>
							</xsl:element>
							<xsl:element name="cac:AddressLine">
								<xsl:element name="cbc:Line">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Emisor/DomFiscal/Calle"/>
								</xsl:element>
							</xsl:element>
							<xsl:element name="cac:Country">
								<xsl:element name="cbc:IdentificationCode">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Emisor/DomFiscal/Pais"/>
								</xsl:element>
								<xsl:element name="cbc:Name">
									<xsl:attribute name="languageID">
										<xsl:text>es</xsl:text>
									</xsl:attribute>
									<xsl:value-of
										select="concat(substring($PaisEmis, 1, 1), translate(substring($PaisEmis, 2, 100), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'))"
									/>
								</xsl:element>
							</xsl:element>
						</xsl:element>
						<xsl:element name="cac:TaxScheme">
							<xsl:element name="cbc:ID">
								<xsl:value-of select="'01'"/>
							</xsl:element>
							<xsl:element name="cbc:Name">
								<xsl:value-of select="'IVA'"/>
							</xsl:element>
						</xsl:element>
					</xsl:element>
					<xsl:element name="cac:PartyLegalEntity">
						<xsl:element name="cbc:RegistrationName">
							<xsl:value-of select="/DTE/Documento/Encabezado/Emisor/NmbEmisor"/>
						</xsl:element>
						<xsl:element name="cbc:CompanyID">
							<xsl:attribute name="schemeID">
								<xsl:call-template name="calculNIT-dv">
									<xsl:with-param name="NIT"
										select="normalize-space(/DTE/Documento/Encabezado/Emisor/IDEmisor)"
									/>
								</xsl:call-template>
							</xsl:attribute>
							<xsl:attribute name="schemeName">
								<xsl:value-of select="'31'"/>
							</xsl:attribute>
							<xsl:attribute name="schemeAgencyID">
								<xsl:text>195</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="schemeAgencyName">
								<xsl:text>CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)</xsl:text>
							</xsl:attribute>
							<xsl:value-of
								select="normalize-space(/DTE/Documento/Encabezado/Emisor/IDEmisor)"
							/>
						</xsl:element>
						<xsl:element name="cac:CorporateRegistrationScheme">
							<xsl:choose>
								<xsl:when test="/DTE/Documento/Encabezado/IdDoc/Serie != ''">
									<xsl:element name="cbc:ID">
										<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/Serie"
										/>
									</xsl:element>
								</xsl:when>
								<xsl:otherwise/>
							</xsl:choose>
							<xsl:if test="/DTE/Documento/Encabezado/Emisor/CdgSucursal != ''">
								<xsl:element name="cbc:Name">
									<xsl:value-of select="/DTE/Documento/Encabezado/Emisor/CdgSucursal"
									/>
								</xsl:element>
							</xsl:if>
						</xsl:element>
						<!-- Informacion de Participantes de un Consorcio -->
						<xsl:variable name="Consorcio"
							select="/DTE/Documento/Encabezado/Emisor/Consorcio"/>
						<xsl:for-each select="$Consorcio">
							<xsl:element name="cac:ShareholderParty">
								<xsl:element name="cbc:PartecipationPercent">
									<xsl:value-of select="Porcentaje"/>
								</xsl:element>
								<xsl:element name="cac:Party">
									<xsl:element name="cac:PartyTaxScheme">
										<xsl:element name="cbc:RegistrationName">
											<xsl:value-of select="Nombre"/>
										</xsl:element>
										<xsl:element name="cbc:CompanyID">
											<xsl:attribute name="schemeID">
												<xsl:call-template name="calculNIT-dv">
												<xsl:with-param name="NIT"
												select="normalize-space(NroDocCons)"/>
												</xsl:call-template>
											</xsl:attribute>
											<xsl:attribute name="schemeName">
												<xsl:value-of select="'31'"/>
											</xsl:attribute>
											<xsl:attribute name="schemeAgencyID">
												<xsl:text>195</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeAgencyName">
												<xsl:text>CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)</xsl:text>
											</xsl:attribute>
											<xsl:value-of select="normalize-space(NroDocCons)"/>
										</xsl:element>
										<xsl:element name="cbc:TaxLevelCode">
											<xsl:attribute name="listName">
												<xsl:value-of select="RegimenContable/text()"/>
											</xsl:attribute>
											<xsl:value-of
												select="CodigoEmisor[TpoCdgIntEmisor = 'TpoObl']/CdgIntEmisor/text()"
											/>
										</xsl:element>
										<xsl:element name="cac:TaxScheme">
											<xsl:element name="cbc:ID">
												<xsl:value-of select="'01'"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:value-of select="'IVA'"/>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
					<!-- Contact of the Sender (Phone & email) -->
					
						<xsl:element name="cac:Contact">
							<xsl:if test="/DTE/Documento/Encabezado/Emisor/ContactoEmisor/Nombre">
								<xsl:element name="cbc:Name">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Emisor/ContactoEmisor/Nombre"
									/>
								</xsl:element>
							</xsl:if>
							<xsl:if test="/DTE/Documento/Encabezado/Emisor/ContactoEmisor/Telefono">
								<xsl:element name="cbc:Telephone">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Emisor/ContactoEmisor/Telefono"
									/>
								</xsl:element>
							</xsl:if>
							<xsl:if test="/DTE/Documento/Encabezado/Emisor/ContactoEmisor/Fax">
								<xsl:element name="cbc:Telefax">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Emisor/ContactoEmisor/Fax"
									/>
								</xsl:element>
							</xsl:if>
								<xsl:element name="cbc:ElectronicMail">
									<xsl:value-of
										select="if(/DTE/Documento/Encabezado/Emisor/ContactoEmisor/eMail !='') then /DTE/Documento/Encabezado/Emisor/ContactoEmisor/eMail else 'col_intercambio@einvoicing.signature-cloud.com' "/>
								</xsl:element>
							<xsl:if
								test="/DTE/Documento/Encabezado/Emisor/ContactoEmisor/Descripcion">
								<xsl:element name="cbc:Note">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Emisor/ContactoEmisor/Descripcion"
									/>
								</xsl:element>
							</xsl:if>
							<xsl:if
								test="/DTE/Documento/Encabezado/Emisor/ContactoEmisor[Tipo = 'Distrib']/eMail">
								<xsl:element name="cac:OtherCommunication">
									<xsl:element name="cbc:Channel">
										<xsl:text>email</xsl:text>
									</xsl:element>
									<xsl:element name="cbc:Value">
										<xsl:value-of
											select="/DTE/Documento/Encabezado/Emisor/ContactoEmisor[Tipo = 'Distrib']/eMail"
										/>
									</xsl:element>
								</xsl:element>
							</xsl:if>
						</xsl:element>
					
				</xsl:element>
			</xsl:element>
			<!--Pais Receptor en letras-->
			<xsl:variable name="PaisRecep">
				<xsl:call-template name="countryName">
					<xsl:with-param name="Pais"
						select="normalize-space(/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/Pais)"
					/>
				</xsl:call-template>
			</xsl:variable>
			<!--Receiver of the document-->
			<xsl:element name="cac:AccountingCustomerParty">
				<xsl:element name="cbc:SupplierAssignedAccountID">
					<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/CdgGLNRecep"/>
				</xsl:element>
				<xsl:element name="cbc:AdditionalAccountID">
					<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/TipoContribuyenteR"/>
				</xsl:element>
				<xsl:element name="cac:Party">
					<xsl:if test="/DTE/Documento/Encabezado/Receptor/TipoContribuyenteR = '2'">
						<xsl:element name="cac:PartyIdentification">
							<xsl:element name="cbc:ID">
								<xsl:choose>
									<xsl:when test="/DTE/Documento/Encabezado/Receptor/DocRecep/TipoDocRecep = '31'">
										<xsl:attribute name="schemeID">
											<xsl:call-template name="calculNIT-dv">
												<xsl:with-param name="NIT"
													select="normalize-space(/DTE/Documento/Encabezado/Receptor/DocRecep/NroDocRecep)"
												/>
											</xsl:call-template>
										</xsl:attribute>
									</xsl:when>
									<xsl:otherwise/>
								</xsl:choose>
								<xsl:attribute name="schemeName">
									<xsl:value-of
										select="normalize-space(/DTE/Documento/Encabezado/Receptor/DocRecep/TipoDocRecep)"
									/>
								</xsl:attribute>
								<xsl:value-of select="normalize-space(/DTE/Documento/Encabezado/Receptor/DocRecep/NroDocRecep)"/>
							</xsl:element>
						</xsl:element>
					</xsl:if>
					<!--Receiver Name-->
					<!--<xsl:if test="/DTE/Documento/Encabezado/Receptor/TipoContribuyenteR != '2'">-->
						<xsl:element name="cac:PartyName">
							<xsl:element name="cbc:Name">
								<xsl:value-of
									select="/DTE/Documento/Encabezado/Receptor/NombreRecep/PrimerNombre"
								/>
							</xsl:element>
						</xsl:element>
					<!--</xsl:if>-->
					<!-- Expedition Address -->
					<xsl:if test="/DTE/Documento/Encabezado/Receptor/LugarRecep">
						<xsl:element name="cac:PhysicalLocation">
							<xsl:element name="cac:Address">
								<xsl:choose>
									<xsl:when test="/DTE/Documento/Encabezado/IdDoc/Tipo != '02'">
										<xsl:element name="cbc:ID">
											<xsl:choose>
												<xsl:when test="(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo') or (/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturoGS')">
													<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/LugarRecep/CodigoPostal"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Ciudad"/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:element>
										<xsl:element name="cbc:CityName">
											<xsl:choose>
												<xsl:when test="(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo') or (/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturoGS')">
													<xsl:call-template name="cityName">
														<xsl:with-param name="Municipio"
															select="normalize-space(/DTE/Documento/Encabezado/Receptor/LugarRecep/CodigoPostal)"
														/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="cityName">
														<xsl:with-param name="Municipio"
															select="normalize-space(/DTE/Documento/Encabezado/Receptor/LugarRecep/Ciudad)"
														/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:element>
										<xsl:choose>
											<xsl:when test="/DTE/Documento/Encabezado/Receptor/LugarRecep/CodigoPostal !='' and (not(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo') or not(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturoGS'))">
												<xsl:element name="cbc:PostalZone">
													<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/LugarRecep/CodigoPostal"/>
												</xsl:element>
											</xsl:when>
											<xsl:otherwise>
												<xsl:element name="cbc:PostalZone">
													<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/LugarRecep/GLN"/>
												</xsl:element>
											</xsl:otherwise>
										</xsl:choose>
										<xsl:element name="cbc:CountrySubentity">
											<xsl:variable name="CountrySubentityNameS">
												<xsl:call-template name="countrySubentityName">
													<xsl:with-param name="Departamento"
														select="normalize-space(/DTE/Documento/Encabezado/Receptor/LugarRecep/Departamento)"
													/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:value-of select="$CountrySubentityNameS"/>
										</xsl:element>
										<xsl:element name="cbc:CountrySubentityCode">
											<xsl:value-of
												select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Departamento"
											/>
										</xsl:element>
										<xsl:element name="cac:AddressLine">
											<xsl:element name="cbc:Line">
												<xsl:value-of
													select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Calle"/>
											</xsl:element>
										</xsl:element>
										<xsl:element name="cac:Country">
											<xsl:element name="cbc:IdentificationCode">
												<xsl:value-of
													select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Pais"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:attribute name="languageID">
													<xsl:text>es</xsl:text>
												</xsl:attribute>
												<xsl:value-of
													select="concat(substring($PaisRecep, 1, 1), translate(substring($PaisRecep, 2, 100), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'))"
												/>
											</xsl:element>
										</xsl:element>
									</xsl:when>
									<xsl:otherwise>
										<xsl:if
											test="/DTE/Documento/Encabezado/Receptor/LugarRecep/Departamento != ''">
											<xsl:element name="cbc:Department">
												<xsl:value-of
												select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Departamento"
												/>
											</xsl:element>
										</xsl:if>
										<xsl:if
											test="/DTE/Documento/Encabezado/Receptor/LugarRecep/Ciudad != ''">
											<xsl:element name="cbc:CityName">
												<xsl:value-of
												select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Ciudad"
												/>
											</xsl:element>
										</xsl:if>
										<xsl:if test="/DTE/Documento/Encabezado/Receptor/LugarRecep/CodigoPostal != ''">
											<xsl:element name="cbc:PostalZone">
												<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/LugarRecep/CodigoPostal"/>
											</xsl:element>
										</xsl:if>
										<xsl:if
											test="/DTE/Documento/Encabezado/Receptor/LugarRecep/Distrito != ''">
											<xsl:element name="cbc:CountrySubentity">
												<xsl:value-of
												select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Distrito"
												/>
											</xsl:element>
										</xsl:if>
										<xsl:element name="cac:AddressLine">
											<xsl:element name="cbc:Line">
												<xsl:value-of
													select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Calle"/>
											</xsl:element>
										</xsl:element>
										<xsl:element name="cac:Country">
											<xsl:element name="cbc:IdentificationCode">
												<xsl:value-of
													select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Pais"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:attribute name="languageID">
													<xsl:text>es</xsl:text>
												</xsl:attribute>
												<xsl:value-of
													select="concat(substring($PaisRecep, 1, 1), translate(substring($PaisRecep, 2, 100), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'))"
												/>
											</xsl:element>
										</xsl:element>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:element>
						</xsl:element>
					</xsl:if>
					<!-- Identification of the Company -->
					<!--<xsl:if test="/DTE/Documento/Encabezado/Receptor/TipoContribuyenteR != '2'">-->
						<xsl:element name="cac:PartyTaxScheme">
							<xsl:element name="cbc:RegistrationName">
								<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/NmbRecep"/>
							</xsl:element>
							<xsl:element name="cbc:CompanyID">
								<xsl:choose>
									<xsl:when test="/DTE/Documento/Encabezado/Receptor/DocRecep/TipoDocRecep = '31'">
										<xsl:attribute name="schemeID">
												<xsl:call-template name="calculNIT-dv">
													<xsl:with-param name="NIT"
														select="normalize-space(/DTE/Documento/Encabezado/Receptor/DocRecep/NroDocRecep)"
													/>
												</xsl:call-template>
											</xsl:attribute>
										</xsl:when>
										<xsl:otherwise/>
									</xsl:choose>
								<xsl:attribute name="schemeName">
									<xsl:value-of
										select="normalize-space(/DTE/Documento/Encabezado/Receptor/DocRecep/TipoDocRecep)"
									/>
								</xsl:attribute>
								<xsl:attribute name="schemeAgencyID">
									<xsl:text>195</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="schemeAgencyName">
									<xsl:text>CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)</xsl:text>
								</xsl:attribute>
								<xsl:value-of
									select="normalize-space(/DTE/Documento/Encabezado/Receptor/DocRecep/NroDocRecep)"
								/>
							</xsl:element>
							<xsl:element name="cbc:TaxLevelCode">
								<xsl:attribute name="listName">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Receptor/RegimenContableR"
									/>
								</xsl:attribute>
								<xsl:value-of
									select="/DTE/Documento/Encabezado/Receptor/CodigoReceptor[TpoCdgIntRecep = 'TpoObl']/CdgIntRecep/text()"
								/>
							</xsl:element>
							<xsl:if test="/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/Calle !=''"> 
							<xsl:element name="cac:RegistrationAddress">
											<xsl:choose>
												<xsl:when test="(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo') or (/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturoGS')">
													<xsl:element name="cbc:ID">
													<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/CodigoPostal"/>
													</xsl:element>
												</xsl:when>
												<xsl:otherwise>
													<!--<xsl:if test="/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/Ciudad !=''">-->
													<xsl:element name="cbc:ID">
													<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/Ciudad"/>
													</xsl:element>
													<!--</xsl:if>-->
												</xsl:otherwise>
											</xsl:choose>
										
											<xsl:choose>
												<xsl:when test="(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo') or (/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturoGS')">
													<xsl:call-template name="cityName">
														<xsl:with-param name="Municipio"
															select="normalize-space(/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/CodigoPostal)"
														/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<!--<xsl:if test="/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/Ciudad !=''">-->
													<xsl:element name="cbc:CityName">
													<xsl:call-template name="cityName">
														<xsl:with-param name="Municipio"
															select="normalize-space(/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/Ciudad)"/>
													</xsl:call-template>
													</xsl:element>
													<!--</xsl:if>-->
												</xsl:otherwise>
											</xsl:choose>
										
										<xsl:choose>
											<xsl:when test="/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/CodigoPostal !='' and (not(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo') or not(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturoGS'))">
												<xsl:element name="cbc:PostalZone">
													<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/CodigoPostal"/>
												</xsl:element>
											</xsl:when>
											<xsl:otherwise>
												<xsl:if test="/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/GLN !=''">
												<xsl:element name="cbc:PostalZone">
													<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/GLN"/>
												</xsl:element>
												</xsl:if>
											</xsl:otherwise>
										</xsl:choose>
										<!--<xsl:if test="/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/Departamento !=''">-->
										<xsl:element name="cbc:CountrySubentity">
											<xsl:variable name="CountrySubentityNameS">
												<xsl:call-template name="countrySubentityName">
													<xsl:with-param name="Departamento"
														select="normalize-space(/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/Departamento)"
													/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:value-of select="$CountrySubentityNameS"/>
										</xsl:element>
										<xsl:element name="cbc:CountrySubentityCode">
											<xsl:value-of
												select="/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/Departamento"/>
										</xsl:element>
										<!--</xsl:if>-->
										<!--<xsl:if test="/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/Calle !=''">-->
										<xsl:element name="cac:AddressLine">
											<xsl:element name="cbc:Line">
												<xsl:value-of
													select="/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/Calle"/>
											</xsl:element>
										</xsl:element>
										<!--</xsl:if>-->
										<!--<xsl:if test="/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/Pais !=''">-->
										<xsl:element name="cac:Country">
											<xsl:element name="cbc:IdentificationCode">
												<xsl:value-of
													select="/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/Pais"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:attribute name="languageID">
													<xsl:text>es</xsl:text>
												</xsl:attribute>
												<xsl:value-of
													select="concat(substring($PaisRecep, 1, 1), translate(substring($PaisRecep, 2, 100), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'))"/>
											</xsl:element>
										</xsl:element>
										<!--</xsl:if>-->
							</xsl:element>
							</xsl:if>
							<xsl:if test="/DTE/Documento/Encabezado/Receptor/DocRecep/NroDocRecep != '222222222222'">
							<xsl:element name="cac:TaxScheme">
								<xsl:element name="cbc:ID">
									<xsl:value-of select="'01'"/>
								</xsl:element>
								<xsl:element name="cbc:Name">
									<xsl:value-of select="'IVA'"/>
								</xsl:element>
							</xsl:element>
							</xsl:if>
							<xsl:if test="/DTE/Documento/Encabezado/Receptor/DocRecep/NroDocRecep = '222222222222'">
								<xsl:element name="cac:TaxScheme">
									<xsl:element name="cbc:ID">
										<xsl:value-of select="'ZZ'"/>
									</xsl:element>
									<xsl:element name="cbc:Name"/>
								</xsl:element>
							</xsl:if>
						</xsl:element>
						<xsl:element name="cac:PartyLegalEntity">
							<xsl:element name="cbc:RegistrationName">
								<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/NmbRecep"/>
							</xsl:element>
							<xsl:element name="cbc:CompanyID">
								<xsl:choose>
									<xsl:when test="/DTE/Documento/Encabezado/Receptor/DocRecep/TipoDocRecep = '31'">
										<xsl:attribute name="schemeID">
											<xsl:call-template name="calculNIT-dv">
												<xsl:with-param name="NIT"
													select="normalize-space(/DTE/Documento/Encabezado/Receptor/DocRecep/NroDocRecep)"
												/>
											</xsl:call-template>
										</xsl:attribute>
									</xsl:when>
									<xsl:otherwise/>
								</xsl:choose>
								<xsl:attribute name="schemeName">
									<xsl:value-of
										select="normalize-space(/DTE/Documento/Encabezado/Receptor/DocRecep/TipoDocRecep)"
									/>
								</xsl:attribute>
								<xsl:attribute name="schemeAgencyID">
									<xsl:text>195</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="schemeAgencyName">
									<xsl:text>CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)</xsl:text>
								</xsl:attribute>
								<xsl:value-of
									select="normalize-space(/DTE/Documento/Encabezado/Receptor/DocRecep/NroDocRecep)"
								/>
							</xsl:element>
							<xsl:if test="/DTE/Documento/Encabezado/Receptor/CdgSucursal != ''">
								<xsl:element name="cac:CorporateRegistrationScheme">
									<xsl:element name="cbc:Name">
										<xsl:value-of
											select="/DTE/Documento/Encabezado/Receptor/CdgSucursal"/>
									</xsl:element>
								</xsl:element>
							</xsl:if>
						</xsl:element>
					<!--</xsl:if>-->
					<!-- Contact of the receiver -->
					<xsl:if test="/DTE/Documento/Encabezado/Receptor/ContactoReceptor/eMail">
						<xsl:element name="cac:Contact">
							<xsl:if
								test="/DTE/Documento/Encabezado/Receptor/ContactoReceptor/Nombre">
								<xsl:element name="cbc:Name">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Receptor/ContactoReceptor/Nombre"
									/>
								</xsl:element>
							</xsl:if>
							<xsl:if
								test="/DTE/Documento/Encabezado/Receptor/ContactoReceptor/Telefono">
								<xsl:element name="cbc:Telephone">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Receptor/ContactoReceptor/Telefono"
										        
									/>
								</xsl:element>
							</xsl:if>
							<xsl:if test="/DTE/Documento/Encabezado/Receptor/ContactoReceptor/Fax">
								<xsl:element name="cbc:Telefax">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Receptor/ContactoReceptor/Fax"
									/>
								</xsl:element>
							</xsl:if>
							<xsl:if test="/DTE/Documento/Encabezado/Receptor/ContactoReceptor/eMail">
								<xsl:element name="cbc:ElectronicMail">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Receptor/ContactoReceptor/eMail"
									/>
								</xsl:element>
							</xsl:if>
							<xsl:if
								test="/DTE/Documento/Encabezado/Receptor/ContactoReceptor/Descripcion">
								<xsl:element name="cbc:Note">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Receptor/ContactoReceptor/Descripcion"
									/>
								</xsl:element>
							</xsl:if>
							<xsl:if
								test="/DTE/Documento/Encabezado/Receptor/ContactoReceptor[Tipo = 'Distrib']/eMail">
								<xsl:element name="cac:OtherCommunication">
									<xsl:element name="cbc:Channel">
										<xsl:text>email</xsl:text>
									</xsl:element>
									<xsl:element name="cbc:Value">
										<xsl:value-of
											select="/DTE/Documento/Encabezado/Receptor/ContactoReceptor[Tipo = 'Distrib']/eMail"
										/>
									</xsl:element>
								</xsl:element>
							</xsl:if>
						</xsl:element>
					</xsl:if>
					<xsl:if test="/DTE/Documento/Encabezado/Receptor/TipoContribuyenteR = '2'">
						<xsl:element name="cac:Person">
							<xsl:element name="cbc:FirstName">
								<xsl:value-of
									select="/DTE/Documento/Encabezado/Receptor/NombreRecep/PrimerNombre"
								/>
							</xsl:element>
							<xsl:if
								test="/DTE/Documento/Encabezado/Receptor/NombreRecep/PrimerApellido">
								<xsl:element name="cbc:FamilyName">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Receptor/NombreRecep/PrimerApellido"
									/>
								</xsl:element>
							</xsl:if>
							<xsl:if
								test="/DTE/Documento/Encabezado/Receptor/NombreRecep/OtrosNombres">
								<xsl:element name="cbc:MiddleName">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Receptor/NombreRecep/OtrosNombres"
									/>
								</xsl:element>
							</xsl:if>
						</xsl:element>
					</xsl:if>
				</xsl:element>
			</xsl:element>
			<!--Persona autorizada para la descarga FALTA MAPEAR VALORES EN DTE-->
			<xsl:if test="/DTE/Documento/Encabezado/Emisor/CodigoEmisor/TpoCdgIntEmisor = 'DescargaNIT'">
				<xsl:element name="cac:TaxRepresentativeParty">
					<xsl:element name="cac:PartyIdentification">
						<xsl:element name="cbc:ID">
							<xsl:attribute name="schemeAgencyID">
								<xsl:text>195</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="schemeAgencyName">
								<xsl:text>CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="schemeName">
								<xsl:value-of select="//CodigoEmisor[TpoCdgIntEmisor = 'DescargaType']/CdgIntEmisor"/>
							</xsl:attribute>
							<xsl:choose>
								<xsl:when test="//CodigoEmisor[TpoCdgIntEmisor = 'DescargaType']/CdgIntEmisor = '31'">
									<xsl:attribute name="schemeID">
										<xsl:call-template name="calculNIT-dv">
											<xsl:with-param name="NIT"
												select="normalize-space(//CodigoEmisor[TpoCdgIntEmisor = 'DescargaNIT']/CdgIntEmisor)"
											/>
										</xsl:call-template>
									</xsl:attribute>
								</xsl:when>
								<xsl:otherwise/>
							</xsl:choose>
							<xsl:value-of select="normalize-space(//CodigoEmisor[TpoCdgIntEmisor = 'DescargaNIT']/CdgIntEmisor)"/>
						</xsl:element>
					</xsl:element>
					<xsl:if test="//CodigoEmisor/TpoCdgIntEmisor = 'DescargaName'">
						<xsl:element name="cac:PartyName">
							<xsl:element name="cbc:Name">
								<xsl:value-of select="normalize-space(//CodigoEmisor[TpoCdgIntEmisor = 'DescargaName']/CdgIntEmisor)"/>
							</xsl:element>
						</xsl:element>
					</xsl:if>
				</xsl:element>
			</xsl:if>
			<!--Pais Delivery en letras-->
			<xsl:variable name="PaisLugarRecep">
				<xsl:call-template name="countryName">
					<xsl:with-param name="Pais"
						select="normalize-space(/DTE/Documento/Encabezado/Receptor/LugarRecep/Pais)"
					/>
				</xsl:call-template>
			</xsl:variable>
			<!--Pais Transp en letras-->
			<xsl:variable name="PaisLugarTransp">
				<xsl:call-template name="countryName">
					<xsl:with-param name="Pais"
						select="normalize-space(/DTE/Documento/Encabezado/Transporte/DomFiscalTransp/Pais)"
					/>
				</xsl:call-template>
			</xsl:variable>
			<!-- Delivery -->
			<xsl:if test="/DTE/Documento/Encabezado/Receptor/LugarRecep">
				<xsl:element name="cac:Delivery">
					<xsl:choose>
						<xsl:when test="/DTE/Documento/Encabezado/IdDoc/FechaCancel != ''">
							<xsl:element name="cbc:ActualDeliveryDate">
								<xsl:value-of select="substring(/DTE/Documento/Encabezado/IdDoc/FechaCancel, 1, 10)"/>
							</xsl:element>
							<!--<xsl:element name="cbc:ActualDeliveryTime">
							<xsl:value-of select="substring(/DTE/Documento/Encabezado/Traslado/PeriodoDesde, 12, 8)"/>
							</xsl:element>-->
						</xsl:when>
						<xsl:otherwise>
							<xsl:element name="cbc:ActualDeliveryDate">
								<xsl:value-of
									select="substring(/DTE/Documento/Encabezado/IdDoc/FechaEmis, 1, 10)"/>
							</xsl:element>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:element name="cac:DeliveryAddress">
						<xsl:choose>
							<xsl:when test="/DTE/Documento/Encabezado/IdDoc/Tipo != '02'">
								<xsl:element name="cbc:ID">
									<xsl:choose>
										<xsl:when test="(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo') or (/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturoGS')">
											<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/LugarRecep/CodigoPostal"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Ciudad"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:element>
								<xsl:element name="cbc:CityName">
									<xsl:choose>
										<xsl:when test="(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo') or (/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturoGS')">
											<xsl:call-template name="cityName">
												<xsl:with-param name="Municipio"
													select="normalize-space(/DTE/Documento/Encabezado/Receptor/LugarRecep/CodigoPostal)"
												/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="cityName">
												<xsl:with-param name="Municipio"
													select="normalize-space(/DTE/Documento/Encabezado/Receptor/LugarRecep/Ciudad)"
												/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:element>
								<xsl:choose>
									<xsl:when test="/DTE/Documento/Encabezado/Receptor/LugarRecep/CodigoPostal !='' and (not(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo') or not(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturoGS'))">
										<xsl:element name="cbc:PostalZone">
											<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/LugarRecep/CodigoPostal"/>
										</xsl:element>
									</xsl:when>
									<xsl:otherwise>
										<xsl:element name="cbc:PostalZone">
											<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/LugarRecep/GLN"/>
										</xsl:element>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:element name="cbc:CountrySubentity">
									<xsl:variable name="CountrySubentityNameS">
										<xsl:call-template name="countrySubentityName">
											<xsl:with-param name="Departamento"
												select="normalize-space(/DTE/Documento/Encabezado/Receptor/LugarRecep/Departamento)"
											/>
										</xsl:call-template>
									</xsl:variable>
									<xsl:value-of select="$CountrySubentityNameS"/>
								</xsl:element>
								<xsl:element name="cbc:CountrySubentityCode">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Departamento"
									/>
								</xsl:element>
								<xsl:element name="cac:AddressLine">
									<xsl:element name="cbc:Line">
										<xsl:value-of
											select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Calle"/>
									</xsl:element>
								</xsl:element>
								<xsl:element name="cac:Country">
									<xsl:element name="cbc:IdentificationCode">
										<xsl:value-of
											select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Pais"/>
									</xsl:element>
									<xsl:element name="cbc:Name">
										<xsl:attribute name="languageID">
											<xsl:text>es</xsl:text>
										</xsl:attribute>
										<xsl:value-of
											select="concat(substring($PaisLugarRecep, 1, 1), translate(substring($PaisLugarRecep, 2, 100), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'))"
										/>
									</xsl:element>
								</xsl:element>
							</xsl:when>
							<xsl:otherwise>
								<xsl:if
									test="/DTE/Documento/Encabezado/Receptor/LugarRecep/Departamento != ''">
									<xsl:element name="cbc:Department">
										<xsl:value-of
											select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Departamento"
										/>
									</xsl:element>
								</xsl:if>
								<xsl:if
									test="/DTE/Documento/Encabezado/Receptor/LugarRecep/Ciudad != ''">
									<xsl:element name="cbc:CityName">
										<xsl:value-of
											select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Ciudad"
										/>
									</xsl:element>
								</xsl:if>
								<xsl:if test="/DTE/Documento/Encabezado/Receptor/LugarRecep/CodigoPostal != ''">
									<xsl:element name="cbc:PostalZone">
										<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/LugarRecep/CodigoPostal"/>
									</xsl:element>
								</xsl:if>
								<xsl:if
									test="/DTE/Documento/Encabezado/Receptor/LugarRecep/Distrito != ''">
									<xsl:element name="cbc:CountrySubentity">
										<xsl:value-of
											select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Distrito"
										/>
									</xsl:element>
								</xsl:if>
								<xsl:element name="cac:AddressLine">
									<xsl:element name="cbc:Line">
										<xsl:value-of
											select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Calle"/>
									</xsl:element>
								</xsl:element>
								<xsl:element name="cac:Country">
									<xsl:element name="cbc:IdentificationCode">
										<xsl:value-of
											select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Pais"/>
									</xsl:element>
									<xsl:element name="cbc:Name">
										<xsl:attribute name="languageID">
											<xsl:text>es</xsl:text>
										</xsl:attribute>
										<xsl:value-of
											select="concat(substring($PaisLugarRecep, 1, 1), translate(substring($PaisLugarRecep, 2, 100), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'))"
										/>
									</xsl:element>
								</xsl:element>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:element>
					<xsl:if test="/DTE/Documento/Encabezado/Transporte/NmbTransp">
						<xsl:element name="cac:DeliveryParty">
							<xsl:element name="cac:PartyName">
								<xsl:element name="cbc:Name">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Transporte/NmbTransp"/>
								</xsl:element>
							</xsl:element>
							<xsl:element name="cac:PhysicalLocation">
								<xsl:element name="cac:Address">
									<xsl:element name="cbc:ID">
										<xsl:choose>
											<xsl:when test="(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo') or (/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturoGS')">
												<xsl:value-of select="/DTE/Documento/Encabezado/Transporte/DomFiscalTransp/CodigoPostal"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="/DTE/Documento/Encabezado/Transporte/DomFiscalTransp/Ciudad"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:element>
									<xsl:element name="cbc:CityName">
										<xsl:choose>
											<xsl:when test="(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo') or (/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturoGS')">
												<xsl:call-template name="cityName">
													<xsl:with-param name="Municipio"
														select="normalize-space(/DTE/Documento/Encabezado/Transporte/DomFiscalTransp/CodigoPostal)"
													/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="cityName">
													<xsl:with-param name="Municipio"
														select="normalize-space(/DTE/Documento/Encabezado/Transporte/DomFiscalTransp/Ciudad)"
													/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:element>
									<xsl:choose>
										<xsl:when test="/DTE/Documento/Encabezado/Transporte/DomFiscalTransp/CodigoPostal !='' and (not(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo') or not(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturoGS'))">
											<xsl:element name="cbc:PostalZone">
												<xsl:value-of select="/DTE/Documento/Encabezado/Transporte/DomFiscalTransp/CodigoPostal"/>
											</xsl:element>
										</xsl:when>
										<xsl:otherwise>
											<xsl:element name="cbc:PostalZone">
												<xsl:value-of select="/DTE/Documento/Encabezado/Transporte/DomFiscalTransp/GLN"/>
											</xsl:element>
										</xsl:otherwise>
									</xsl:choose>
									<xsl:element name="cbc:CountrySubentity">
										<xsl:variable name="CountrySubentityNameS">
											<xsl:call-template name="countrySubentityName">
												<xsl:with-param name="Departamento"
													select="normalize-space(/DTE/Documento/Encabezado/Transporte/DomFiscalTransp/Departamento)"
												/>
											</xsl:call-template>
										</xsl:variable>
										<xsl:value-of select="$CountrySubentityNameS"/>
									</xsl:element>
									<xsl:element name="cbc:CountrySubentityCode">
										<xsl:value-of
											select="/DTE/Documento/Encabezado/Transporte/DomFiscalTransp/Departamento"
										/>
									</xsl:element>
									<xsl:element name="cac:AddressLine">
										<xsl:element name="cbc:Line">
											<xsl:value-of
												select="/DTE/Documento/Encabezado/Transporte/DomFiscalTransp/Calle"/>
										</xsl:element>
									</xsl:element>
									<xsl:element name="cac:Country">
										<xsl:element name="cbc:IdentificationCode">
											<xsl:value-of
												select="/DTE/Documento/Encabezado/Transporte/DomFiscalTransp/Pais"/>
										</xsl:element>
										<xsl:element name="cbc:Name">
											<xsl:attribute name="languageID">
												<xsl:text>es</xsl:text>
											</xsl:attribute>
											<xsl:value-of
												select="concat(substring($PaisLugarTransp, 1, 1), translate(substring($PaisLugarTransp, 2, 100), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'))"
											/>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:element>
							<xsl:element name="cac:PartyTaxScheme">
								<xsl:element name="cbc:RegistrationName">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Transporte/NmbTransp"/>
								</xsl:element>
								<xsl:element name="cbc:CompanyID">
									<xsl:attribute name="schemeID">
										<xsl:call-template name="calculNIT-dv">
											<xsl:with-param name="NIT"
												select="normalize-space(/DTE/Documento/Encabezado/Transporte/DocTransp/NroDocTransp)"
											/>
										</xsl:call-template>
									</xsl:attribute>
									<xsl:attribute name="schemeName">
										<xsl:value-of
											select="/DTE/Documento/Encabezado/Transporte/DocTransp/TipoDocTransp"
										/>
									</xsl:attribute>
									<xsl:attribute name="schemeAgencyID">
										<xsl:text>195</xsl:text>
									</xsl:attribute>
									<xsl:attribute name="schemeAgencyName">
										<xsl:text>CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)</xsl:text>
									</xsl:attribute>
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Transporte/DocTransp/NroDocTransp"
									/>
								</xsl:element>
								<xsl:element name="cbc:TaxLevelCode">
									<xsl:attribute name="listName">
										<xsl:value-of
											select="/DTE/Documento/Encabezado/Transporte/CodigoTransp[TpoCdgIntTransp = 'TpoReg']/CdgIntTransp/text()"
										/>
									</xsl:attribute>
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Transporte/CodigoTransp[TpoCdgIntTransp = 'TpoObl']/CdgIntTransp/text()"
									/>
								</xsl:element>
								<xsl:element name="cac:TaxScheme">
									<xsl:element name="cbc:ID">
										<xsl:text>01</xsl:text>
									</xsl:element>
									<xsl:element name="cbc:Name">
										<xsl:text>IVA</xsl:text>
									</xsl:element>
								</xsl:element>
							</xsl:element>
							<xsl:element name="cac:PartyLegalEntity">
								<xsl:element name="cbc:RegistrationName">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Transporte/NmbTransp"/>
								</xsl:element>
								<xsl:element name="cbc:CompanyID">
									<xsl:attribute name="schemeID">
										<xsl:call-template name="calculNIT-dv">
											<xsl:with-param name="NIT"
												select="normalize-space(/DTE/Documento/Encabezado/Transporte/DocTransp/NroDocTransp)"
											/>
										</xsl:call-template>
									</xsl:attribute>
									<xsl:attribute name="schemeName">
										<xsl:value-of
											select="/DTE/Documento/Encabezado/Transporte/DocTransp/TipoDocTransp"
										/>
									</xsl:attribute>
									<xsl:attribute name="schemeAgencyID">
										<xsl:text>195</xsl:text>
									</xsl:attribute>
									<xsl:attribute name="schemeAgencyName">
										<xsl:text>CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)</xsl:text>
									</xsl:attribute>
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Transporte/DocTransp/NroDocTransp"
									/>
								</xsl:element>
								<xsl:element name="cac:CorporateRegistrationScheme">
									<xsl:element name="cbc:Name">
										<xsl:value-of
											select="/DTE/Documento/Encabezado/Transporte/CodigoTransp[TpoCdgIntTransp = 'MatMerc']/CdgIntTransp/text()"
										/>
									</xsl:element>
								</xsl:element>
							</xsl:element>
							<!-- Contact of the transportista -->
							<xsl:if test="/DTE/Documento/Encabezado/Transporte/ContactoTransp">
								<xsl:element name="cac:Contact">
									<xsl:if
										test="/DTE/Documento/Encabezado/Transporte/ContactoTransp/Nombre">
										<xsl:element name="cbc:Name">
											<xsl:value-of
												select="/DTE/Documento/Encabezado/Transporte/ContactoTransp/Nombre"
											/>
										</xsl:element>
									</xsl:if>
									<xsl:if
										test="/DTE/Documento/Encabezado/Transporte/ContactoTransp/Telefono">
										<xsl:element name="cbc:Telephone">
											<xsl:value-of
												select="/DTE/Documento/Encabezado/Transporte/ContactoTransp/Telefono"
											/>
										</xsl:element>
									</xsl:if>
									<xsl:if
										test="/DTE/Documento/Encabezado/Transporte/ContactoTransp/Fax">
										<xsl:element name="cbc:Telefax">
											<xsl:value-of
												select="/DTE/Documento/Encabezado/Transporte/ContactoTransp/Fax"
											/>
										</xsl:element>
									</xsl:if>
									<xsl:if
										test="/DTE/Documento/Encabezado/Transporte/ContactoTransp/eMail">
										<xsl:element name="cbc:ElectronicMail">
											<xsl:value-of
												select="/DTE/Documento/Encabezado/Transporte/ContactoTransp/eMail"
											/>
										</xsl:element>
									</xsl:if>
									<xsl:if
										test="/DTE/Documento/Encabezado/Transporte/ContactoTransp/Descripcion">
										<xsl:element name="cbc:Note">
											<xsl:value-of
												select="/DTE/Documento/Encabezado/Transporte/ContactoTransp/Descripcion"
											/>
										</xsl:element>
									</xsl:if>
									<xsl:if
										test="/DTE/Documento/Encabezado/Transporte/ContactoTransp[Tipo = 'Distrib']/eMail">
										<xsl:element name="cac:OtherCommunication">
											<xsl:element name="cbc:Channel">
												<xsl:text>email</xsl:text>
											</xsl:element>
											<xsl:element name="cbc:Value">
												<xsl:value-of
												select="/DTE/Documento/Encabezado/Transporte/ContactoTransp[Tipo = 'Distrib']/eMail"
												/>
											</xsl:element>
										</xsl:element>
									</xsl:if>
								</xsl:element>
							</xsl:if>
						</xsl:element>
					</xsl:if>
				</xsl:element>
			</xsl:if>
			<!-- Delivery Terms -->
			<xsl:if test="/DTE/Documento/Encabezado/IdDoc/Incoterms">
				<xsl:element name="cac:DeliveryTerms">
					<xsl:if test="/DTE/Documento/Encabezado/IdDoc/TermPagoCdg">
						<xsl:element name="cbc:SpecialTerms">
							<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/TermPagoCdg"/>
						</xsl:element>
					</xsl:if>
					<xsl:element name="cbc:LossRiskResponsibilityCode">
						<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/Incoterms/CodIncoterms"
						/>
					</xsl:element>
					<xsl:element name="cbc:LossRisk">
						<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/Incoterms/IncotermDs"/>
					</xsl:element>
				</xsl:element>
			</xsl:if>
			<!-- Payment Means -->
			<xsl:if test="/DTE/Documento/Encabezado/IdDoc/MedioPago">
				<xsl:element name="cac:PaymentMeans">
					<xsl:element name="cbc:ID">
						<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/TipoNegociacion"/>
					</xsl:element>
					<xsl:element name="cbc:PaymentMeansCode">
						<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/MedioPago"/>
					</xsl:element>
					<xsl:if test="/DTE/Documento/Encabezado/IdDoc/FechaVenc">
						<xsl:element name="cbc:PaymentDueDate">
							<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/FechaVenc"/>
						</xsl:element>
					</xsl:if>
					<xsl:if test="/DTE/Documento/Encabezado/IdDoc/IDPago != ''">
						<xsl:element name="cbc:PaymentID">
							<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/IDPago"/>
						</xsl:element>
					</xsl:if>
				</xsl:element>
			</xsl:if>
			<!--Terminos de Pago DIAN MYPE -->
			<!--<xsl:variable name="TipoNegociacion"
				select="/DTE/Documento/Encabezado/IdDoc/TipoNegociacion"/>
			<xsl:variable name="Plazo" select="/DTE/Documento/Encabezado/IdDoc/Plazo"/>
			<xsl:choose>
				<xsl:when test="$TipoNegociacion != '' and $Plazo != ''">
					<xsl:element name="cac:PaymentTerms">
						<xsl:element name="cbc:ReferenceEventCode">
							<xsl:value-of select="$TipoNegociacion"/>
							<!-\- Tipo de venta -\->
						</xsl:element>
						<xsl:element name="cac:SettlementPeriod">
							<xsl:element name="cbc:DurationMeasure">
								<xsl:attribute name="unitCode">
									<xsl:text>DAY</xsl:text>
								</xsl:attribute>
								<xsl:value-of select="$Plazo"/>
								<!-\- Plazo de Pago expresado en dias -\->
							</xsl:element>
						</xsl:element>
					</xsl:element>
				</xsl:when>
			</xsl:choose>-->
			<!-- Prepaid Payment -->
			<xsl:for-each select="/DTE/Documento/Referencia">
				<xsl:choose>
					<xsl:when
						test="(TpoDocRef = '01' and ((MontosRef/Monto) or MontosRef/Monto != ''))">
						<!--Otro tipo de referencia-->
						<xsl:element name="cac:PrepaidPayment">
							<xsl:element name="cbc:ID">
								<xsl:value-of
									select="concat(SerieRef, NumeroRef)"
								/>
							</xsl:element>
							<xsl:element name="cbc:PaidAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of
									select="MontosRef/Monto"
								/>
							</xsl:element>
							<xsl:element name="cbc:ReceivedDate">
								<xsl:value-of
									select="FechaRef"
								/>
							</xsl:element>
							<xsl:element name="cbc:PaidDate">
								<xsl:value-of
									select="FechaRef"
								/>
							</xsl:element>
							<xsl:element name="cbc:InstructionID">
								<xsl:value-of
									select="RazonRef"
								/>
							</xsl:element>
						</xsl:element>
					</xsl:when>
				</xsl:choose>
				<!--Contract Reference-->
				
			</xsl:for-each>
			
			<!--<xsl:if test="/DTE/Documento/Referencia[TpoDocRef = '01']/MontosRef/Monto">
				<xsl:element name="cac:PrepaidPayment">
					<xsl:element name="cbc:ID">
						<xsl:value-of
							select="concat(//Referencia[TpoDocRef = '01'][boolean(MontosRef/Monto)]/SerieRef, //Referencia[TpoDocRef = '01'][boolean(MontosRef/Monto)]/NumeroRef)"
						/>
					</xsl:element>
					<xsl:element name="cbc:PaidAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of
							select="//Referencia[TpoDocRef = '01'][boolean(MontosRef/Monto)]/MontosRef/Monto"
						/>
					</xsl:element>
					<xsl:element name="cbc:ReceivedDate">
						<xsl:value-of
							select="//Referencia[TpoDocRef = '01'][boolean(MontosRef/Monto)]/FechaRef"
						/>
					</xsl:element>
					<xsl:element name="cbc:PaidDate">
						<xsl:value-of
							select="//Referencia[TpoDocRef = '01'][boolean(MontosRef/Monto)]/FechaRef"
						/>
					</xsl:element>
					<xsl:element name="cbc:InstructionID">
						<xsl:value-of
							select="//Referencia[TpoDocRef = '01'][boolean(MontosRef/Monto)]/RazonRef"
						/>
					</xsl:element>
				</xsl:element>
			</xsl:if>
			--><!-- Allowance Charges -->
			<xsl:for-each select="/DTE/Documento/DscRcgGlobal">
				<xsl:element name="cac:AllowanceCharge">
					<xsl:element name="cbc:ID">
						<xsl:value-of select="position()"/>
					</xsl:element>
					<xsl:element name="cbc:ChargeIndicator">
						<xsl:choose>
							<xsl:when test="TpoMov = 'D'">
								<xsl:value-of select="false()"/>
							</xsl:when>
							<xsl:when test="TpoMov = 'R'">
								<xsl:value-of select="true()"/>
							</xsl:when>
						</xsl:choose>
					</xsl:element>
					<xsl:if test="TpoMov = 'D'">
						<xsl:element name="cbc:AllowanceChargeReasonCode">
							<xsl:choose>
								<xsl:when test="CodigoDR">
									<xsl:value-of select="CodigoDR"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="'11'"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:element>
					</xsl:if>
					<xsl:if test="GlosaDR != '' and //IdDoc/Tipo != '02'">
						<xsl:element name="cbc:AllowanceChargeReason">
							<xsl:value-of select="GlosaDR"/>
						</xsl:element>
					</xsl:if>
					<xsl:if test="not(GlosaDR) or GlosaDR = '' and //IdDoc/Tipo != '02'">
						<xsl:element name="cbc:AllowanceChargeReason">
							<xsl:call-template name="CodigoDescuento">
								<xsl:with-param name="CodDesc">
									<xsl:value-of select="CodigoDR"/>
								</xsl:with-param>
							</xsl:call-template>
						</xsl:element>
					</xsl:if>
					<xsl:if test="GlosaDR != '' and //IdDoc/Tipo = '02'">
						<xsl:element name="cbc:AllowanceChargeReason">
							<xsl:value-of select="GlosaDR"/>
						</xsl:element>
					</xsl:if>
					<xsl:element name="cbc:MultiplierFactorNumeric">
						<xsl:value-of select="format-number(PctDR, '#0.00')"/>
					</xsl:element>
					<xsl:element name="cbc:Amount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="format-number(ValorDR, '#0.00')"/>
					</xsl:element>
					<xsl:element name="cbc:BaseAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="format-number(ValorDR div (PctDR div 100), '#0.00')"/>
					</xsl:element>
				</xsl:element>
			</xsl:for-each>
			<!-- Payment Exchange Rate -->
			<xsl:if test="$MonedaC != 'COP'">
				<xsl:element name="cac:PaymentExchangeRate">
					<xsl:element name="cbc:SourceCurrencyCode">
						<xsl:value-of select="$MonedaC"/>
					</xsl:element>
					<xsl:element name="cbc:SourceCurrencyBaseRate">
						<xsl:value-of select="'1.00'"/>
					</xsl:element>
					<xsl:element name="cbc:TargetCurrencyCode">
						<xsl:value-of select="'COP'"/>
					</xsl:element>
					<xsl:element name="cbc:TargetCurrencyBaseRate">
						<xsl:value-of select="'1.00'"/>
					</xsl:element>
					<xsl:element name="cbc:CalculationRate">
						<xsl:value-of select="format-number(/DTE/Documento/Encabezado/Totales/FctConv,'#0.0000')"/>
					</xsl:element>
					<xsl:element name="cbc:Date">
						<xsl:value-of
							select="substring-before(/DTE/Documento/Encabezado/IdDoc/FechaEmis, 'T')"
						/>
					</xsl:element>
				</xsl:element>
			</xsl:if>
			<!-- Impuestos a nivel global -->
			<xsl:variable name="SumImp01">
				<xsl:value-of select="sum(/DTE/Documento/Encabezado/Impuestos[TipoImp = '01']/MontoImp)"/>
			</xsl:variable>
			<xsl:variable name="SumImpBase01">
				<xsl:value-of select="(sum((/DTE/Documento/Encabezado/Impuestos[TipoImp = '01'][1]/MontoBAseImp[1]*((/DTE/Documento/Encabezado/Impuestos[TipoImp = '01'][1]/TasaImp[1]) div 100))-/DTE/Documento/Encabezado/Impuestos[TipoImp = '01'][1]/MontoImp[1])) + (sum((/DTE/Documento/Encabezado/Impuestos[TipoImp = '01'][2]/MontoBAseImp[2]*((/DTE/Documento/Encabezado/Impuestos[TipoImp = '01'][2]/TasaImp[2]) div 100))-/DTE/Documento/Encabezado/Impuestos[TipoImp = '01'][2]/MontoImp[2])) + (sum((/DTE/Documento/Encabezado/Impuestos[TipoImp = '01'][3]/MontoBAseImp[3]*((/DTE/Documento/Encabezado/Impuestos[TipoImp = '01'][3]/TasaImp[3]) div 100))-/DTE/Documento/Encabezado/Impuestos[TipoImp = '01'][3]/MontoImp[3]))"/>
			</xsl:variable>
			<xsl:variable name="SumImp02">
				<xsl:value-of select="sum(/DTE/Documento/Encabezado/Impuestos[TipoImp = '02']/MontoImp)"/>
			</xsl:variable>
			<xsl:variable name="SumImpBase02">
				<xsl:value-of select="(sum((/DTE/Documento/Encabezado/Impuestos[TipoImp = '02'][1]/MontoBAseImp[1]*((/DTE/Documento/Encabezado/Impuestos[TipoImp = '02'][1]/TasaImp[1]) div 100))-/DTE/Documento/Encabezado/Impuestos[TipoImp = '02'][1]/MontoImp[1])) + (sum((/DTE/Documento/Encabezado/Impuestos[TipoImp = '02'][2]/MontoBAseImp[2]*((/DTE/Documento/Encabezado/Impuestos[TipoImp = '02'][2]/TasaImp[2]) div 100))-/DTE/Documento/Encabezado/Impuestos[TipoImp = '02'][2]/MontoImp[2])) + (sum((/DTE/Documento/Encabezado/Impuestos[TipoImp = '02'][3]/MontoBAseImp[3]*((/DTE/Documento/Encabezado/Impuestos[TipoImp = '02'][3]/TasaImp[3]) div 100))-/DTE/Documento/Encabezado/Impuestos[TipoImp = '02'][3]/MontoImp[3]))"/>
			</xsl:variable>
			<xsl:variable name="SumImp03">
				<xsl:value-of select="sum(/DTE/Documento/Encabezado/Impuestos[TipoImp = '03']/MontoImp)"/>
			</xsl:variable>
			<xsl:variable name="SumImpBase03">
				<xsl:value-of select="(sum((/DTE/Documento/Encabezado/Impuestos[TipoImp = '03'][1]/MontoBAseImp[1]*((/DTE/Documento/Encabezado/Impuestos[TipoImp = '03'][1]/TasaImp[1]) div 100))-/DTE/Documento/Encabezado/Impuestos[TipoImp = '03'][1]/MontoImp[1])) + (sum((/DTE/Documento/Encabezado/Impuestos[TipoImp = '03'][2]/MontoBAseImp[2]*((/DTE/Documento/Encabezado/Impuestos[TipoImp = '03'][2]/TasaImp[2]) div 100))-/DTE/Documento/Encabezado/Impuestos[TipoImp = '03'][2]/MontoImp[2])) + (sum((/DTE/Documento/Encabezado/Impuestos[TipoImp = '03'][3]/MontoBAseImp[3]*((/DTE/Documento/Encabezado/Impuestos[TipoImp = '03'][3]/TasaImp[3]) div 100))-/DTE/Documento/Encabezado/Impuestos[TipoImp = '03'][3]/MontoImp[3]))"/>
			</xsl:variable>
			<xsl:variable name="SumImp04">
				<xsl:value-of select="sum(/DTE/Documento/Encabezado/Impuestos[TipoImp = '04']/MontoImp)"/>
			</xsl:variable>
			<xsl:variable name="SumImpBase04">
				<xsl:value-of select="(sum((/DTE/Documento/Encabezado/Impuestos[TipoImp = '04'][1]/MontoBAseImp[1]*((/DTE/Documento/Encabezado/Impuestos[TipoImp = '04'][1]/TasaImp[1]) div 100))-/DTE/Documento/Encabezado/Impuestos[TipoImp = '04'][1]/MontoImp[1])) + (sum((/DTE/Documento/Encabezado/Impuestos[TipoImp = '04'][2]/MontoBAseImp[2]*((/DTE/Documento/Encabezado/Impuestos[TipoImp = '04'][2]/TasaImp[2]) div 100))-/DTE/Documento/Encabezado/Impuestos[TipoImp = '04'][2]/MontoImp[2])) + (sum((/DTE/Documento/Encabezado/Impuestos[TipoImp = '04'][3]/MontoBAseImp[3]*((/DTE/Documento/Encabezado/Impuestos[TipoImp = '04'][3]/TasaImp[3]) div 100))-/DTE/Documento/Encabezado/Impuestos[TipoImp = '04'][3]/MontoImp[3]))"/>
			</xsl:variable>
			<xsl:variable name="SumImp20">
				<xsl:value-of select="sum(/DTE/Documento/Encabezado/Impuestos[TipoImp = '20']/MontoImp)"/>
			</xsl:variable>
			<xsl:variable name="SumImp21">
				<xsl:value-of select="sum(/DTE/Documento/Encabezado/Impuestos[TipoImp = '21']/MontoImp)"/>
			</xsl:variable>
			<xsl:variable name="SumImp22">
				<xsl:value-of select="sum(/DTE/Documento/Encabezado/Impuestos[TipoImp = '22']/MontoImp)"/>
			</xsl:variable>
			<xsl:variable name="SumImp23">
				<xsl:value-of select="sum(/DTE/Documento/Encabezado/Impuestos[TipoImp = '23']/MontoImp)"/>
			</xsl:variable>
			<xsl:variable name="SumImp24">
				<xsl:value-of select="sum(/DTE/Documento/Encabezado/Impuestos[TipoImp = '24']/MontoImp)"/>
			</xsl:variable>
			<xsl:variable name="SumImp25">
				<xsl:value-of select="sum(/DTE/Documento/Encabezado/Impuestos[TipoImp = '25']/MontoImp)"/>
			</xsl:variable>
			<xsl:variable name="SumImp26">
				<xsl:value-of select="sum(/DTE/Documento/Encabezado/Impuestos[TipoImp = '26']/MontoImp)"/>
			</xsl:variable>
			<xsl:for-each select="/DTE/Documento/Encabezado/Impuestos[TipoImp = '01'][1]">
				<xsl:element name="cac:TaxTotal">
					<xsl:element name="cbc:TaxAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="format-number($SumImp01, '#0.00')"/>
					</xsl:element>
					<xsl:element name="cbc:RoundingAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="format-number($SumImpBase01, '#0.00')"/>
					</xsl:element>
					<xsl:for-each select="../Impuestos[TipoImp = '01']">
						<xsl:element name="cac:TaxSubtotal">
							<xsl:if test="not(PrecioPorUnidad)">
								<xsl:element name="cbc:TaxableAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of
										select="normalize-space(format-number(MontoBAseImp, '#0.00'))"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
							</xsl:element>
							<xsl:if test="UnidadMedida">
								<xsl:element name="cbc:BaseUnitMeasure">
									<xsl:attribute name="unitCode">
										<xsl:value-of select="UnidadMedida"/>
									</xsl:attribute>
									<xsl:value-of select="'1.000000'"/>
								</xsl:element>
							</xsl:if>
							<xsl:if test="PrecioPorUnidad">
								<xsl:element name="cbc:PerUnitAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cac:TaxCategory">
								<xsl:if test="not(PrecioPorUnidad)">
									<xsl:choose>
										<xsl:when test="TipoImp = '03'">
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
											</xsl:element>
										</xsl:when>
										<xsl:otherwise>
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
											</xsl:element>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:element name="cac:TaxScheme">
									<xsl:element name="cbc:ID">
										<xsl:value-of select="TipoImp"/>
									</xsl:element>
									<xsl:element name="cbc:Name">
										<xsl:call-template name="TipoImpuesto">
											<xsl:with-param name="TpoImp">
												<xsl:value-of select="TipoImp"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="/DTE/Documento/Encabezado/Impuestos[TipoImp = '02'][1]">
				<xsl:element name="cac:TaxTotal">
					<xsl:element name="cbc:TaxAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:if test="TipoImp = '02'">
							<xsl:value-of select="format-number($SumImp02, '#0.00')"/>
						</xsl:if>
					</xsl:element>
					<xsl:element name="cbc:RoundingAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="format-number($SumImpBase02, '#0.00')"/>
					</xsl:element>
					<xsl:for-each select="../Impuestos[TipoImp = '02']">
						<xsl:element name="cac:TaxSubtotal">
							<xsl:if test="not(PrecioPorUnidad)">
								<xsl:element name="cbc:TaxableAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of
										select="normalize-space(format-number(MontoBAseImp, '#0.00'))"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
							</xsl:element>
							<xsl:if test="UnidadMedida">
								<xsl:element name="cbc:BaseUnitMeasure">
									<xsl:attribute name="unitCode">
										<xsl:value-of select="UnidadMedida"/>
									</xsl:attribute>
									<xsl:value-of select="'1.000000'"/>
								</xsl:element>
							</xsl:if>
							<xsl:if test="PrecioPorUnidad">
								<xsl:element name="cbc:PerUnitAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cac:TaxCategory">
								<xsl:if test="not(PrecioPorUnidad)">
									<xsl:choose>
										<xsl:when test="TipoImp = '03'">
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
											</xsl:element>
										</xsl:when>
										<xsl:otherwise>
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
											</xsl:element>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:element name="cac:TaxScheme">
									<xsl:element name="cbc:ID">
										<xsl:value-of select="TipoImp"/>
									</xsl:element>
									<xsl:element name="cbc:Name">
										<xsl:call-template name="TipoImpuesto">
											<xsl:with-param name="TpoImp">
												<xsl:value-of select="TipoImp"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="/DTE/Documento/Encabezado/Impuestos[TipoImp = '03'][1]">
				<xsl:element name="cac:TaxTotal">
					<xsl:element name="cbc:TaxAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:if test="TipoImp = '03'">
							<xsl:value-of select="format-number($SumImp03, '#0.00')"/>
						</xsl:if>
					</xsl:element>
					<xsl:element name="cbc:RoundingAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="format-number($SumImpBase03, '#0.00')"/>
					</xsl:element>
					<xsl:for-each select="../Impuestos[TipoImp = '03']">
						<xsl:element name="cac:TaxSubtotal">
							<xsl:if test="not(PrecioPorUnidad)">
								<xsl:element name="cbc:TaxableAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of
										select="normalize-space(format-number(MontoBAseImp, '#0.00'))"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
							</xsl:element>
							<xsl:if test="UnidadMedida">
								<xsl:element name="cbc:BaseUnitMeasure">
									<xsl:attribute name="unitCode">
										<xsl:value-of select="UnidadMedida"/>
									</xsl:attribute>
									<xsl:value-of select="'1.000000'"/>
								</xsl:element>
							</xsl:if>
							<xsl:if test="PrecioPorUnidad">
								<xsl:element name="cbc:PerUnitAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cac:TaxCategory">
								<xsl:if test="not(PrecioPorUnidad)">
									<xsl:choose>
										<xsl:when test="TipoImp = '03'">
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
											</xsl:element>
										</xsl:when>
										<xsl:otherwise>
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
											</xsl:element>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:element name="cac:TaxScheme">
									<xsl:element name="cbc:ID">
										<xsl:value-of select="TipoImp"/>
									</xsl:element>
									<xsl:element name="cbc:Name">
										<xsl:call-template name="TipoImpuesto">
											<xsl:with-param name="TpoImp">
												<xsl:value-of select="TipoImp"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="/DTE/Documento/Encabezado/Impuestos[TipoImp = '04'][1]">
				<xsl:element name="cac:TaxTotal">
					<xsl:element name="cbc:TaxAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:if test="TipoImp = '04'">
							<xsl:value-of select="format-number($SumImp04, '#0.00')"/>
						</xsl:if>
					</xsl:element>
					<xsl:element name="cbc:RoundingAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="format-number($SumImpBase04, '#0.00')"/>
					</xsl:element>
					<xsl:for-each select="../Impuestos[TipoImp = '04']">
						<xsl:element name="cac:TaxSubtotal">
							<xsl:if test="not(PrecioPorUnidad)">
								<xsl:element name="cbc:TaxableAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of
										select="normalize-space(format-number(MontoBAseImp, '#0.00'))"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
							</xsl:element>
							<xsl:if test="UnidadMedida">
								<xsl:element name="cbc:BaseUnitMeasure">
									<xsl:attribute name="unitCode">
										<xsl:value-of select="UnidadMedida"/>
									</xsl:attribute>
									<xsl:value-of select="'1.000000'"/>
								</xsl:element>
							</xsl:if>
							<xsl:if test="PrecioPorUnidad">
								<xsl:element name="cbc:PerUnitAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cac:TaxCategory">
								<xsl:if test="not(PrecioPorUnidad)">
									<xsl:choose>
										<xsl:when test="TipoImp = '03'">
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
											</xsl:element>
										</xsl:when>
										<xsl:otherwise>
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
											</xsl:element>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:element name="cac:TaxScheme">
									<xsl:element name="cbc:ID">
										<xsl:value-of select="TipoImp"/>
									</xsl:element>
									<xsl:element name="cbc:Name">
										<xsl:call-template name="TipoImpuesto">
											<xsl:with-param name="TpoImp">
												<xsl:value-of select="TipoImp"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="/DTE/Documento/Encabezado/Impuestos[TipoImp = '20'][1]">
				<xsl:element name="cac:TaxTotal">
					<xsl:element name="cbc:TaxAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:if test="TipoImp = '20'">
							<xsl:value-of select="format-number($SumImp20, '#0.00')"/>
						</xsl:if>
					</xsl:element>
					<xsl:for-each select="../Impuestos[TipoImp = '20']">
						<xsl:element name="cac:TaxSubtotal">
							<xsl:if test="not(PrecioPorUnidad)">
								<xsl:element name="cbc:TaxableAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of
										select="normalize-space(format-number(MontoBAseImp, '#0.00'))"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
							</xsl:element>
							<xsl:if test="UnidadMedida">
								<xsl:element name="cbc:BaseUnitMeasure">
									<xsl:attribute name="unitCode">
										<xsl:value-of select="UnidadMedida"/>
									</xsl:attribute>
									<xsl:value-of select="'1.000000'"/>
								</xsl:element>
							</xsl:if>
							<xsl:if test="PrecioPorUnidad">
								<xsl:element name="cbc:PerUnitAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cac:TaxCategory">
								<xsl:if test="not(PrecioPorUnidad)">
									<xsl:choose>
										<xsl:when test="TipoImp = '03'">
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
											</xsl:element>
										</xsl:when>
										<xsl:otherwise>
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
											</xsl:element>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:element name="cac:TaxScheme">
									<xsl:element name="cbc:ID">
										<xsl:value-of select="TipoImp"/>
									</xsl:element>
									<xsl:element name="cbc:Name">
										<xsl:call-template name="TipoImpuesto">
											<xsl:with-param name="TpoImp">
												<xsl:value-of select="TipoImp"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="/DTE/Documento/Encabezado/Impuestos[TipoImp = '21'][1]">
				<xsl:element name="cac:TaxTotal">
					<xsl:element name="cbc:TaxAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:if test="TipoImp = '21'">
							<xsl:value-of select="format-number($SumImp21, '#0.00')"/>
						</xsl:if>
					</xsl:element>
					<xsl:for-each select="../Impuestos[TipoImp = '21']">
						<xsl:element name="cac:TaxSubtotal">
							<xsl:if test="not(PrecioPorUnidad)">
								<xsl:element name="cbc:TaxableAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of
										select="normalize-space(format-number(MontoBAseImp, '#0.00'))"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
							</xsl:element>
							<xsl:if test="UnidadMedida">
								<xsl:element name="cbc:BaseUnitMeasure">
									<xsl:attribute name="unitCode">
										<xsl:value-of select="UnidadMedida"/>
									</xsl:attribute>
									<xsl:value-of select="'1.000000'"/>
								</xsl:element>
							</xsl:if>
							<xsl:if test="PrecioPorUnidad">
								<xsl:element name="cbc:PerUnitAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cac:TaxCategory">
								<xsl:if test="not(PrecioPorUnidad)">
									<xsl:choose>
										<xsl:when test="TipoImp = '03'">
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
											</xsl:element>
										</xsl:when>
										<xsl:otherwise>
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
											</xsl:element>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:element name="cac:TaxScheme">
									<xsl:element name="cbc:ID">
										<xsl:value-of select="TipoImp"/>
									</xsl:element>
									<xsl:element name="cbc:Name">
										<xsl:call-template name="TipoImpuesto">
											<xsl:with-param name="TpoImp">
												<xsl:value-of select="TipoImp"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="/DTE/Documento/Encabezado/Impuestos[TipoImp = '22'][1]">
				<xsl:element name="cac:TaxTotal">
					<xsl:element name="cbc:TaxAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:if test="TipoImp = '22'">
							<xsl:value-of select="format-number($SumImp22, '#0.00')"/>
						</xsl:if>
					</xsl:element>
					<xsl:for-each select="../Impuestos[TipoImp = '22']">
						<xsl:element name="cac:TaxSubtotal">
							<xsl:if test="not(PrecioPorUnidad)">
								<xsl:element name="cbc:TaxableAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of
										select="normalize-space(format-number(MontoBAseImp, '#0.00'))"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
							</xsl:element>
							<xsl:if test="UnidadMedida">
								<xsl:element name="cbc:BaseUnitMeasure">
									<xsl:attribute name="unitCode">
										<xsl:value-of select="UnidadMedida"/>
									</xsl:attribute>
									<xsl:value-of select="'1.000000'"/>
								</xsl:element>
							</xsl:if>
							<xsl:if test="PrecioPorUnidad">
								<xsl:element name="cbc:PerUnitAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cac:TaxCategory">
								<xsl:if test="not(PrecioPorUnidad)">
									<xsl:choose>
										<xsl:when test="TipoImp = '03'">
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
											</xsl:element>
										</xsl:when>
										<xsl:otherwise>
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
											</xsl:element>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:element name="cac:TaxScheme">
									<xsl:element name="cbc:ID">
										<xsl:value-of select="TipoImp"/>
									</xsl:element>
									<xsl:element name="cbc:Name">
										<xsl:call-template name="TipoImpuesto">
											<xsl:with-param name="TpoImp">
												<xsl:value-of select="TipoImp"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="/DTE/Documento/Encabezado/Impuestos[TipoImp = '23'][1]">
				<xsl:element name="cac:TaxTotal">
					<xsl:element name="cbc:TaxAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:if test="TipoImp = '23'">
							<xsl:value-of select="format-number($SumImp23, '#0.00')"/>
						</xsl:if>
					</xsl:element>
					<xsl:for-each select="../Impuestos[TipoImp = '23']">
						<xsl:element name="cac:TaxSubtotal">
							<xsl:if test="not(PrecioPorUnidad)">
								<xsl:element name="cbc:TaxableAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of
										select="normalize-space(format-number(MontoBAseImp, '#0.00'))"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
							</xsl:element>
							<xsl:if test="UnidadMedida">
								<xsl:element name="cbc:BaseUnitMeasure">
									<xsl:attribute name="unitCode">
										<xsl:value-of select="UnidadMedida"/>
									</xsl:attribute>
									<xsl:value-of select="'1.000000'"/>
								</xsl:element>
							</xsl:if>
							<xsl:if test="PrecioPorUnidad">
								<xsl:element name="cbc:PerUnitAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cac:TaxCategory">
								<xsl:if test="not(PrecioPorUnidad)">
									<xsl:choose>
										<xsl:when test="TipoImp = '03'">
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
											</xsl:element>
										</xsl:when>
										<xsl:otherwise>
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
											</xsl:element>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:element name="cac:TaxScheme">
									<xsl:element name="cbc:ID">
										<xsl:value-of select="TipoImp"/>
									</xsl:element>
									<xsl:element name="cbc:Name">
										<xsl:call-template name="TipoImpuesto">
											<xsl:with-param name="TpoImp">
												<xsl:value-of select="TipoImp"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="/DTE/Documento/Encabezado/Impuestos[TipoImp = '24'][1]">
				<xsl:element name="cac:TaxTotal">
					<xsl:element name="cbc:TaxAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:if test="TipoImp = '24'">
							<xsl:value-of select="format-number($SumImp24, '#0.00')"/>
						</xsl:if>
					</xsl:element>
					<xsl:for-each select="../Impuestos[TipoImp = '24']">
						<xsl:element name="cac:TaxSubtotal">
							<xsl:if test="not(PrecioPorUnidad)">
								<xsl:element name="cbc:TaxableAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of
										select="normalize-space(format-number(MontoBAseImp, '#0.00'))"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
							</xsl:element>
							<xsl:if test="UnidadMedida">
								<xsl:element name="cbc:BaseUnitMeasure">
									<xsl:attribute name="unitCode">
										<xsl:value-of select="UnidadMedida"/>
									</xsl:attribute>
									<xsl:value-of select="'1.000000'"/>
								</xsl:element>
							</xsl:if>
							<xsl:if test="PrecioPorUnidad">
								<xsl:element name="cbc:PerUnitAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cac:TaxCategory">
								<xsl:if test="not(PrecioPorUnidad)">
									<xsl:choose>
										<xsl:when test="TipoImp = '03'">
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
											</xsl:element>
										</xsl:when>
										<xsl:otherwise>
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
											</xsl:element>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:element name="cac:TaxScheme">
									<xsl:element name="cbc:ID">
										<xsl:value-of select="TipoImp"/>
									</xsl:element>
									<xsl:element name="cbc:Name">
										<xsl:call-template name="TipoImpuesto">
											<xsl:with-param name="TpoImp">
												<xsl:value-of select="TipoImp"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="/DTE/Documento/Encabezado/Impuestos[TipoImp = '25'][1]">
				<xsl:element name="cac:TaxTotal">
					<xsl:element name="cbc:TaxAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:if test="TipoImp = '25'">
							<xsl:value-of select="format-number($SumImp25, '#0.00')"/>
						</xsl:if>
					</xsl:element>
					<xsl:for-each select="../Impuestos[TipoImp = '25']">
						<xsl:element name="cac:TaxSubtotal">
							<xsl:if test="not(PrecioPorUnidad)">
								<xsl:element name="cbc:TaxableAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of
										select="normalize-space(format-number(MontoBAseImp, '#0.00'))"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
							</xsl:element>
							<xsl:if test="UnidadMedida">
								<xsl:element name="cbc:BaseUnitMeasure">
									<xsl:attribute name="unitCode">
										<xsl:value-of select="UnidadMedida"/>
									</xsl:attribute>
									<xsl:value-of select="'1.000000'"/>
								</xsl:element>
							</xsl:if>
							<xsl:if test="PrecioPorUnidad">
								<xsl:element name="cbc:PerUnitAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cac:TaxCategory">
								<xsl:if test="not(PrecioPorUnidad)">
									<xsl:choose>
										<xsl:when test="TipoImp = '03'">
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
											</xsl:element>
										</xsl:when>
										<xsl:otherwise>
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
											</xsl:element>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:element name="cac:TaxScheme">
									<xsl:element name="cbc:ID">
										<xsl:value-of select="TipoImp"/>
									</xsl:element>
									<xsl:element name="cbc:Name">
										<xsl:call-template name="TipoImpuesto">
											<xsl:with-param name="TpoImp">
												<xsl:value-of select="TipoImp"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="/DTE/Documento/Encabezado/Impuestos[TipoImp = '26'][1]">
				<xsl:element name="cac:TaxTotal">
					<xsl:element name="cbc:TaxAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:if test="TipoImp = '26'">
							<xsl:value-of select="format-number($SumImp26, '#0.00')"/>
						</xsl:if>
					</xsl:element>
					<xsl:for-each select="../Impuestos[TipoImp = '26']">
						<xsl:element name="cac:TaxSubtotal">
							<xsl:if test="not(PrecioPorUnidad)">
								<xsl:element name="cbc:TaxableAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of
										select="normalize-space(format-number(MontoBAseImp, '#0.00'))"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
							</xsl:element>
							<xsl:if test="UnidadMedida">
								<xsl:element name="cbc:BaseUnitMeasure">
									<xsl:attribute name="unitCode">
										<xsl:value-of select="UnidadMedida"/>
									</xsl:attribute>
									<xsl:value-of select="'1.000000'"/>
								</xsl:element>
							</xsl:if>
							<xsl:if test="PrecioPorUnidad">
								<xsl:element name="cbc:PerUnitAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cac:TaxCategory">
								<xsl:if test="not(PrecioPorUnidad)">
									<xsl:choose>
										<xsl:when test="TipoImp = '03'">
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
											</xsl:element>
										</xsl:when>
										<xsl:otherwise>
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
											</xsl:element>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:element name="cac:TaxScheme">
									<xsl:element name="cbc:ID">
										<xsl:value-of select="TipoImp"/>
									</xsl:element>
									<xsl:element name="cbc:Name">
										<xsl:call-template name="TipoImpuesto">
											<xsl:with-param name="TpoImp">
												<xsl:value-of select="TipoImp"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
			<!-- Retencion a nivel global -->
			<xsl:variable name="SumRet05">
				<xsl:value-of select="sum(/DTE/Documento/Encabezado/Retenciones[TipoRet = '05']/MontoRet)"/>
			</xsl:variable>
			<xsl:variable name="SumRet06">
				<xsl:value-of select="sum(/DTE/Documento/Encabezado/Retenciones[TipoRet = '06']/MontoRet)"/>
			</xsl:variable>
			<xsl:variable name="SumRet07">
				<xsl:value-of select="sum(/DTE/Documento/Encabezado/Retenciones[TipoRet = '07']/MontoRet)"/>
			</xsl:variable>
			<xsl:variable name="SumRet08">
				<xsl:value-of select="sum(/DTE/Documento/Encabezado/Retenciones[TipoRet = '08']/MontoRet)"/>
			</xsl:variable>
			<xsl:for-each select="/DTE/Documento/Encabezado/Retenciones[TipoRet = '05'][1]">
				<xsl:element name="cac:WithholdingTaxTotal">
					<xsl:element name="cbc:TaxAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="format-number($SumRet05, '#0.00')"/>
					</xsl:element>
					<xsl:for-each select="../Retenciones[TipoRet = '05']">
						<xsl:element name="cac:TaxSubtotal">
								<xsl:element name="cbc:TaxableAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of
										select="normalize-space(format-number(MontoBaseRet, '#0.00'))"/>
								</xsl:element>
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number(MontoRet, '#0.00')"/>
							</xsl:element>
							<xsl:element name="cac:TaxCategory">
								<xsl:element name="cbc:Percent">
									<xsl:value-of select="format-number(TasaRet, '#0.00')"/>
								</xsl:element>
								<xsl:element name="cac:TaxScheme">
									<xsl:element name="cbc:ID">
										<xsl:value-of select="TipoRet"/>
									</xsl:element>
									<xsl:element name="cbc:Name">
										<xsl:call-template name="TipoImpuesto">
											<xsl:with-param name="TpoImp">
												<xsl:value-of select="TipoRet"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="/DTE/Documento/Encabezado/Retenciones[TipoRet = '06'][1]">
				<xsl:element name="cac:WithholdingTaxTotal">
					<xsl:element name="cbc:TaxAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="format-number($SumRet06, '#0.00')"/>
					</xsl:element>
					<xsl:for-each select="../Retenciones[TipoRet = '06']">
						<xsl:element name="cac:TaxSubtotal">
							<xsl:element name="cbc:TaxableAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of
									select="normalize-space(format-number(MontoBaseRet, '#0.00'))"/>
							</xsl:element>
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number(MontoRet, '#0.00')"/>
							</xsl:element>
							<xsl:element name="cac:TaxCategory">
								<xsl:element name="cbc:Percent">
									<xsl:value-of select="format-number(TasaRet, '#0.00')"/>
								</xsl:element>
								<xsl:element name="cac:TaxScheme">
									<xsl:element name="cbc:ID">
										<xsl:value-of select="TipoRet"/>
									</xsl:element>
									<xsl:element name="cbc:Name">
										<xsl:call-template name="TipoImpuesto">
											<xsl:with-param name="TpoImp">
												<xsl:value-of select="TipoRet"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="/DTE/Documento/Encabezado/Retenciones[TipoRet = '07'][1]">
				<xsl:element name="cac:WithholdingTaxTotal">
					<xsl:element name="cbc:TaxAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="format-number($SumRet07, '#0.00')"/>
					</xsl:element>
					<xsl:for-each select="../Retenciones[TipoRet = '07']">
						<xsl:element name="cac:TaxSubtotal">
							<xsl:element name="cbc:TaxableAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of
									select="normalize-space(format-number(MontoBaseRet, '#0.00'))"/>
							</xsl:element>
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number(MontoRet, '#0.00')"/>
							</xsl:element>
							<xsl:element name="cac:TaxCategory">
								<xsl:element name="cbc:Percent">
									<xsl:value-of select="format-number(TasaRet, '#0.000')"/>
								</xsl:element>
								<xsl:element name="cac:TaxScheme">
									<xsl:element name="cbc:ID">
										<xsl:value-of select="TipoRet"/>
									</xsl:element>
									<xsl:element name="cbc:Name">
										<xsl:call-template name="TipoImpuesto">
											<xsl:with-param name="TpoImp">
												<xsl:value-of select="TipoRet"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="/DTE/Documento/Encabezado/Retenciones[TipoRet = '08'][1]">
				<xsl:element name="cac:WithholdingTaxTotal">
					<xsl:element name="cbc:TaxAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="format-number($SumRet08, '#0.00')"/>
					</xsl:element>
					<xsl:for-each select="../Retenciones[TipoRet = '08']">
						<xsl:element name="cac:TaxSubtotal">
							<xsl:element name="cbc:TaxableAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of
									select="normalize-space(format-number(MontoBaseRet, '#0.00'))"/>
							</xsl:element>
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number(MontoRet, '#0.00')"/>
							</xsl:element>
							<xsl:element name="cac:TaxCategory">
								<xsl:element name="cbc:Percent">
									<xsl:value-of select="format-number(TasaRet, '#0.000')"/>
								</xsl:element>
								<xsl:element name="cac:TaxScheme">
									<xsl:element name="cbc:ID">
										<xsl:value-of select="TipoRet"/>
									</xsl:element>
									<xsl:element name="cbc:Name">
										<xsl:call-template name="TipoImpuesto">
											<xsl:with-param name="TpoImp">
												<xsl:value-of select="TipoRet"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
			<!-- TOTALS OF THE INVOICE -->
			<xsl:variable name="HLEAmount"
				select="normalize-space(format-number(/DTE/Documento/Encabezado/Totales/SubTotal, '#0.00'))"/>
			<xsl:variable name="TEAmount"
				select="normalize-space(format-number(/DTE/Documento/Encabezado/Totales/MntBase, '#0.00'))"/>
			<xsl:variable name="TIAmount"
				select="normalize-space(format-number(/DTE/Documento/Encabezado/Totales/SubTotal + /DTE/Documento/Encabezado/Totales/MntImp, '#0.00'))"/>
			<xsl:variable name="PAmount"
				select="normalize-space(format-number(/DTE/Documento/Encabezado/Totales/VlrPagar, '#0.00'))"/>
			<xsl:variable name="DescuentoGlobal"
				select="
					if (exists(/DTE/Documento/Encabezado/Totales/MntDcto)) then
						normalize-space(format-number(/DTE/Documento/Encabezado/Totales/MntDcto, '#0.00'))
					else
						'0.00'"/>
			<xsl:variable name="OtrosCargos"
				select="
					if (exists(/DTE/Documento/Encabezado/Totales/MntRcgo)) then
						normalize-space(format-number(/DTE/Documento/Encabezado/Totales/MntRcgo, '#0.00'))
					else
						'0.00'"/>
			<xsl:variable name="Redondeo"
				select="
				if (exists(/DTE/Documento/Encabezado/Totales/SaldoAnterior)) then
				normalize-space(format-number(/DTE/Documento/Encabezado/Totales/SaldoAnterior, '#0.00'))
				else
				'0.00'"/>
			<xsl:element name="cac:LegalMonetaryTotal">
				<xsl:if test="$HLEAmount != ''">
					<xsl:element name="cbc:LineExtensionAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="$HLEAmount"/>
					</xsl:element>
				</xsl:if>
				<xsl:if test="$TEAmount != ''">
					<xsl:element name="cbc:TaxExclusiveAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="$TEAmount"/>
					</xsl:element>
				</xsl:if>
				<xsl:if test="$TIAmount != '' and $TIAmount != 'NaN'">
					<xsl:element name="cbc:TaxInclusiveAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="$TIAmount"/>
					</xsl:element>
				</xsl:if>
				<!-- Global Discount -->
				<xsl:if test="$DescuentoGlobal != 'NaN' and number($DescuentoGlobal) != 0.00">
					<xsl:element name="cbc:AllowanceTotalAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="$DescuentoGlobal"/>
					</xsl:element>
				</xsl:if>
				<!--Other charges-->
				<xsl:if test="number($OtrosCargos) != 0.00 and $OtrosCargos != 'NaN'">
					<xsl:element name="cbc:ChargeTotalAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="$OtrosCargos"/>
					</xsl:element>
				</xsl:if>
				<xsl:if test="boolean(//Referencia[TpoDocRef = '01'][boolean(MontosRef/Monto)])">
					<xsl:element name="cbc:PrepaidAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of
							select="format-number(sum(//Referencia[TpoDocRef = '01'][boolean(MontosRef/Monto)]/MontosRef/Monto), '#0.00')"
						/>
					</xsl:element>
				</xsl:if>
				<!--Payable Rounding Amount of Invoice-->
				<xsl:if test="number($Redondeo) != 0.00 and $Redondeo != 'NaN'">
					<xsl:element name="cbc:PayableRoundingAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="$Redondeo"/>
					</xsl:element>
				</xsl:if>
				<!--Payable Amount of Invoice -->
				<xsl:element name="cbc:PayableAmount">
					<xsl:attribute name="currencyID">
						<xsl:value-of select="$MonedaC"/>
					</xsl:attribute>
					<xsl:value-of select="$PAmount"/>
				</xsl:element>
			</xsl:element>
			<!--DETAIL SECTION -->
			<xsl:for-each select="/DTE/Documento/Detalle">
				<xsl:element name="cac:InvoiceLine">
					<!--Invoice Line ID-->
					<xsl:element name="cbc:ID">
						<xsl:if test="(/DTE/Documento/Encabezado/IdDoc/TipoServicio = '11' or /DTE/Documento/Encabezado/IdDoc/TipoServicio = '12') and TpoListaItem!= ''">
							<xsl:attribute name="schemeID">
								<xsl:value-of select="TpoListaItem"/>
							</xsl:attribute>	
						</xsl:if>
						<xsl:value-of select="position()"/>
					</xsl:element>
						<xsl:if test="DscLang != ''">
						<xsl:element name="cbc:Note">
							<xsl:value-of select="DscLang"/>
						</xsl:element>
					</xsl:if>
					<xsl:element name="cbc:InvoicedQuantity">
						<!--Unit of Measure -->
						<xsl:attribute name="unitCode">
							<xsl:value-of select="UnmdItem"/>
						</xsl:attribute>
						<xsl:value-of select="format-number(QtyItem, '#0.000000')"/>
					</xsl:element>
					<xsl:variable name="LineExtentionAmount">
						<xsl:value-of select="format-number(MontoTotalItem, '#0.00')"/>
					</xsl:variable>
					<xsl:element name="cbc:LineExtensionAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="format-number($LineExtentionAmount, '#0.00')"/>
					</xsl:element>
					<xsl:element name="cbc:FreeOfChargeIndicator">
						<xsl:choose>
							<xsl:when test="MontoTotalItem > 0">
								<xsl:value-of select="false()"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="true()"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:element>
					<!--Referencias a nivel de detalle -->
					<xsl:for-each select="SubRef">
						<xsl:element name="cac:DocumentReference">
							<xsl:element name="cbc:ID">
								<xsl:value-of select="concat(SerieRef, NumeroRef)"/>
							</xsl:element>
							<xsl:if test="FechaRef">
								<xsl:element name="cbc:IssueDate">
									<xsl:value-of select="FechaRef"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cbc:DocumentTypeCode">
								<xsl:value-of select="TpoDocRef"/>
							</xsl:element>
							<xsl:variable name="TpoDocRefTxt">
								<xsl:call-template name="TipoDocRef">
									<xsl:with-param name="TpoDocRef">
										<xsl:value-of select="TpoDocRef"/>
									</xsl:with-param>
								</xsl:call-template>
							</xsl:variable>
							<xsl:choose>
								<xsl:when test="$TpoDocRefTxt != ''">
									<xsl:element name="cbc:DocumentType">
										<xsl:value-of select="$TpoDocRefTxt"/>
									</xsl:element>
								</xsl:when>
								<xsl:otherwise/>
							</xsl:choose>
						</xsl:element>
					</xsl:for-each>
					<!--Precio referencia en caso de ser Item gratuito -->
					<xsl:if test="MontoTotalItem = 0 and SubMonto[Tipo = 'FREE']/MontoConcepto">
						<xsl:element name="cac:PricingReference">
							<xsl:element name="cac:AlternativeConditionPrice">
								<xsl:element name="cbc:PriceAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of select="SubMonto[Tipo = 'FREE']/MontoConcepto"/>
								</xsl:element>
								<xsl:element name="cbc:PriceTypeCode">
									<xsl:value-of select="SubMonto[Tipo = 'FREE']/CodTipoMonto"/>
								</xsl:element>
								<xsl:element name="cbc:PriceType">
									<xsl:call-template name="CodigoPrecioRef">
										<xsl:with-param name="CodRef">
											<xsl:value-of
												select="SubMonto[Tipo = 'FREE']/CodTipoMonto"/>
										</xsl:with-param>
									</xsl:call-template>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:if>
					<!--Item' EAN lugar entrega-->
					<xsl:if test="LocalItem[TipoLoc = '01']/CodigoLoc != ''">
						<xsl:element name="cac:Delivery">
							<xsl:element name="cac:DeliveryLocation">
								<xsl:element name="cbc:ID">
									<xsl:attribute name="schemeID">
										<xsl:value-of select="'999'"/>
									</xsl:attribute>
									<xsl:attribute name="schemeName">
										<xsl:value-of select="'EAN'"/>
									</xsl:attribute>
									<xsl:value-of select="LocalItem[TipoLoc = '01']/CodigoLoc"/>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:if>
					<!--Item' discounts-->
					<xsl:for-each select="SubDscto">
						<xsl:element name="cac:AllowanceCharge">
							<xsl:element name="cbc:ID">
								<xsl:value-of select="position()"/>
							</xsl:element>
							<xsl:element name="cbc:ChargeIndicator">
								<xsl:value-of select="false()"/>
							</xsl:element>
							<xsl:if test="GlosaDscto">
								<xsl:element name="cbc:AllowanceChargeReason">
									<xsl:value-of select="GlosaDscto"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cbc:MultiplierFactorNumeric">
								<xsl:value-of select="format-number(PctDscto, '#0.00')"/>
							</xsl:element>
							<xsl:element name="cbc:Amount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number(MntDscto, '#0.00')"/>
							</xsl:element>
							<xsl:element name="cbc:BaseAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of
									select="format-number((../PrcBrutoItem * ../QtyItem), '#0.00')"
								/>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
					<!--Item' charges-->
					<xsl:for-each select="SubRecargo">
						<xsl:element name="cac:AllowanceCharge">
							<xsl:element name="cbc:ID">
								<xsl:value-of select="position()"/>
							</xsl:element>
							<xsl:element name="cbc:ChargeIndicator">
								<xsl:value-of select="true()"/>
							</xsl:element>
							<xsl:if test="GlosaRecargo">
								<xsl:element name="cbc:AllowanceChargeReason">
									<xsl:value-of select="GlosaRecargo"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cbc:MultiplierFactorNumeric">
								<xsl:value-of select="format-number(PctRecargo, '#0.00')"/>
							</xsl:element>
							<xsl:element name="cbc:Amount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number(MntRecargo, '#0.00')"/>
							</xsl:element>
							<xsl:element name="cbc:BaseAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of
									select="format-number((../PrcBrutoItem * ../QtyItem), '#0.00')"
								/>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
					<!--Item' taxes-->
					<xsl:variable name="SumImpDet01">
						<xsl:value-of select="sum(ImpuestosDet[TipoImp = '01']/MontoImp)"/>
					</xsl:variable>
					<xsl:variable name="SumBaseImpDet01">
						<xsl:value-of select="(sum((ImpuestosDet[TipoImp = '01'][1]/MontoBaseImp[1]*((ImpuestosDet[TipoImp = '01'][1]/TasaImp[1]) div 100))-ImpuestosDet[TipoImp = '01'][1]/MontoImp[1])) + sum((ImpuestosDet[TipoImp = '01'][2]/MontoBaseImp[2]*((ImpuestosDet[TipoImp = '01'][2]/TasaImp[2]) div 100))-ImpuestosDet[TipoImp = '01'][2]/MontoImp[2]) + sum((ImpuestosDet[TipoImp = '01'][3]/MontoBaseImp[3]*((ImpuestosDet[TipoImp = '01'][3]/TasaImp[3]) div 100))-ImpuestosDet[TipoImp = '01'][3]/MontoImp[3])"/>
					</xsl:variable>
					<xsl:variable name="SumImpDet02">
						<xsl:value-of select="sum(ImpuestosDet[TipoImp = '02']/MontoImp)"/>
					</xsl:variable>
					<xsl:variable name="SumBaseImpDet02">
						<xsl:value-of select="(sum((ImpuestosDet[TipoImp = '02'][1]/MontoBaseImp[1]*((ImpuestosDet[TipoImp = '02'][1]/TasaImp[1]) div 100))-ImpuestosDet[TipoImp = '02'][1]/MontoImp[1])) + sum((ImpuestosDet[TipoImp = '02'][2]/MontoBaseImp[2]*((ImpuestosDet[TipoImp = '02'][2]/TasaImp[2]) div 100))-ImpuestosDet[TipoImp = '02'][2]/MontoImp[2]) + sum((ImpuestosDet[TipoImp = '02'][3]/MontoBaseImp[3]*((ImpuestosDet[TipoImp = '02'][3]/TasaImp[3]) div 100))-ImpuestosDet[TipoImp = '02'][3]/MontoImp[3])"/>
					</xsl:variable>
					<xsl:variable name="SumImpDet03">
						<xsl:value-of select="sum(ImpuestosDet[TipoImp = '03']/MontoImp)"/>
					</xsl:variable>
					<xsl:variable name="SumBaseImpDet03">
						<xsl:value-of select="(sum((ImpuestosDet[TipoImp = '03'][1]/MontoBaseImp[1]*((ImpuestosDet[TipoImp = '03'][1]/TasaImp[1]) div 100))-ImpuestosDet[TipoImp = '03'][1]/MontoImp[1])) + sum((ImpuestosDet[TipoImp = '03'][2]/MontoBaseImp[2]*((ImpuestosDet[TipoImp = '03'][2]/TasaImp[2]) div 100))-ImpuestosDet[TipoImp = '03'][2]/MontoImp[2]) + sum((ImpuestosDet[TipoImp = '03'][3]/MontoBaseImp[3]*((ImpuestosDet[TipoImp = '03'][3]/TasaImp[3]) div 100))-ImpuestosDet[TipoImp = '03'][3]/MontoImp[3])"/>
					</xsl:variable>
					<xsl:variable name="SumImpDet04">
						<xsl:value-of select="sum(ImpuestosDet[TipoImp = '04']/MontoImp)"/>
					</xsl:variable>
					<xsl:variable name="SumBaseImpDet04">
						<xsl:value-of select="(sum((ImpuestosDet[TipoImp = '04'][1]/MontoBaseImp[1]*((ImpuestosDet[TipoImp = '04'][1]/TasaImp[1]) div 100))-ImpuestosDet[TipoImp = '04'][1]/MontoImp[1])) + sum((ImpuestosDet[TipoImp = '04'][2]/MontoBaseImp[2]*((ImpuestosDet[TipoImp = '04'][2]/TasaImp[2]) div 100))-ImpuestosDet[TipoImp = '04'][2]/MontoImp[2]) + sum((ImpuestosDet[TipoImp = '04'][3]/MontoBaseImp[3]*((ImpuestosDet[TipoImp = '04'][3]/TasaImp[3]) div 100))-ImpuestosDet[TipoImp = '04'][3]/MontoImp[3])"/>
					</xsl:variable>
					<xsl:variable name="SumImpDet20">
						<xsl:value-of select="sum(ImpuestosDet[TipoImp = '20']/MontoImp)"/>
					</xsl:variable>
					<xsl:variable name="SumImpDet21">
						<xsl:value-of select="sum(ImpuestosDet[TipoImp = '21']/MontoImp)"/>
					</xsl:variable>
					<xsl:variable name="SumImpDet22">
						<xsl:value-of select="sum(ImpuestosDet[TipoImp = '22']/MontoImp)"/>
					</xsl:variable>
					<xsl:variable name="SumImpDet23">
						<xsl:value-of select="sum(ImpuestosDet[TipoImp = '23']/MontoImp)"/>
					</xsl:variable>
					<xsl:variable name="SumImpDet24">
						<xsl:value-of select="sum(ImpuestosDet[TipoImp = '24']/MontoImp)"/>
					</xsl:variable>
					<xsl:variable name="SumImpDet25">
						<xsl:value-of select="sum(ImpuestosDet[TipoImp = '25']/MontoImp)"/>
					</xsl:variable>
					<xsl:variable name="SumImpDet26">
						<xsl:value-of select="sum(ImpuestosDet[TipoImp = '26']/MontoImp)"/>
					</xsl:variable>
					<xsl:for-each select="ImpuestosDet[TipoImp = '01'][1]">
						<xsl:element name="cac:TaxTotal">
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number($SumImpDet01, '#0.00')"/>
							</xsl:element>
							<xsl:element name="cbc:RoundingAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number($SumBaseImpDet01, '#0.00')"/>
							</xsl:element>
							<xsl:for-each select="../ImpuestosDet[TipoImp = '01']">
								<xsl:element name="cac:TaxSubtotal">
									<xsl:if test="not(PrecioPorUnidad)">
										<xsl:element name="cbc:TaxableAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of
												select="normalize-space(format-number(MontoBaseImp, '#0.00'))"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cbc:TaxAmount">
										<xsl:attribute name="currencyID">
											<xsl:value-of select="$MonedaC"/>
										</xsl:attribute>
										<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
									</xsl:element>
									<xsl:if test="UnidadMedida">
										<xsl:element name="cbc:BaseUnitMeasure">
											<xsl:attribute name="unitCode">
												<xsl:value-of select="UnidadMedida"/>
											</xsl:attribute>
											<xsl:value-of select="'1.000000'"/>
										</xsl:element>
									</xsl:if>
									<xsl:if test="PrecioPorUnidad">
										<xsl:element name="cbc:PerUnitAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cac:TaxCategory">
										<xsl:if test="not(PrecioPorUnidad)">
											<xsl:choose>
												<xsl:when test="TipoImp = '03'">
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
													</xsl:element>
												</xsl:when>
												<xsl:otherwise>
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
													</xsl:element>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:element name="cac:TaxScheme">
											<xsl:element name="cbc:ID">
												<xsl:value-of select="TipoImp"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:call-template name="TipoImpuesto">
													<xsl:with-param name="TpoImp">
														<xsl:value-of select="TipoImp"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:for-each>
						</xsl:element>
					</xsl:for-each>
					<xsl:for-each select="ImpuestosDet[TipoImp = '02'][1]">
						<xsl:element name="cac:TaxTotal">
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:if test="TipoImp = '02'">
									<xsl:value-of select="format-number($SumImpDet02, '#0.00')"/>
								</xsl:if>
							</xsl:element>
							<xsl:element name="cbc:RoundingAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number($SumBaseImpDet02, '#0.00')"/>
							</xsl:element>
							<xsl:for-each select="../ImpuestosDet[TipoImp = '02']">
								<xsl:element name="cac:TaxSubtotal">
									<xsl:if test="not(PrecioPorUnidad)">
										<xsl:element name="cbc:TaxableAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of
												select="normalize-space(format-number(MontoBaseImp, '#0.00'))"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cbc:TaxAmount">
										<xsl:attribute name="currencyID">
											<xsl:value-of select="$MonedaC"/>
										</xsl:attribute>
										<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
									</xsl:element>
									<xsl:if test="UnidadMedida">
										<xsl:element name="cbc:BaseUnitMeasure">
											<xsl:attribute name="unitCode">
												<xsl:value-of select="UnidadMedida"/>
											</xsl:attribute>
											<xsl:value-of select="'1.000000'"/>
										</xsl:element>
									</xsl:if>
									<xsl:if test="PrecioPorUnidad">
										<xsl:element name="cbc:PerUnitAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cac:TaxCategory">
										<xsl:if test="not(PrecioPorUnidad)">
											<xsl:choose>
												<xsl:when test="TipoImp = '03'">
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
													</xsl:element>
												</xsl:when>
												<xsl:otherwise>
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
													</xsl:element>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:element name="cac:TaxScheme">
											<xsl:element name="cbc:ID">
												<xsl:value-of select="TipoImp"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:call-template name="TipoImpuesto">
													<xsl:with-param name="TpoImp">
														<xsl:value-of select="TipoImp"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:for-each>
						</xsl:element>
					</xsl:for-each>
					<xsl:for-each select="ImpuestosDet[TipoImp = '03'][1]">
						<xsl:element name="cac:TaxTotal">
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:if test="TipoImp = '03'">
									<xsl:value-of select="format-number($SumImpDet03, '#0.00')"/>
								</xsl:if>
							</xsl:element>
							<xsl:element name="cbc:RoundingAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number($SumBaseImpDet03, '#0.00')"/>
							</xsl:element>
							<xsl:for-each select="../ImpuestosDet[TipoImp = '03']">
								<xsl:element name="cac:TaxSubtotal">
									<xsl:if test="not(PrecioPorUnidad)">
										<xsl:element name="cbc:TaxableAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of
												select="normalize-space(format-number(MontoBaseImp, '#0.00'))"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cbc:TaxAmount">
										<xsl:attribute name="currencyID">
											<xsl:value-of select="$MonedaC"/>
										</xsl:attribute>
										<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
									</xsl:element>
									<xsl:if test="UnidadMedida">
										<xsl:element name="cbc:BaseUnitMeasure">
											<xsl:attribute name="unitCode">
												<xsl:value-of select="UnidadMedida"/>
											</xsl:attribute>
											<xsl:value-of select="'1.000000'"/>
										</xsl:element>
									</xsl:if>
									<xsl:if test="PrecioPorUnidad">
										<xsl:element name="cbc:PerUnitAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cac:TaxCategory">
										<xsl:if test="not(PrecioPorUnidad)">
											<xsl:choose>
												<xsl:when test="TipoImp = '03'">
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
													</xsl:element>
												</xsl:when>
												<xsl:otherwise>
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
													</xsl:element>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:element name="cac:TaxScheme">
											<xsl:element name="cbc:ID">
												<xsl:value-of select="TipoImp"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:call-template name="TipoImpuesto">
													<xsl:with-param name="TpoImp">
														<xsl:value-of select="TipoImp"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:for-each>
						</xsl:element>
					</xsl:for-each>
					<xsl:for-each select="ImpuestosDet[TipoImp = '04'][1]">
						<xsl:element name="cac:TaxTotal">
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:if test="TipoImp = '04'">
									<xsl:value-of select="format-number($SumImpDet04, '#0.00')"/>
								</xsl:if>
							</xsl:element>
							<xsl:element name="cbc:RoundingAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number($SumBaseImpDet04, '#0.00')"/>
							</xsl:element>
							<xsl:for-each select="../ImpuestosDet[TipoImp = '04']">
								<xsl:element name="cac:TaxSubtotal">
									<xsl:if test="not(PrecioPorUnidad)">
										<xsl:element name="cbc:TaxableAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of
												select="normalize-space(format-number(MontoBaseImp, '#0.00'))"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cbc:TaxAmount">
										<xsl:attribute name="currencyID">
											<xsl:value-of select="$MonedaC"/>
										</xsl:attribute>
										<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
									</xsl:element>
									<xsl:if test="UnidadMedida">
										<xsl:element name="cbc:BaseUnitMeasure">
											<xsl:attribute name="unitCode">
												<xsl:value-of select="UnidadMedida"/>
											</xsl:attribute>
											<xsl:value-of select="'1.000000'"/>
										</xsl:element>
									</xsl:if>
									<xsl:if test="PrecioPorUnidad">
										<xsl:element name="cbc:PerUnitAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cac:TaxCategory">
										<xsl:if test="not(PrecioPorUnidad)">
											<xsl:choose>
												<xsl:when test="TipoImp = '03'">
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
													</xsl:element>
												</xsl:when>
												<xsl:otherwise>
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
													</xsl:element>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:element name="cac:TaxScheme">
											<xsl:element name="cbc:ID">
												<xsl:value-of select="TipoImp"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:call-template name="TipoImpuesto">
													<xsl:with-param name="TpoImp">
														<xsl:value-of select="TipoImp"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:for-each>
						</xsl:element>
					</xsl:for-each>
					<xsl:for-each select="ImpuestosDet[TipoImp = '20'][1]">
						<xsl:element name="cac:TaxTotal">
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:if test="TipoImp = '20'">
									<xsl:value-of select="format-number($SumImpDet20, '#0.00')"/>
								</xsl:if>
							</xsl:element>
							<xsl:for-each select="../ImpuestosDet[TipoImp = '20']">
								<xsl:element name="cac:TaxSubtotal">
									<xsl:if test="not(PrecioPorUnidad)">
										<xsl:element name="cbc:TaxableAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of
												select="normalize-space(format-number(MontoBaseImp, '#0.00'))"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cbc:TaxAmount">
										<xsl:attribute name="currencyID">
											<xsl:value-of select="$MonedaC"/>
										</xsl:attribute>
										<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
									</xsl:element>
									<xsl:if test="UnidadMedida">
										<xsl:element name="cbc:BaseUnitMeasure">
											<xsl:attribute name="unitCode">
												<xsl:value-of select="UnidadMedida"/>
											</xsl:attribute>
											<xsl:value-of select="'1.000000'"/>
										</xsl:element>
									</xsl:if>
									<xsl:if test="PrecioPorUnidad">
										<xsl:element name="cbc:PerUnitAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cac:TaxCategory">
										<xsl:if test="not(PrecioPorUnidad)">
											<xsl:choose>
												<xsl:when test="TipoImp = '03'">
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
													</xsl:element>
												</xsl:when>
												<xsl:otherwise>
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
													</xsl:element>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:element name="cac:TaxScheme">
											<xsl:element name="cbc:ID">
												<xsl:value-of select="TipoImp"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:call-template name="TipoImpuesto">
													<xsl:with-param name="TpoImp">
														<xsl:value-of select="TipoImp"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:for-each>
						</xsl:element>
					</xsl:for-each>
					<xsl:for-each select="ImpuestosDet[TipoImp = '21'][1]">
						<xsl:element name="cac:TaxTotal">
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:if test="TipoImp = '21'">
									<xsl:value-of select="format-number($SumImpDet21, '#0.00')"/>
								</xsl:if>
							</xsl:element>
							<xsl:for-each select="../ImpuestosDet[TipoImp = '21']">
								<xsl:element name="cac:TaxSubtotal">
									<xsl:if test="not(PrecioPorUnidad)">
										<xsl:element name="cbc:TaxableAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of
												select="normalize-space(format-number(MontoBaseImp, '#0.00'))"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cbc:TaxAmount">
										<xsl:attribute name="currencyID">
											<xsl:value-of select="$MonedaC"/>
										</xsl:attribute>
										<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
									</xsl:element>
									<xsl:if test="UnidadMedida">
										<xsl:element name="cbc:BaseUnitMeasure">
											<xsl:attribute name="unitCode">
												<xsl:value-of select="UnidadMedida"/>
											</xsl:attribute>
											<xsl:value-of select="'1.000000'"/>
										</xsl:element>
									</xsl:if>
									<xsl:if test="PrecioPorUnidad">
										<xsl:element name="cbc:PerUnitAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cac:TaxCategory">
										<xsl:if test="not(PrecioPorUnidad)">
											<xsl:choose>
												<xsl:when test="TipoImp = '03'">
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
													</xsl:element>
												</xsl:when>
												<xsl:otherwise>
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
													</xsl:element>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:element name="cac:TaxScheme">
											<xsl:element name="cbc:ID">
												<xsl:value-of select="TipoImp"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:call-template name="TipoImpuesto">
													<xsl:with-param name="TpoImp">
														<xsl:value-of select="TipoImp"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:for-each>
						</xsl:element>
					</xsl:for-each>
					<xsl:for-each select="ImpuestosDet[TipoImp = '22'][1]">
						<xsl:element name="cac:TaxTotal">
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:if test="TipoImp = '22'">
									<xsl:value-of select="format-number($SumImpDet22, '#0.00')"/>
								</xsl:if>
							</xsl:element>
							<xsl:for-each select="../ImpuestosDet[TipoImp = '22']">
								<xsl:element name="cac:TaxSubtotal">
									<xsl:if test="not(PrecioPorUnidad)">
										<xsl:element name="cbc:TaxableAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of
												select="normalize-space(format-number(MontoBaseImp, '#0.00'))"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cbc:TaxAmount">
										<xsl:attribute name="currencyID">
											<xsl:value-of select="$MonedaC"/>
										</xsl:attribute>
										<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
									</xsl:element>
									<xsl:if test="UnidadMedida">
										<xsl:element name="cbc:BaseUnitMeasure">
											<xsl:attribute name="unitCode">
												<xsl:value-of select="UnidadMedida"/>
											</xsl:attribute>
											<xsl:value-of select="'1.000000'"/>
										</xsl:element>
									</xsl:if>
									<xsl:if test="PrecioPorUnidad">
										<xsl:element name="cbc:PerUnitAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cac:TaxCategory">
										<xsl:if test="not(PrecioPorUnidad)">
											<xsl:choose>
												<xsl:when test="TipoImp = '03'">
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
													</xsl:element>
												</xsl:when>
												<xsl:otherwise>
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
													</xsl:element>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:element name="cac:TaxScheme">
											<xsl:element name="cbc:ID">
												<xsl:value-of select="TipoImp"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:call-template name="TipoImpuesto">
													<xsl:with-param name="TpoImp">
														<xsl:value-of select="TipoImp"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:for-each>
						</xsl:element>
					</xsl:for-each>
					<xsl:for-each select="ImpuestosDet[TipoImp = '23'][1]">
						<xsl:element name="cac:TaxTotal">
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:if test="TipoImp = '23'">
									<xsl:value-of select="format-number($SumImpDet23, '#0.00')"/>
								</xsl:if>
							</xsl:element>
							<xsl:for-each select="../ImpuestosDet[TipoImp = '23']">
								<xsl:element name="cac:TaxSubtotal">
									<xsl:if test="not(PrecioPorUnidad)">
										<xsl:element name="cbc:TaxableAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of
												select="normalize-space(format-number(MontoBaseImp, '#0.00'))"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cbc:TaxAmount">
										<xsl:attribute name="currencyID">
											<xsl:value-of select="$MonedaC"/>
										</xsl:attribute>
										<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
									</xsl:element>
									<xsl:if test="UnidadMedida">
										<xsl:element name="cbc:BaseUnitMeasure">
											<xsl:attribute name="unitCode">
												<xsl:value-of select="UnidadMedida"/>
											</xsl:attribute>
											<xsl:value-of select="'1.000000'"/>
										</xsl:element>
									</xsl:if>
									<xsl:if test="PrecioPorUnidad">
										<xsl:element name="cbc:PerUnitAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cac:TaxCategory">
										<xsl:if test="not(PrecioPorUnidad)">
											<xsl:choose>
												<xsl:when test="TipoImp = '03'">
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
													</xsl:element>
												</xsl:when>
												<xsl:otherwise>
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
													</xsl:element>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:element name="cac:TaxScheme">
											<xsl:element name="cbc:ID">
												<xsl:value-of select="TipoImp"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:call-template name="TipoImpuesto">
													<xsl:with-param name="TpoImp">
														<xsl:value-of select="TipoImp"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:for-each>
						</xsl:element>
					</xsl:for-each>
					<xsl:for-each select="ImpuestosDet[TipoImp = '24'][1]">
						<xsl:element name="cac:TaxTotal">
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:if test="TipoImp = '24'">
									<xsl:value-of select="format-number($SumImpDet24, '#0.00')"/>
								</xsl:if>
							</xsl:element>
							<xsl:for-each select="../ImpuestosDet[TipoImp = '24']">
								<xsl:element name="cac:TaxSubtotal">
									<xsl:if test="not(PrecioPorUnidad)">
										<xsl:element name="cbc:TaxableAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of
												select="normalize-space(format-number(MontoBaseImp, '#0.00'))"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cbc:TaxAmount">
										<xsl:attribute name="currencyID">
											<xsl:value-of select="$MonedaC"/>
										</xsl:attribute>
										<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
									</xsl:element>
									<xsl:if test="UnidadMedida">
										<xsl:element name="cbc:BaseUnitMeasure">
											<xsl:attribute name="unitCode">
												<xsl:value-of select="UnidadMedida"/>
											</xsl:attribute>
											<xsl:value-of select="'1.000000'"/>
										</xsl:element>
									</xsl:if>
									<xsl:if test="PrecioPorUnidad">
										<xsl:element name="cbc:PerUnitAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cac:TaxCategory">
										<xsl:if test="not(PrecioPorUnidad)">
											<xsl:choose>
												<xsl:when test="TipoImp = '03'">
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
													</xsl:element>
												</xsl:when>
												<xsl:otherwise>
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
													</xsl:element>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:element name="cac:TaxScheme">
											<xsl:element name="cbc:ID">
												<xsl:value-of select="TipoImp"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:call-template name="TipoImpuesto">
													<xsl:with-param name="TpoImp">
														<xsl:value-of select="TipoImp"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:for-each>
						</xsl:element>
					</xsl:for-each>
					<xsl:for-each select="ImpuestosDet[TipoImp = '25'][1]">
						<xsl:element name="cac:TaxTotal">
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:if test="TipoImp = '25'">
									<xsl:value-of select="format-number($SumImpDet25, '#0.00')"/>
								</xsl:if>
							</xsl:element>
							<xsl:for-each select="../ImpuestosDet[TipoImp = '25']">
								<xsl:element name="cac:TaxSubtotal">
									<xsl:if test="not(PrecioPorUnidad)">
										<xsl:element name="cbc:TaxableAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of
												select="normalize-space(format-number(MontoBaseImp, '#0.00'))"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cbc:TaxAmount">
										<xsl:attribute name="currencyID">
											<xsl:value-of select="$MonedaC"/>
										</xsl:attribute>
										<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
									</xsl:element>
									<xsl:if test="UnidadMedida">
										<xsl:element name="cbc:BaseUnitMeasure">
											<xsl:attribute name="unitCode">
												<xsl:value-of select="UnidadMedida"/>
											</xsl:attribute>
											<xsl:value-of select="'1.000000'"/>
										</xsl:element>
									</xsl:if>
									<xsl:if test="PrecioPorUnidad">
										<xsl:element name="cbc:PerUnitAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cac:TaxCategory">
										<xsl:if test="not(PrecioPorUnidad)">
											<xsl:choose>
												<xsl:when test="TipoImp = '03'">
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
													</xsl:element>
												</xsl:when>
												<xsl:otherwise>
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
													</xsl:element>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:element name="cac:TaxScheme">
											<xsl:element name="cbc:ID">
												<xsl:value-of select="TipoImp"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:call-template name="TipoImpuesto">
													<xsl:with-param name="TpoImp">
														<xsl:value-of select="TipoImp"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:for-each>
						</xsl:element>
					</xsl:for-each>
					<xsl:for-each select="ImpuestosDet[TipoImp = '26'][1]">
						<xsl:element name="cac:TaxTotal">
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:if test="TipoImp = '26'">
									<xsl:value-of select="format-number($SumImpDet26, '#0.00')"/>
								</xsl:if>
							</xsl:element>
							<xsl:for-each select="../ImpuestosDet[TipoImp = '26']">
								<xsl:element name="cac:TaxSubtotal">
									<xsl:if test="not(PrecioPorUnidad)">
										<xsl:element name="cbc:TaxableAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of
												select="normalize-space(format-number(MontoBaseImp, '#0.00'))"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cbc:TaxAmount">
										<xsl:attribute name="currencyID">
											<xsl:value-of select="$MonedaC"/>
										</xsl:attribute>
										<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
									</xsl:element>
									<xsl:if test="UnidadMedida">
										<xsl:element name="cbc:BaseUnitMeasure">
											<xsl:attribute name="unitCode">
												<xsl:value-of select="UnidadMedida"/>
											</xsl:attribute>
											<xsl:value-of select="'1.000000'"/>
										</xsl:element>
									</xsl:if>
									<xsl:if test="PrecioPorUnidad">
										<xsl:element name="cbc:PerUnitAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cac:TaxCategory">
										<xsl:if test="not(PrecioPorUnidad)">
											<xsl:choose>
												<xsl:when test="TipoImp = '03'">
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
													</xsl:element>
												</xsl:when>
												<xsl:otherwise>
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
													</xsl:element>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:element name="cac:TaxScheme">
											<xsl:element name="cbc:ID">
												<xsl:value-of select="TipoImp"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:call-template name="TipoImpuesto">
													<xsl:with-param name="TpoImp">
														<xsl:value-of select="TipoImp"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:for-each>
						</xsl:element>
					</xsl:for-each>
					<!--<xsl:for-each select="ImpuestosDet">
						<xsl:element name="cac:TaxTotal">
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of
									select="normalize-space(format-number(MontoImp, '#0.00'))"/>
							</xsl:element>
							<xsl:element name="cac:TaxSubtotal">
								<xsl:if test="not(PrecioPorUnidad)">
									<xsl:element name="cbc:TaxableAmount">
										<xsl:attribute name="currencyID">
											<xsl:value-of select="$MonedaC"/>
										</xsl:attribute>
										<xsl:value-of
											select="normalize-space(format-number(MontoBaseImp, '#0.00'))"
										/>
									</xsl:element>
								</xsl:if>
								<xsl:element name="cbc:TaxAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of
										select="normalize-space(format-number(MontoImp, '#0.00'))"/>
								</xsl:element>
								<xsl:if test="UnidadMedida">
									<xsl:element name="cbc:BaseUnitMeasure">
										<xsl:attribute name="unitCode">
											<xsl:value-of select="UnidadMedida"/>
										</xsl:attribute>
										<xsl:value-of select="'1.000000'"/>
									</xsl:element>
								</xsl:if>
								<xsl:if test="PrecioPorUnidad">
									<xsl:element name="cbc:PerUnitAmount">
										<xsl:attribute name="currencyID">
											<xsl:value-of select="$MonedaC"/>
										</xsl:attribute>
										<xsl:value-of
											select="format-number(PrecioPorUnidad, '#0.00')"/>
									</xsl:element>
								</xsl:if>
								<xsl:element name="cac:TaxCategory">
									<xsl:if test="not(PrecioPorUnidad)">
										<xsl:choose>
											<xsl:when test="TipoImp = '03'">
												<xsl:element name="cbc:Percent">
													<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
												</xsl:element>
											</xsl:when>
											<xsl:otherwise>
												<xsl:element name="cbc:Percent">
													<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
												</xsl:element>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:if>
									<xsl:element name="cac:TaxScheme">
										<xsl:element name="cbc:ID">
											<xsl:value-of select="TipoImp"/>
										</xsl:element>
										<xsl:element name="cbc:Name">
											<xsl:call-template name="TipoImpuesto">
												<xsl:with-param name="TpoImp">
												<xsl:value-of select="TipoImp"/>
												</xsl:with-param>
											</xsl:call-template>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>-->
					<!--Item' Withholdings-->
					<xsl:variable name="SumRetDet05">
						<xsl:value-of select="sum(RetencionesDet[TipoRet = '05']/MontoRet)"/>
					</xsl:variable>
					<xsl:variable name="SumRetDet06">
						<xsl:value-of select="sum(RetencionesDet[TipoRet = '06']/MontoRet)"/>
					</xsl:variable>
					<xsl:variable name="SumRetDet07">
						<xsl:value-of select="sum(RetencionesDet[TipoRet = '07']/MontoRet)"/>
					</xsl:variable>
					<xsl:variable name="SumRetDet08">
						<xsl:value-of select="sum(RetencionesDet[TipoRet = '08']/MontoRet)"/>
					</xsl:variable>
					<xsl:for-each select="RetencionesDet[TipoRet = '05'][1]">
						<xsl:element name="cac:WithholdingTaxTotal">
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number($SumRetDet05, '#0.00')"/>
							</xsl:element>
							<xsl:for-each select="../RetencionesDet[TipoRet = '05']">
								<xsl:element name="cac:TaxSubtotal">
									<xsl:element name="cbc:TaxableAmount">
										<xsl:attribute name="currencyID">
											<xsl:value-of select="$MonedaC"/>
										</xsl:attribute>
										<xsl:value-of
											select="normalize-space(format-number(MontoBaseRet, '#0.00'))"/>
									</xsl:element>
									<xsl:element name="cbc:TaxAmount">
										<xsl:attribute name="currencyID">
											<xsl:value-of select="$MonedaC"/>
										</xsl:attribute>
										<xsl:value-of select="format-number(MontoRet, '#0.00')"/>
									</xsl:element>
									<xsl:element name="cac:TaxCategory">
										<xsl:element name="cbc:Percent">
											<xsl:value-of select="format-number(TasaRet, '#0.000')"/>
										</xsl:element>
										<xsl:element name="cac:TaxScheme">
											<xsl:element name="cbc:ID">
												<xsl:value-of select="TipoRet"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:call-template name="TipoImpuesto">
													<xsl:with-param name="TpoImp">
														<xsl:value-of select="TipoRet"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:for-each>
						</xsl:element>
					</xsl:for-each>
					<xsl:for-each select="RetencionesDet[TipoRet = '06'][1]">
						<xsl:element name="cac:WithholdingTaxTotal">
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number($SumRetDet06, '#0.00')"/>
							</xsl:element>
							<xsl:for-each select="../RetencionesDet[TipoRet = '06']">
								<xsl:element name="cac:TaxSubtotal">
									<xsl:element name="cbc:TaxableAmount">
										<xsl:attribute name="currencyID">
											<xsl:value-of select="$MonedaC"/>
										</xsl:attribute>
										<xsl:value-of
											select="normalize-space(format-number(MontoBaseRet, '#0.00'))"/>
									</xsl:element>
									<xsl:element name="cbc:TaxAmount">
										<xsl:attribute name="currencyID">
											<xsl:value-of select="$MonedaC"/>
										</xsl:attribute>
										<xsl:value-of select="format-number(MontoRet, '#0.00')"/>
									</xsl:element>
									<xsl:element name="cac:TaxCategory">
										<xsl:element name="cbc:Percent">
											<xsl:value-of select="format-number(TasaRet, '#0.000')"/>
										</xsl:element>
										<xsl:element name="cac:TaxScheme">
											<xsl:element name="cbc:ID">
												<xsl:value-of select="TipoRet"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:call-template name="TipoImpuesto">
													<xsl:with-param name="TpoImp">
														<xsl:value-of select="TipoRet"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:for-each>
						</xsl:element>
					</xsl:for-each>
					<xsl:for-each select="RetencionesDet[TipoRet = '07'][1]">
						<xsl:element name="cac:WithholdingTaxTotal">
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number($SumRetDet07, '#0.00')"/>
							</xsl:element>
							<xsl:for-each select="../RetencionesDet[TipoRet = '07']">
								<xsl:element name="cac:TaxSubtotal">
									<xsl:element name="cbc:TaxableAmount">
										<xsl:attribute name="currencyID">
											<xsl:value-of select="$MonedaC"/>
										</xsl:attribute>
										<xsl:value-of
											select="normalize-space(format-number(MontoBaseRet, '#0.00'))"/>
									</xsl:element>
									<xsl:element name="cbc:TaxAmount">
										<xsl:attribute name="currencyID">
											<xsl:value-of select="$MonedaC"/>
										</xsl:attribute>
										<xsl:value-of select="format-number(MontoRet, '#0.00')"/>
									</xsl:element>
									<xsl:element name="cac:TaxCategory">
										<xsl:element name="cbc:Percent">
											<xsl:value-of select="format-number(TasaRet, '#0.000')"/>
										</xsl:element>
										<xsl:element name="cac:TaxScheme">
											<xsl:element name="cbc:ID">
												<xsl:value-of select="TipoRet"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:call-template name="TipoImpuesto">
													<xsl:with-param name="TpoImp">
														<xsl:value-of select="TipoRet"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:for-each>
						</xsl:element>
					</xsl:for-each>
					<xsl:for-each select="RetencionesDet[TipoRet = '08'][1]">
						<xsl:element name="cac:WithholdingTaxTotal">
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number($SumRetDet08, '#0.00')"/>
							</xsl:element>
							<xsl:for-each select="../RetencionesDet[TipoRet = '08']">
								<xsl:element name="cac:TaxSubtotal">
									<xsl:element name="cbc:TaxableAmount">
										<xsl:attribute name="currencyID">
											<xsl:value-of select="$MonedaC"/>
										</xsl:attribute>
										<xsl:value-of
											select="normalize-space(format-number(MontoBaseRet, '#0.00'))"/>
									</xsl:element>
									<xsl:element name="cbc:TaxAmount">
										<xsl:attribute name="currencyID">
											<xsl:value-of select="$MonedaC"/>
										</xsl:attribute>
										<xsl:value-of select="format-number(MontoRet, '#0.00')"/>
									</xsl:element>
									<xsl:element name="cac:TaxCategory">
										<xsl:element name="cbc:Percent">
											<xsl:value-of select="format-number(TasaRet, '#0.000')"/>
										</xsl:element>
										<xsl:element name="cac:TaxScheme">
											<xsl:element name="cbc:ID">
												<xsl:value-of select="TipoRet"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:call-template name="TipoImpuesto">
													<xsl:with-param name="TpoImp">
														<xsl:value-of select="TipoRet"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:for-each>
						</xsl:element>
					</xsl:for-each>
					<!--<xsl:for-each select="RetencionesDet">
						<xsl:element name="cac:WithholdingTaxTotal">
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of
									select="normalize-space(format-number(MontoRet, '#0.00'))"/>
							</xsl:element>
							<xsl:element name="cac:TaxSubtotal">
								<xsl:element name="cbc:TaxableAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of
										select="normalize-space(format-number($LineExtentionAmount, '#0.00'))"
									/>
								</xsl:element>
								<xsl:element name="cbc:TaxAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of
										select="normalize-space(format-number(MontoRet, '#0.00'))"/>
								</xsl:element>
								<xsl:element name="cac:TaxCategory">
									<xsl:element name="cbc:Percent">
										<xsl:value-of select="format-number(TasaRet, '#0.00')"/>
									</xsl:element>
									<xsl:element name="cac:TaxScheme">
										<xsl:element name="cbc:ID">
											<xsl:value-of select="TipoRet"/>
										</xsl:element>
										<xsl:element name="cbc:Name">
											<xsl:call-template name="TipoImpuesto">
												<xsl:with-param name="TpoImp">
												<xsl:value-of select="TipoRet"/>
												</xsl:with-param>
											</xsl:call-template>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>-->
					<xsl:element name="cac:Item">
						<!--Description of the item-->
						<xsl:element name="cbc:Description">
							<xsl:value-of select="DscItem"/>
						</xsl:element>
						<!-- Modelo y Marca del producto de exportacion -->
						<xsl:if test="//IdDoc/Tipo = '02'">
							<xsl:element name="cbc:BrandName">
								<xsl:value-of select="ServicioItem[Tipo = 'Exportacion']/Numero"/>
							</xsl:element>
							<xsl:element name="cbc:ModelName">
								<xsl:value-of select="ServicioItem[Tipo = 'Exportacion']/NroExp"/>
							</xsl:element>
						</xsl:if>
						<xsl:if test="CdgItem[TpoCodigo = 'INT']/VlrCodigo != ''">
							<xsl:element name="cac:SellersItemIdentification">
								<xsl:element name="cbc:ID">
									<xsl:value-of select="CdgItem[TpoCodigo = 'INT']/VlrCodigo"/>
								</xsl:element>
							</xsl:element>
						</xsl:if>				
						<xsl:choose>
							<xsl:when test="CdgItem[1]/TpoCodigo != '' and CdgItem[2]/TpoCodigo != ''">
								<xsl:if test="CdgItem[TpoCodigo = '001']/VlrCodigo != ''">
									<xsl:element name="cac:StandardItemIdentification">
										<xsl:element name="cbc:ID">
											<xsl:attribute name="schemeID">
												<xsl:text>001</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeName">
												<xsl:text>UNSPSC</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeAgencyID">
												<xsl:text>10</xsl:text>
											</xsl:attribute>
											<xsl:value-of select="CdgItem[TpoCodigo = '001']/VlrCodigo"/>
										</xsl:element>
									</xsl:element>
								</xsl:if>
								<xsl:if test="CdgItem[TpoCodigo = '010']/VlrCodigo != ''">
									<xsl:element name="cac:StandardItemIdentification">
										<xsl:element name="cbc:ID">
											<xsl:attribute name="schemeID">
												<xsl:text>010</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeName">
												<xsl:text>GTIN</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeAgencyID">
												<xsl:text>9</xsl:text>
											</xsl:attribute>
											<xsl:value-of
												select="format-number(CdgItem[TpoCodigo = '010']/VlrCodigo, '#00000000000000')"
											/>
										</xsl:element>
									</xsl:element>
								</xsl:if>
								<xsl:if test="CdgItem[TpoCodigo = '020']/VlrCodigo != ''">
									<xsl:element name="cac:StandardItemIdentification">
										<xsl:element name="cbc:ID">
											<xsl:attribute name="schemeID">
												<xsl:text>020</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeName">
												<xsl:text>Partida Aranceraria</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeAgencyID">
												<xsl:text>195</xsl:text>
											</xsl:attribute>
											<xsl:value-of select="CdgItem[TpoCodigo = '020']/VlrCodigo"/>
										</xsl:element>
									</xsl:element>
								</xsl:if>
								<xsl:if test="CdgItem[TpoCodigo = 'EAN13']/VlrCodigo != ''">
									<xsl:element name="cac:StandardItemIdentification">
										<xsl:element name="cbc:ID">
											<xsl:attribute name="schemeID">
												<xsl:text>999</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeName">
												<xsl:text>EAN13</xsl:text>
											</xsl:attribute>
											<xsl:value-of select="CdgItem[TpoCodigo = 'EAN13']/VlrCodigo"/>
										</xsl:element>
									</xsl:element>
								</xsl:if>
							</xsl:when>
							<xsl:otherwise>
								<xsl:if test="CdgItem[TpoCodigo = '001']/VlrCodigo != ''">
									<xsl:element name="cac:StandardItemIdentification">
										<xsl:element name="cbc:ID">
											<xsl:attribute name="schemeID">
												<xsl:text>001</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeName">
												<xsl:text>UNSPSC</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeAgencyID">
												<xsl:text>10</xsl:text>
											</xsl:attribute>
											<xsl:value-of select="CdgItem[TpoCodigo = '001']/VlrCodigo"/>
										</xsl:element>
									</xsl:element>
								</xsl:if>
								<xsl:if test="CdgItem[TpoCodigo = '010']/VlrCodigo != ''">
									<xsl:element name="cac:StandardItemIdentification">
										<xsl:element name="cbc:ID">
											<xsl:attribute name="schemeID">
												<xsl:text>010</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeName">
												<xsl:text>GTIN</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeAgencyID">
												<xsl:text>9</xsl:text>
											</xsl:attribute>
											<xsl:value-of
												select="format-number(CdgItem[TpoCodigo = '010']/VlrCodigo, '#00000000000000')"
											/>
										</xsl:element>
									</xsl:element>
								</xsl:if>
								<xsl:if test="CdgItem[TpoCodigo = '020']/VlrCodigo != ''">
									<xsl:element name="cac:StandardItemIdentification">
										<xsl:element name="cbc:ID">
											<xsl:attribute name="schemeID">
												<xsl:text>020</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeName">
												<xsl:text>Partida Aranceraria</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeAgencyID">
												<xsl:text>195</xsl:text>
											</xsl:attribute>
											<xsl:value-of select="CdgItem[TpoCodigo = '020']/VlrCodigo"/>
										</xsl:element>
									</xsl:element>
								</xsl:if>
								<xsl:if test="CdgItem[TpoCodigo = '999']/VlrCodigo != ''">
									<xsl:element name="cac:StandardItemIdentification">
										<xsl:element name="cbc:ID">
											<xsl:attribute name="schemeID">
												<xsl:text>999</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeName">
												<xsl:text>EAN13</xsl:text>
											</xsl:attribute>
											<xsl:value-of select="CdgItem[TpoCodigo = '999']/VlrCodigo"/>
										</xsl:element>
									</xsl:element>
								</xsl:if>
								<xsl:if test="CdgItem[TpoCodigo = 'EAN13']/VlrCodigo != ''">
									<xsl:element name="cac:StandardItemIdentification">
										<xsl:element name="cbc:ID">
											<xsl:attribute name="schemeID">
												<xsl:text>999</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeName">
												<xsl:text>EAN13</xsl:text>
											</xsl:attribute>
											<xsl:value-of select="CdgItem[TpoCodigo = 'EAN13']/VlrCodigo"/>
										</xsl:element>
									</xsl:element>
								</xsl:if>
							</xsl:otherwise>
						</xsl:choose>
						
					
						<xsl:if test="CdgItem[TpoCodigo = '999']/VlrCodigo != ''">
							<xsl:element name="cac:AdditionalItemIdentification">
								<xsl:element name="cbc:ID">
									<xsl:attribute name="schemeID">
										<xsl:text>999</xsl:text>
									</xsl:attribute>
									<xsl:attribute name="schemeName">
										<xsl:text>EAN13</xsl:text>
									</xsl:attribute>
									<xsl:value-of select="CdgItem[TpoCodigo = '999']/VlrCodigo"/>
								</xsl:element>
							</xsl:element>
						</xsl:if>	
						
						<!--Informacion transportista-->
						
						<xsl:if test="(//IdDoc/TipoServicio = '12') and ServicioItem[position()]/Numero !=''">
							<xsl:element name="cac:AdditionalItemProperty">
								<xsl:element name="cbc:Name">
									<xsl:text>01</xsl:text>
								</xsl:element>
								<xsl:element name="cbc:Value">
									<xsl:value-of select="ServicioItem/Numero"/>
								</xsl:element>
							</xsl:element>
							<xsl:element name="cac:AdditionalItemProperty">
								<xsl:element name="cbc:Name">
									<xsl:text>02</xsl:text>
								</xsl:element>
								<xsl:element name="cbc:Value">
									<xsl:value-of select="ServicioItem/NroExp"/>
								</xsl:element>
							</xsl:element>
							<xsl:element name="cac:AdditionalItemProperty">
								<xsl:element name="cbc:Name">
									<xsl:text>03</xsl:text>
								</xsl:element>
								<xsl:element name="cbc:Value">
									<xsl:value-of select="ServicioItem/RazonServ"/>
								</xsl:element>
								<xsl:element name="cbc:ValueQuantity">
									<xsl:attribute name="unitCode">
										<xsl:value-of select="UnmdItem"/>
									</xsl:attribute>
									<xsl:value-of select="ServicioItem/Ejecutor"/>
								</xsl:element>
							</xsl:element>
						</xsl:if>
						
						<!--Informacion del Mandante-->
						<xsl:if test="(//IdDoc/TipoServicio = '11' or //IdDoc/TipoServicio = '12') and ServicioItem[position()]/Mandante !=''">
							<xsl:element name="cac:InformationContentProviderParty">
								<xsl:element name="cac:PowerOfAttorney">
									<xsl:element name="cac:AgentParty">
										<xsl:element name="cac:PartyIdentification">
											<xsl:element name="cbc:ID">
												<xsl:attribute name="schemeID">
												<xsl:call-template name="calculNIT-dv">
												<xsl:with-param name="NIT">
												<xsl:value-of select="ServicioItem/Mandante"/>
												</xsl:with-param>
												</xsl:call-template>
												</xsl:attribute>
												<xsl:attribute name="schemeName">
												<xsl:text>31</xsl:text>
												</xsl:attribute>
												<xsl:attribute name="schemeAgencyID">
												<xsl:text>195</xsl:text>
												</xsl:attribute>
												<xsl:value-of select="ServicioItem/Mandante"/>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:if>
					</xsl:element>
					<!--Unit Price-->
					<xsl:element name="cac:Price">
						<xsl:element name="cbc:PriceAmount">
							<xsl:attribute name="currencyID">
								<xsl:value-of select="$MonedaC"/>
							</xsl:attribute>
							<xsl:value-of
								select="normalize-space(format-number(PrcBrutoItem, '#0.00'))"/>
						</xsl:element>
						<xsl:element name="cbc:BaseQuantity">
							<!--Unit of Measure -->
							<xsl:attribute name="unitCode">
								<xsl:value-of select="UnmdItem"/>
							</xsl:attribute>
							<xsl:value-of select="format-number(QtyItem, '#0.000000')"/>
						</xsl:element>
					</xsl:element>
				</xsl:element>
			</xsl:for-each>
			<xsl:element name="Personalizados">
				<xsl:element name="DocPersonalizado">
					<xsl:attribute name="dteID">
						<xsl:value-of select="/DTE/Personalizados/DocPersonalizado/@dteID"/>
					</xsl:attribute>
					<xsl:element name="campoString">
						<xsl:attribute name="name">
							<xsl:text>QRCode</xsl:text>
						</xsl:attribute>
						<xsl:variable name="CUFE">
							<!--<xsl:value-of select="crypto:hash($CUFEString, 'SHA-384')"/>-->
							<xsl:value-of select="$CUFEString"/>
						</xsl:variable>
						<xsl:value-of select="concat('NumFac:=',concat(/DTE/Documento/Encabezado/IdDoc/Serie, /DTE/Documento/Encabezado/IdDoc/Numero))"/>
						<xsl:text>
								</xsl:text>
						<xsl:value-of select="concat('FecFac:',substring(/DTE/Documento/Encabezado/IdDoc/FechaEmis, 1, 10))"/>
						<xsl:text>
								</xsl:text>
						<xsl:value-of select="concat('HorFac:',substring(/DTE/Documento/Encabezado/IdDoc/FechaEmis, 12, 8),'-05:00')"/>
						<xsl:text>
								</xsl:text>
						<xsl:value-of select="concat('NitFac:',normalize-space(/DTE/Documento/Encabezado/Emisor/IDEmisor))"/>
						<xsl:text>
								</xsl:text>
						<xsl:value-of select="concat('DocAdq:',normalize-space(/DTE/Documento/Encabezado/Receptor/DocRecep/NroDocRecep))"/>
						<xsl:text>
								</xsl:text>
						<xsl:value-of select="concat('ValFac:',format-number(/DTE/Documento/Encabezado/Totales/SubTotal,'#0.00'))"/>
						<xsl:text>
								</xsl:text>
						<xsl:value-of select="concat('ValIva:',format-number(/DTE/Documento/Encabezado/Totales/MntImp,'#0.00'))"/>
						<xsl:text>
								</xsl:text>
						<xsl:choose>
							<xsl:when test="/DTE/Documento/Encabezado/Totales/MntRet !=''">
								<xsl:value-of select="concat('ValOtroIm:',format-number(/DTE/Documento/Encabezado/Totales/VlrPagar,'#0.00'))"/>
								<xsl:text>
								</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="'ValOtroIm:'"/>
								<xsl:text>
								</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:value-of select="concat('ValTolFac:',format-number(/DTE/Documento/Encabezado/Totales/VlrPagar,'#0.00'))"/>
						<xsl:text>
								</xsl:text>
						<xsl:value-of select="concat('CUFE:',$CUFE)"/>
						<xsl:text>
								</xsl:text>
						<xsl:choose>
							<xsl:when test="/DTE/Documento/Encabezado/IdDoc/Ambiente = 2 and not(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo')">
								<xsl:value-of select="concat('QRCode:','https://catalogo-vpfe-hab.dian.gov.co/document/searchqr?documentkey=',$CUFE)"/>
							</xsl:when>
							<xsl:when test="/DTE/Documento/Encabezado/IdDoc/Ambiente = 1 and not(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo')">
								<xsl:value-of select="concat('QRCode:','https://catalogo-vpfe.dian.gov.co/document/searchqr?documentkey=',$CUFE)"/>
							</xsl:when>
							<xsl:when test="/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo'">
								<xsl:value-of select="concat('QRCode:','https://catalogo-vpfe.dian.gov.co/document/searchqr?documentkey=',$CUFE)"/>
							</xsl:when>
						</xsl:choose>
					</xsl:element>
					<xsl:element name="campoString">
						<xsl:attribute name="name">
							<xsl:text>SERIE</xsl:text>
						</xsl:attribute>
						<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/Serie"/>
					</xsl:element>
					<xsl:element name="campoString">
						<xsl:attribute name="name">
							<xsl:text>FOLIO</xsl:text>
						</xsl:attribute>
						<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/Numero"/>
					</xsl:element>
					<xsl:element name="campoString">
						<xsl:attribute name="name">
							<xsl:text>FechaGeneracion</xsl:text>
						</xsl:attribute>
						<xsl:value-of select="substring(string(current-dateTime()), 1, 10)"/>
					</xsl:element>
					<xsl:element name="campoString">
						<xsl:attribute name="name">
							<xsl:text>HoraGeneracion</xsl:text>
						</xsl:attribute>
						<xsl:value-of select="substring(string(current-dateTime()), 12, 8)"/>
					</xsl:element>					
					<xsl:copy-of select="/DTE/Personalizados/DocPersonalizado/*"/>
					<xsl:for-each select="/DTE/Documento/Referencia[TpoDocRef = '90']">
						<xsl:element name="ImpresionReferencia">
							<xsl:element name="PersonNroLinRef">
								<xsl:value-of select="NroLinRef"/>
							</xsl:element>
							<xsl:element name="ECB02">
								<xsl:value-of select="ECB02"/>
							</xsl:element>
							<xsl:element name="ECB03">
								<xsl:value-of select="ECB03"/>
							</xsl:element>
							<xsl:element name="ECB04">
								<xsl:value-of select="ECB04"/>
							</xsl:element>
							<xsl:element name="ECB05">
								<xsl:value-of select="ECB05"/>
							</xsl:element>
							<xsl:element name="ECB06">
								<xsl:value-of select="ECB06"/>
							</xsl:element>
							<xsl:element name="ECB07">
								<xsl:value-of select="ECB07"/>
							</xsl:element>
							<xsl:element name="ECB08">
								<xsl:value-of select="ECB08"/>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:element>			
		</Invoice>
	</xsl:template>
	<xsl:template name="CREDITNOTE">
		<!--Gosocket DTE v1.2 CO to UBL 2.1 OASIS Oficial-->
		<CreditNote xmlns="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
			xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
			xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
			xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
			xmlns:sts="dian:gov:co:facturaelectronica:Structures-2-1"
			xmlns:xades="http://uri.etsi.org/01903/v1.3.2#"
			xmlns:xades141="http://uri.etsi.org/01903/v1.4.1#"
			xmlns:fn="http://www.w3.org/2005/xpath-functions">
			<!--xsi:schemaLocation="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2
			http://docs.oasis-open.org/ubl/os-UBL-2.1/xsd/maindoc/UBL-CreditNote-2.1.xsd">-->
			<!--var CurrencyType-->
			<xsl:variable name="MonedaC" select="normalize-space(//Moneda)"/>
			<xsl:variable name="CUFEString">
				<xsl:value-of
					select="
					concat(/DTE/Documento/Encabezado/IdDoc/Serie, /DTE/Documento/Encabezado/IdDoc/Numero, substring(/DTE/Documento/Encabezado/IdDoc/FechaEmis, 1, 10), if (string-length(substring-after(/DTE/Documento/Encabezado/IdDoc/FechaEmis, 'T')) != 9) then
					concat(substring-after(/DTE/Documento/Encabezado/IdDoc/FechaEmis, 'T'), '-05:00')
					else
					concat(substring(/DTE/Documento/Encabezado/IdDoc/FechaEmis, 12, 8), '-05:00'), format-number(/DTE/Documento/Encabezado/Totales/SubTotal, '#0.00'), '01', if (not(/DTE/Documento/Encabezado/Impuestos[TipoImp = '01']/MontoImp)) then
					'0.00'
					else
					format-number(sum(/DTE/Documento/Encabezado/Impuestos[TipoImp = '01']/MontoImp), '#0.00'), '04', if (not(/DTE/Documento/Encabezado/Impuestos[TipoImp = '04']/MontoImp)) then
					'0.00'
					else
					format-number(sum(/DTE/Documento/Encabezado/Impuestos[TipoImp = '04']/MontoImp), '#0.00'), '03', if (not(/DTE/Documento/Encabezado/Impuestos[TipoImp = '03']/MontoImp)) then
					'0.00'
					else
					format-number(sum(/DTE/Documento/Encabezado/Impuestos[TipoImp = '03']/MontoImp), '#0.00'), format-number(/DTE/Documento/Encabezado/Totales/VlrPagar, '#0.00'), /DTE/Documento/Encabezado/Emisor/IDEmisor, /DTE/Documento/Encabezado/Receptor/DocRecep/NroDocRecep, /DTE/Documento/CAE/ClaveTC, /DTE/Documento/Encabezado/IdDoc/Ambiente)"
				/>
			</xsl:variable>
			<xsl:variable name="CodigoSoftware">
				<xsl:choose>
					<xsl:when test="/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo'">
						<xsl:text>fa326ca7-c1f8-40d3-a6fc-24d7c1040607</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>56f2ae4e-9812-4fad-9255-08fcfcd5ccb0</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<!--EXTENSIONES DEFINIDAS POR DIAN-->
			<xsl:element name="ext:UBLExtensions">
				<xsl:element name="ext:UBLExtension">
					<xsl:element name="ext:ExtensionContent">
						<sts:DianExtensions>
							<xsl:element name="sts:InvoiceSource">
								<xsl:element name="cbc:IdentificationCode">
									<xsl:attribute name="listAgencyID">
										<xsl:text>6</xsl:text>
									</xsl:attribute>
									<xsl:attribute name="listAgencyName">
										<xsl:text>United Nations Economic Commission for Europe</xsl:text>
									</xsl:attribute>
									<xsl:attribute name="listSchemeURI">
										<xsl:text>urn:oasis:names:specification:ubl:codelist:gc:CountryIdentificationCode-2.1</xsl:text>
									</xsl:attribute>
									<xsl:text>CO</xsl:text>
								</xsl:element>
							</xsl:element>
							<xsl:element name="sts:SoftwareProvider">
								<xsl:element name="sts:ProviderID">
									<xsl:attribute name="schemeID">
										<xsl:choose>
											<xsl:when test="/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo'">
												<xsl:call-template name="calculNIT-dv">
													<xsl:with-param name="NIT">
														<xsl:text>800197268</xsl:text>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="calculNIT-dv">
													<xsl:with-param name="NIT">
														<xsl:text>900508908</xsl:text>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
									<xsl:attribute name="schemeName">
										<xsl:text>31</xsl:text>
									</xsl:attribute>
									<xsl:attribute name="schemeAgencyID">
										<xsl:text>195</xsl:text>
									</xsl:attribute>
									<xsl:attribute name="schemeAgencyName">
										<xsl:text>CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)</xsl:text>
									</xsl:attribute>
									<xsl:choose>
										<xsl:when test="/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo'">
											<!-- NIT DIAN como proveedor tecnologico (Facturador Gratuito) -->
											<xsl:text>800197268</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<!-- NIT Gosocket como proveedor tecnologico (Todos los productos) -->
											<xsl:text>900508908</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:element>
								<xsl:element name="sts:SoftwareID">
									<xsl:attribute name="schemeAgencyID">
										<xsl:text>195</xsl:text>
									</xsl:attribute>
									<xsl:attribute name="schemeAgencyName">
										<xsl:text>CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)</xsl:text>
									</xsl:attribute>
									<xsl:choose>
										<xsl:when
											test="/DTE/Documento/Encabezado/IdDoc/Area/IdArea != ''">
											<xsl:value-of
												select="/DTE/Documento/Encabezado/IdDoc/Area/IdArea"
											/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="$CodigoSoftware"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:element>
							</xsl:element>
							<xsl:element name="sts:SoftwareSecurityCode">
								<xsl:attribute name="schemeAgencyID">
									<xsl:text>195</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="schemeAgencyName">
									<xsl:text>CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)</xsl:text>
								</xsl:attribute>
								<xsl:choose>
									<!-- Test si existe Codigo Software y Pin software en DTE. -->
									<xsl:when test="/DTE/Documento/Encabezado/IdDoc/Area/IdArea != '' and /DTE/Documento/Encabezado/IdDoc/Area/IdRevision != ''">
										<!-- Clave seguridad del software en caso de tener la informacion en DTE. -->
										<xsl:variable name="CodigoSeguridad">
											<xsl:value-of select="concat(/DTE/Documento/Encabezado/IdDoc/Area/IdArea, /DTE/Documento/Encabezado/IdDoc/Area/IdRevision, /DTE/Documento/Encabezado/IdDoc/Serie, /DTE/Documento/Encabezado/IdDoc/Numero)" />
										</xsl:variable>
										<xsl:value-of select="$CodigoSeguridad" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:choose>
											<xsl:when test="/DTE/Documento/Encabezado/IdDoc/Ambiente = 2">
												<!-- Si es ambiente de pruebas -->
												<xsl:variable name="CodigoSeguridad">
													<xsl:value-of select="concat($CodigoSoftware, '20191', /DTE/Documento/Encabezado/IdDoc/Serie, /DTE/Documento/Encabezado/IdDoc/Numero)" />
												</xsl:variable>
												<xsl:value-of select="$CodigoSeguridad"/>
											</xsl:when>
											<xsl:otherwise>
												<!-- Si es ambiente de producción -->
												<xsl:variable name="CodigoSeguridad">
													<xsl:value-of select="concat($CodigoSoftware, '20191', /DTE/Documento/Encabezado/IdDoc/Serie, /DTE/Documento/Encabezado/IdDoc/Numero)" />
												</xsl:variable>
												<xsl:value-of select="$CodigoSeguridad"/>
												<!--<xsl:value-of
												select="crypto:hash($CodigoSeguridad, 'SHA-384')"
												/>-->
											</xsl:otherwise>
										</xsl:choose>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:element>
							<xsl:element name="sts:AuthorizationProvider">
								<xsl:element name="sts:AuthorizationProviderID">
									<xsl:attribute name="schemeID">
										<xsl:call-template name="calculNIT-dv">
											<xsl:with-param name="NIT">
												<xsl:text>800197268</xsl:text>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:attribute>
									<xsl:attribute name="schemeName">
										<xsl:text>31</xsl:text>
									</xsl:attribute>
									<xsl:attribute name="schemeAgencyID">
										<xsl:text>195</xsl:text>
									</xsl:attribute>
									<xsl:attribute name="schemeAgencyName">
										<xsl:text>CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)</xsl:text>
									</xsl:attribute>
									<xsl:text>800197268</xsl:text>
								</xsl:element>
							</xsl:element>
							<xsl:element name="sts:QRCode">
								<xsl:variable name="CUFE">
									<!--<xsl:value-of select="crypto:hash($CUFEString, 'SHA-384')"/>-->
									<xsl:value-of select="$CUFEString"/>
								</xsl:variable>
								<!--<xsl:value-of select="concat('FechaFactura=',substring(/DTE/Documento/Encabezado/IdDoc/FechaEmis, 1, 10))"/>
								<xsl:text>
								</xsl:text>-->
							<xsl:choose>
									<xsl:when test="/DTE/Documento/Encabezado/IdDoc/Ambiente = 2 and not(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo')">
										<xsl:value-of select="concat('https://catalogo-vpfe-hab.dian.gov.co/document/searchqr?documentkey=',$CUFE)"/>
									</xsl:when>
									<xsl:when test="/DTE/Documento/Encabezado/IdDoc/Ambiente = 1 and not(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo')">
										<xsl:value-of select="concat('https://catalogo-vpfe.dian.gov.co/document/searchqr?documentkey=',$CUFE)"/>
									</xsl:when>
									<xsl:when test="/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo'">
										<xsl:value-of select="concat('https://catalogo-vpfe.dian.gov.co/document/searchqr?documentkey=',$CUFE)"/>
									</xsl:when>
								</xsl:choose>
							</xsl:element>
						</sts:DianExtensions>
					</xsl:element>
				</xsl:element>
				<!-- Lugar donde va la firma digital -->
				<!--<xsl:element name="ext:UBLExtension">
					<xsl:element name="ext:ExtensionContent"/>
				</xsl:element>-->
			</xsl:element>
			<!--VersionUBL-->
			<xsl:element name="cbc:UBLVersionID">
				<xsl:text>UBL 2.1</xsl:text>
			</xsl:element>
			<!--Customization ID-->
			<xsl:element name="cbc:CustomizationID">
				<xsl:if test="not(/DTE/Documento/Encabezado/IdDoc/TipoServicio)">
					<xsl:text>1</xsl:text>
				</xsl:if>
				<xsl:if test="/DTE/Documento/Encabezado/IdDoc/TipoServicio">
					<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/TipoServicio"/>
				</xsl:if>
			</xsl:element>
			<!--VersionProfile-->
			<xsl:element name="cbc:ProfileID">
				<xsl:text>DIAN 2.1: Nota Crédito de Factura Electrónica de Venta</xsl:text>
			</xsl:element>
			<!--Ambiente de destino-->
			<xsl:variable name="Ambiente">
				<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/Ambiente"/>
			</xsl:variable>
			<xsl:element name="cbc:ProfileExecutionID">
				<xsl:value-of select="$Ambiente"/>
			</xsl:element>
			<!--Number of the Invoice-->
			<xsl:element name="cbc:ID">
				<xsl:value-of
					select="normalize-space(concat(/DTE/Documento/Encabezado/IdDoc/Serie, /DTE/Documento/Encabezado/IdDoc/Numero))"
				/>
			</xsl:element>
			<!--CUFE of the Invoice-->
			<xsl:element name="cbc:UUID">
				<xsl:attribute name="schemeID">
					<xsl:value-of select="$Ambiente"/>
				</xsl:attribute>
				<xsl:attribute name="schemeName">
					<xsl:text>CUDE-SHA384</xsl:text>
				</xsl:attribute>
				<!--<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/Serie"/>
				<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/Numero"/>
				<xsl:value-of select="substring(/DTE/Documento/Encabezado/IdDoc/FechaEmis, 1, 10)"/>
				<xsl:value-of select="concat(substring(/DTE/Documento/Encabezado/IdDoc/FechaEmis, 12, 8), '-05:00')"/>
				<xsl:value-of select="format-number(/DTE/Documento/Encabezado/Totales/SubTotal, '#0.00')"/>
				<xsl:value-of select="'01'"/>
				<xsl:value-of select=" if (/Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:ID = '01') then (if (/Invoice/cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cbc:ID = '01']/cbc:TaxAmount > 0) then format-number(/Invoice/cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cbc:ID = '01']/cbc:TaxAmount, '#0.00') else '0.00') else if (not(/Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:ID = '01')) then '0.00' else '0.00'"/>
				<xsl:value-of select="'02'"/>
				<xsl:value-of select=" if (/Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:ID = '02') then (if (/Invoice/cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cbc:ID = '02']/cbc:TaxAmount > 0) then format-number(/Invoice/cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cbc:ID = '02']/cbc:TaxAmount, '#0.00') else'0.00') else if (not(/Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:ID = '02')) then '0.00' else '0.00'"/>
				<xsl:value-of select="'03'"/>
				<xsl:value-of select=" if (/Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:ID = '03') then (if (/Invoice/cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cbc:ID = '03']/cbc:TaxAmount > 0) then format-number(/Invoice/cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cbc:ID = '03']/cbc:TaxAmount, '#0.00') else '0.00') else if (not(/Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:ID = '03')) then '0.00' else '0.00'"/>
				<xsl:value-of select="format-number(/DTE/Documento/Encabezado/Totales/VlrPagar, '#0.00')"/>
				<xsl:value-of select="/DTE/Documento/Encabezado/Emisor/IDEmisor"/>
				<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/DocRecep/NroDocRecep"/>
				<xsl:value-of select="/DTE/Documento/CAE/ClaveTC"/>
				<xsl:value-of select="$Ambiente"/>-->
				<xsl:variable name="CUFE">
					<!--<xsl:value-of select="crypto:hash($CUFEString, 'SHA-384')"/>-->
					<xsl:value-of select="$CUFEString"/>
				</xsl:variable>
				<xsl:value-of select="$CUFE"/>
			</xsl:element>
			<!--Issuing Date of the document -->
			<xsl:element name="cbc:IssueDate">
				<xsl:value-of select="substring(/DTE/Documento/Encabezado/IdDoc/FechaEmis, 1, 10)"/>
			</xsl:element>
			<!--Issuing Time of the document -->
			<xsl:element name="cbc:IssueTime">
				<xsl:value-of
					select="concat(substring(/DTE/Documento/Encabezado/IdDoc/FechaEmis, 12, 8), '-05:00')"
				/>
			</xsl:element>
			<!--Document Type-->
			<xsl:element name="cbc:CreditNoteTypeCode">
				<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/Tipo"/>
			</xsl:element>
			<xsl:if test="/DTE/Documento/Encabezado/IdDoc/IndServicio != ''">
				<xsl:element name="cbc:Note">
					<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/IndServicio"/>
				</xsl:element>
			</xsl:if>
			<xsl:for-each select="DTE/Personalizados/DocPersonalizado/campoString[@name = 'Notas']">
				<xsl:if test=". != ''">
					<xsl:element name="cbc:Note">
						<xsl:value-of select="."/>
					</xsl:element>
				</xsl:if>
			</xsl:for-each>
			<!--Document Currency Type-->
			<xsl:element name="cbc:DocumentCurrencyCode">
				<xsl:attribute name="listID">
					<xsl:text>ISO 4217 Alpha</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="listAgencyID">
					<xsl:text>6</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="listAgencyName">
					<xsl:text>United Nations Economic Commission for Europe</xsl:text>
				</xsl:attribute>
				<xsl:value-of select="$MonedaC"/>
			</xsl:element>
			<xsl:element name="cbc:LineCountNumeric">
				<xsl:value-of select="count(/DTE/Documento/Detalle)"/>
			</xsl:element>
			<!-- Periodo de Facturacion -->
			<xsl:if test="/DTE/Documento/Encabezado/IdDoc/PeriodoDesde">
				<xsl:element name="cac:InvoicePeriod">
					<xsl:element name="cbc:StartDate">
						<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/PeriodoDesde"/>
					</xsl:element>
					<xsl:element name="cbc:EndDate">
						<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/PeriodoHasta"/>
					</xsl:element>
				</xsl:element>
			</xsl:if>
			<!--DISCREPANCY RESPONSE-->
			<xsl:for-each select="//Referencia">
				<xsl:choose>
					<xsl:when test="TpoDocRef = '01'">
						<xsl:element name="cac:DiscrepancyResponse">
							<xsl:element name="cbc:ReferenceID">
								<xsl:value-of select="SerieRef"/>
								<xsl:value-of select="NumeroRef"/>
							</xsl:element>
							<!--ResponceCode referente a al tipo de documento: 1 Devolución de parte de los bienes; no aceptación de partes del servicio,  2 Anulación de factura electrónica; 3 Rebaja total aplicada; 4 Descuento total aplicado; 5 Rescisión: nulidad por falta de requisitos; 6 Otros -->
							<xsl:element name="cbc:ResponseCode">
								<!--<xsl:attribute name="name"><xsl:text>concepto de notas crédito</xsl:text></xsl:attribute>
								<xsl:attribute name="listName"><xsl:text>concepto de notas crédito</xsl:text></xsl:attribute>
								<xsl:attribute name="listSchemeURI"><xsl:text>http://www.dian.gov.co/micrositios/fac_electronica/documentos/Anexo_Tecnico_001_Formatos_de_los_Documentos_XML_de_Facturacion_Electron.pdf</xsl:text></xsl:attribute> -->
								<xsl:value-of select="CodRef"/>
							</xsl:element>
							<!-- Referente a la razon de referencia-->
							<xsl:element name="cbc:Description">
								<xsl:value-of select="RazonRef"/>
							</xsl:element>
						</xsl:element>
					</xsl:when>
					<xsl:when test="TpoDocRef = '02'">
						<xsl:element name="cac:DiscrepancyResponse">
							<xsl:element name="cbc:ReferenceID">
								<xsl:value-of select="SerieRef"/>
								<xsl:value-of select="NumeroRef"/>
							</xsl:element>
							<!--ResponceCode referente a al tipo de documento: 1 Devolución de parte de los bienes; no aceptación de partes del servicio,  2 Anulación de factura electrónica; 3 Rebaja total aplicada; 4 Descuento total aplicado; 5 Rescisión: nulidad por falta de requisitos; 6 Otros -->
							<xsl:element name="cbc:ResponseCode">
								<!--<xsl:attribute name="name"><xsl:text>concepto de notas crédito</xsl:text></xsl:attribute>
								<xsl:attribute name="listName"><xsl:text>concepto de notas crédito</xsl:text></xsl:attribute>
								<xsl:attribute name="listSchemeURI"><xsl:text>http://www.dian.gov.co/micrositios/fac_electronica/documentos/Anexo_Tecnico_001_Formatos_de_los_Documentos_XML_de_Facturacion_Electron.pdf</xsl:text></xsl:attribute> -->
								<xsl:value-of select="CodRef"/>
							</xsl:element>
							<!-- Referente a la razon de referencia-->
							<xsl:element name="cbc:Description">
								<xsl:value-of select="RazonRef"/>
							</xsl:element>
						</xsl:element>
					</xsl:when>
					<xsl:when test="TpoDocRef = '03'">
						<xsl:element name="cac:DiscrepancyResponse">
							<xsl:element name="cbc:ReferenceID">
								<xsl:value-of select="SerieRef"/>
								<xsl:value-of select="NumeroRef"/>
							</xsl:element>
							<!--ResponceCode referente a al tipo de documento: 1 Devolución de parte de los bienes; no aceptación de partes del servicio,  2 Anulación de factura electrónica; 3 Rebaja total aplicada; 4 Descuento total aplicado; 5 Rescisión: nulidad por falta de requisitos; 6 Otros -->
							<xsl:element name="cbc:ResponseCode">
								<!--<xsl:attribute name="name"><xsl:text>concepto de notas crédito</xsl:text></xsl:attribute>
								<xsl:attribute name="listName"><xsl:text>concepto de notas crédito</xsl:text></xsl:attribute>
								<xsl:attribute name="listSchemeURI"><xsl:text>http://www.dian.gov.co/micrositios/fac_electronica/documentos/Anexo_Tecnico_001_Formatos_de_los_Documentos_XML_de_Facturacion_Electron.pdf</xsl:text></xsl:attribute> -->
								<xsl:value-of select="CodRef"/>
							</xsl:element>
							<!-- Referente a la razon de referencia-->
							<xsl:element name="cbc:Description">
								<xsl:value-of select="RazonRef"/>
							</xsl:element>
						</xsl:element>
					</xsl:when>
					<xsl:when test="TpoDocRef = '04'">
						<xsl:element name="cac:DiscrepancyResponse">
							<xsl:element name="cbc:ReferenceID">
								<xsl:value-of select="SerieRef"/>
								<xsl:value-of select="NumeroRef"/>
							</xsl:element>
							<!--ResponceCode referente a al tipo de documento: 1 Devolución de parte de los bienes; no aceptación de partes del servicio,  2 Anulación de factura electrónica; 3 Rebaja total aplicada; 4 Descuento total aplicado; 5 Rescisión: nulidad por falta de requisitos; 6 Otros -->
							<xsl:element name="cbc:ResponseCode">
								<!--<xsl:attribute name="name"><xsl:text>concepto de notas crédito</xsl:text></xsl:attribute>
								<xsl:attribute name="listName"><xsl:text>concepto de notas crédito</xsl:text></xsl:attribute>
								<xsl:attribute name="listSchemeURI"><xsl:text>http://www.dian.gov.co/micrositios/fac_electronica/documentos/Anexo_Tecnico_001_Formatos_de_los_Documentos_XML_de_Facturacion_Electron.pdf</xsl:text></xsl:attribute> -->
								<xsl:value-of select="CodRef"/>
							</xsl:element>
							<!-- Referente a la razon de referencia-->
							<xsl:element name="cbc:Description">
								<xsl:value-of select="RazonRef"/>
							</xsl:element>
						</xsl:element>
					</xsl:when>
				</xsl:choose>
			</xsl:for-each>
			<!--Reference for Purchase Order-->
			<xsl:variable name="OrdenCompra"
				select="/DTE/Documento/Referencia[TpoDocRef = 'OC'][1]/NumeroRef"/>
			<xsl:if test="$OrdenCompra != ''">
				<xsl:element name="cac:OrderReference">
					<xsl:element name="cbc:ID">
						<xsl:value-of select="$OrdenCompra"/>
					</xsl:element>
					<xsl:if test="/DTE/Documento/Referencia[TpoDocRef = 'OC'][1]/FechaRef">
						<xsl:element name="cbc:IssueDate">
							<xsl:value-of select="/DTE/Documento/Referencia[TpoDocRef = 'OC'][1]/FechaRef"/>
						</xsl:element>
					</xsl:if>
				</xsl:element>
			</xsl:if>
			<!--Referencias (Invoice | CreditNote | DebitNote)-->
			<xsl:for-each select="/DTE/Documento/Referencia">
				<xsl:choose>
					<xsl:when test="(TpoDocRef = '01' and (not(MontosRef/Monto) or MontosRef/Monto = '')) or TpoDocRef = '02' or TpoDocRef = '04'">
						<xsl:element name="cac:BillingReference">
							<xsl:element name="cac:InvoiceDocumentReference">
								<xsl:element name="cbc:ID">
									<xsl:value-of select="concat(SerieRef, NumeroRef)"/>
								</xsl:element>
								<xsl:element name="cbc:UUID">
									<xsl:attribute name="schemeName">
										<xsl:choose>
											<xsl:when test="string-length(ECB01) = 40">
												<xsl:value-of select="'CUFE-SHA1'"/>
											</xsl:when>
											<xsl:when test="string-length(ECB01) = 64">
												<xsl:value-of select="'CUFE-SHA256'"/>
											</xsl:when>
											<xsl:when test="string-length(ECB01) = 96">
												<xsl:value-of select="'CUFE-SHA384'"/>
											</xsl:when>
											<xsl:when test="string-length(ECB01) = 128">
												<xsl:value-of select="'CUFE-SHA512'"/>
											</xsl:when>
											<xsl:otherwise/>
										</xsl:choose>
									</xsl:attribute>
									<xsl:value-of select="ECB01"/>
								</xsl:element>
								<xsl:element name="cbc:IssueDate">
									<xsl:value-of select="FechaRef"/>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:when>
					<xsl:when test="TpoDocRef = '03'">
						<xsl:element name="cac:BillingReference">
							<xsl:element name="cac:InvoiceDocumentReference">
								<xsl:element name="cbc:ID">
									<xsl:value-of select="concat(SerieRef, NumeroRef)"/>
								</xsl:element>
								<xsl:element name="cbc:UUID">
									<xsl:attribute name="schemeName">
										<xsl:choose>
											<xsl:when test="string-length(ECB01) = 40">
												<xsl:value-of select="'CUDE-SHA1'"/>
											</xsl:when>
											<xsl:when test="string-length(ECB01) = 64">
												<xsl:value-of select="'CUDE-SHA256'"/>
											</xsl:when>
											<xsl:when test="string-length(ECB01) = 96">
												<xsl:value-of select="'CUDE-SHA384'"/>
											</xsl:when>
											<xsl:when test="string-length(ECB01) = 128">
												<xsl:value-of select="'CUDE-SHA512'"/>
											</xsl:when>
											<xsl:otherwise/>
										</xsl:choose>
									</xsl:attribute>
									<xsl:value-of select="ECB01"/>
								</xsl:element>
								<xsl:element name="cbc:IssueDate">
									<xsl:value-of select="FechaRef"/>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:when>
					<!--<xsl:when test="TpoDocRef = '07'">
						<xsl:element name="cac:BillingReference">
							<xsl:element name="cac:CreditNoteDocumentReference">
								<xsl:element name="cbc:ID">
									<xsl:value-of select="concat(SerieRef, NumeroRef)"/>
								</xsl:element>
								<xsl:if test="ECB01 != ''">
									<xsl:element name="cbc:UUID">
										<xsl:attribute name="schemeName">
											<xsl:choose>
												<xsl:when test="string-length(ECB01) = 40">
												<xsl:value-of select="'CUFE-SHA1'"/>
												</xsl:when>
												<xsl:when test="string-length(ECB01) = 64">
												<xsl:value-of select="'CUFE-SHA256'"/>
												</xsl:when>
												<xsl:when test="string-length(ECB01) = 96">
												<xsl:value-of select="'CUFE-SHA384'"/>
												</xsl:when>
												<xsl:when test="string-length(ECB01) = 128">
												<xsl:value-of select="'CUFE-SHA512'"/>
												</xsl:when>
												<xsl:otherwise/>
											</xsl:choose>
										</xsl:attribute>
										<xsl:value-of select="ECB01"/>
									</xsl:element>
								</xsl:if>
								<xsl:element name="cbc:IssueDate">
									<xsl:value-of select="FechaRef"/>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:when>
					<xsl:when test="TpoDocRef = '08'">
						<xsl:element name="cac:BillingReference">
							<xsl:element name="cac:DebitNoteDocumentReference">
								<xsl:element name="cbc:ID">
									<xsl:value-of select="concat(SerieRef, NumeroRef)"/>
								</xsl:element>
								<xsl:if test="ECB01 != ''">
									<xsl:element name="cbc:UUID">
										<xsl:attribute name="schemeName">
											<xsl:choose>
												<xsl:when test="string-length(ECB01) = 40">
												<xsl:value-of select="'CUFE-SHA1'"/>
												</xsl:when>
												<xsl:when test="string-length(ECB01) = 64">
												<xsl:value-of select="'CUFE-SHA256'"/>
												</xsl:when>
												<xsl:when test="string-length(ECB01) = 96">
												<xsl:value-of select="'CUFE-SHA384'"/>
												</xsl:when>
												<xsl:when test="string-length(ECB01) = 128">
												<xsl:value-of select="'CUFE-SHA512'"/>
												</xsl:when>
												<xsl:otherwise/>
											</xsl:choose>
										</xsl:attribute>
										<xsl:value-of select="ECB01"/>
									</xsl:element>
								</xsl:if>
								<xsl:element name="cbc:IssueDate">
									<xsl:value-of select="FechaRef"/>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:when>-->
					<xsl:otherwise/>
				</xsl:choose>
			</xsl:for-each>
			<xsl:for-each select="/DTE/Documento/Referencia">
				<!--Despatch Document Reference -->
				<xsl:if test="TpoDocRef = '09'">
					<xsl:element name="cac:DespatchDocumentReference">
						<xsl:element name="cbc:ID">
							<xsl:value-of select="concat(SerieRef, NumeroRef)"/>
						</xsl:element>
						<xsl:if test="FechaRef">
							<xsl:element name="cbc:IssueDate">
								<xsl:value-of select="FechaRef"/>
							</xsl:element>
						</xsl:if>
					</xsl:element>
				</xsl:if>
				<!--Receipt Document Reference -->
				<xsl:if test="TpoDocRef = '20'">
					<xsl:element name="cac:ReceiptDocumentReference">
						<xsl:element name="cbc:ID">
							<xsl:value-of select="concat(SerieRef, NumeroRef)"/>
						</xsl:element>
						<xsl:if test="FechaRef">
							<xsl:element name="cbc:IssueDate">
								<xsl:value-of select="FechaRef"/>
							</xsl:element>
						</xsl:if>
					</xsl:element>
				</xsl:if>
				<xsl:if test="TpoDocRef = '01' and //IdDoc/Tipo = '03'">
					<xsl:element name="cac:AdditionalDocumentReference">
						<xsl:element name="cbc:ID">
							<xsl:value-of select="concat(SerieRef, NumeroRef)"/>
						</xsl:element>
						<xsl:element name="cbc:UUID">
							<xsl:attribute name="schemeName">
								<xsl:choose>
									<xsl:when test="string-length(ECB01) = 40">
										<xsl:value-of select="'CUFE-SHA1'"/>
									</xsl:when>
									<xsl:when test="string-length(ECB01) = 64">
										<xsl:value-of select="'CUFE-SHA256'"/>
									</xsl:when>
									<xsl:when test="string-length(ECB01) = 96">
										<xsl:value-of select="'CUFE-SHA384'"/>
									</xsl:when>
									<xsl:when test="string-length(ECB01) = 128">
										<xsl:value-of select="'CUFE-SHA512'"/>
									</xsl:when>
									<xsl:otherwise/>
								</xsl:choose>
							</xsl:attribute>
							<xsl:value-of select="ECB01"/>
						</xsl:element>
						<xsl:element name="cbc:DocumentTypeCode">
							<xsl:value-of select="TpoDocRef"/>
						</xsl:element>
					</xsl:element>
				</xsl:if>
				<!--<xsl:if test="((TpoDocRef = '01') and (//IdDoc/Tipo = '07' or //IdDoc/Tipo = '91')) or ((TpoDocRef = '02') and (//IdDoc/Tipo = '07' or //IdDoc/Tipo = '91')) or ((TpoDocRef = '03') and (//IdDoc/Tipo = '07' or //IdDoc/Tipo = '91')) or ((TpoDocRef = '01') and (//IdDoc/Tipo = '08' or //IdDoc/Tipo = '92')) or ((TpoDocRef = '02') and (//IdDoc/Tipo = '08' or //IdDoc/Tipo = '92')) or ((TpoDocRef = '03') and (//IdDoc/Tipo = '08' or //IdDoc/Tipo = '92'))">
					<xsl:element name="cac:AdditionalDocumentReference">
						<xsl:element name="cbc:ID">
							<xsl:value-of select="concat(SerieRef, NumeroRef)"/>
						</xsl:element>
						<xsl:element name="cbc:UUID">
							<xsl:attribute name="schemeName">
								<xsl:choose>
									<xsl:when test="string-length(ECB01) = 40">
										<xsl:value-of select="'CUFE-SHA1'"/>
									</xsl:when>
									<xsl:when test="string-length(ECB01) = 64">
										<xsl:value-of select="'CUFE-SHA256'"/>
									</xsl:when>
									<xsl:when test="string-length(ECB01) = 96">
										<xsl:value-of select="'CUFE-SHA384'"/>
									</xsl:when>
									<xsl:when test="string-length(ECB01) = 128">
										<xsl:value-of select="'CUFE-SHA512'"/>
									</xsl:when>
									<xsl:otherwise/>
								</xsl:choose>
							</xsl:attribute>
							<xsl:value-of select="ECB01"/>
						</xsl:element>
						<xsl:element name="cbc:DocumentTypeCode">
							<xsl:value-of select="TpoDocRef"/>
						</xsl:element>
					</xsl:element>
				</xsl:if>-->
			</xsl:for-each>
			<xsl:for-each select="/DTE/Documento/Referencia">
				<!--REFERENCIA-->
				<xsl:choose>
					<xsl:when
						test="TpoDocRef != '01' and TpoDocRef != '02' and TpoDocRef != '03' and TpoDocRef != '04' and TpoDocRef != '07' and TpoDocRef != '08' and TpoDocRef != '91' and TpoDocRef != '92' and TpoDocRef != '09' and TpoDocRef != '20' and TpoDocRef != '100' and TpoDocRef != 'OC'">
						<!--Otro tipo de referencia-->
						<xsl:element name="cac:AdditionalDocumentReference">
							<xsl:element name="cbc:ID">
								<xsl:value-of select="NumeroRef"/>
							</xsl:element>
							<xsl:if test="FechaRef != ''">
								<xsl:element name="cbc:IssueDate">
									<xsl:value-of select="substring(FechaRef, 1, 10)"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cbc:DocumentTypeCode">
								<xsl:value-of select="TpoDocRef"/>
							</xsl:element>
							<xsl:variable name="DocRefDesc">
								<xsl:call-template name="TipoDocRef">
									<xsl:with-param name="TpoDocRef">
										<xsl:value-of select="TpoDocRef"/>
									</xsl:with-param>
								</xsl:call-template>
							</xsl:variable>
							<xsl:if test="$DocRefDesc != ''">
								<xsl:element name="cbc:DocumentType">
									<xsl:value-of select="$DocRefDesc"/>
								</xsl:element>
							</xsl:if>
						</xsl:element>
					</xsl:when>
				</xsl:choose>
			</xsl:for-each>
			<!--Pais Emisor en letras -->
			<xsl:variable name="PaisEmis">
				<xsl:call-template name="countryName">
					<xsl:with-param name="Pais"
						select="normalize-space(/DTE/Documento/Encabezado/Emisor/DomFiscal/Pais)"/>
				</xsl:call-template>
			</xsl:variable>
			<!--Issuer of the document-->
			<xsl:element name="cac:AccountingSupplierParty">
				<xsl:element name="cbc:AdditionalAccountID">
					<xsl:value-of select="/DTE/Documento/Encabezado/Emisor/TipoContribuyente"/>
				</xsl:element>
				<xsl:element name="cac:Party">
					<xsl:if
						test="/DTE/Documento/Encabezado/Emisor/CodigoEmisor/TpoCdgIntEmisor = 'CIIU'">
						<xsl:element name="cbc:IndustryClassificationCode">
							<xsl:value-of
								select="/DTE/Documento/Encabezado/Emisor/CodigoEmisor[TpoCdgIntEmisor = 'CIIU']/CdgIntEmisor"
							/>
						</xsl:element>
					</xsl:if>
					<xsl:if test="/DTE/Documento/Encabezado/IdDoc/PtoEmis !=''">
						<xsl:element name="cac:PartyName">
							<!--Nombre Tienda -->
							<xsl:element name="cbc:Name">
								<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/PtoEmis"/>
							</xsl:element>
						</xsl:element>
					</xsl:if>
					<xsl:if test="/DTE/Documento/Encabezado/IdDoc/Establecimiento !=''">
						<xsl:element name="cac:PartyName">
							<!--Establecimiento-->
							<xsl:element name="cbc:Name">
								<xsl:value-of
									select="/DTE/Documento/Encabezado/IdDoc/Establecimiento"/>
							</xsl:element>
						</xsl:element>
					</xsl:if>
					<xsl:element name="cac:PartyName">
						<!--Name of the Issuer-->
						<xsl:element name="cbc:Name">
							<xsl:value-of
								select="/DTE/Documento/Encabezado/Emisor/NombreEmisor/PrimerNombre"
							/>
						</xsl:element>
					</xsl:element>
					<!--Fiscal Address-->
					<xsl:element name="cac:PhysicalLocation">
						<xsl:element name="cac:Address">
							<xsl:element name="cbc:ID">
								<xsl:choose>
									<xsl:when test="(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo') or (/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturoGS')">
										<xsl:value-of select="/DTE/Documento/Encabezado/Emisor/LugarExped/CodigoPostal"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="/DTE/Documento/Encabezado/Emisor/LugarExped/Ciudad"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:element>
							<xsl:element name="cbc:CityName">
								<xsl:choose>
									<xsl:when test="(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo') or (/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturoGS')">
										<xsl:call-template name="cityName">
											<xsl:with-param name="Municipio"
												select="normalize-space(/DTE/Documento/Encabezado/Emisor/LugarExped/CodigoPostal)"
											/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="cityName">
											<xsl:with-param name="Municipio"
												select="normalize-space(/DTE/Documento/Encabezado/Emisor/LugarExped/Ciudad)"
											/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:element>
							<xsl:choose>
								<xsl:when test="/DTE/Documento/Encabezado/Emisor/LugarExped/CodigoPostal !='' and (not(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo') or not(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturoGS'))">
									<xsl:element name="cbc:PostalZone">
										<xsl:value-of select="/DTE/Documento/Encabezado/Emisor/LugarExped/CodigoPostal"/>
									</xsl:element>
								</xsl:when>
								<xsl:otherwise>
									<xsl:element name="cbc:PostalZone">
										<xsl:value-of select="/DTE/Documento/Encabezado/Emisor/LugarExped/GLN"/>
									</xsl:element>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:element name="cbc:CountrySubentity">
								<xsl:variable name="CountrySubentityNameS">
									<xsl:call-template name="countrySubentityName">
										<xsl:with-param name="Departamento"
											select="normalize-space(/DTE/Documento/Encabezado/Emisor/LugarExped/Departamento)"
										/>
									</xsl:call-template>
								</xsl:variable>
								<xsl:value-of select="$CountrySubentityNameS"/>
							</xsl:element>
							<xsl:element name="cbc:CountrySubentityCode">
								<xsl:value-of
									select="/DTE/Documento/Encabezado/Emisor/LugarExped/Departamento"
								/>
							</xsl:element>
							<xsl:element name="cac:AddressLine">
								<xsl:element name="cbc:Line">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Emisor/LugarExped/Calle"/>
								</xsl:element>
							</xsl:element>
							<xsl:element name="cac:Country">
								<xsl:element name="cbc:IdentificationCode">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Emisor/LugarExped/Pais"/>
								</xsl:element>
								<xsl:element name="cbc:Name">
									<xsl:attribute name="languageID">
								<xsl:text>es</xsl:text>
							</xsl:attribute>
									<xsl:value-of
										select="concat(substring($PaisEmis, 1, 1), translate(substring($PaisEmis, 2, 100), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'))"
									/>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:element>
					<!-- Identification of the Company -->
					<xsl:element name="cac:PartyTaxScheme">
						<xsl:element name="cbc:RegistrationName">
							<xsl:value-of select="/DTE/Documento/Encabezado/Emisor/NmbEmisor"/>
						</xsl:element>
						<xsl:element name="cbc:CompanyID">
							<xsl:attribute name="schemeID">
								<xsl:call-template name="calculNIT-dv">
									<xsl:with-param name="NIT"
										select="normalize-space(/DTE/Documento/Encabezado/Emisor/IDEmisor)"
									/>
								</xsl:call-template>
							</xsl:attribute>
							<xsl:attribute name="schemeName">
								<xsl:value-of select="'31'"/>
							</xsl:attribute>
							<xsl:attribute name="schemeAgencyID">
								<xsl:text>195</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="schemeAgencyName">
								<xsl:text>CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)</xsl:text>
							</xsl:attribute>
							<xsl:value-of
								select="normalize-space(/DTE/Documento/Encabezado/Emisor/IDEmisor)"
							/>
						</xsl:element>
						<xsl:element name="cbc:TaxLevelCode">
							<xsl:attribute name="listName">
								<xsl:value-of
									select="/DTE/Documento/Encabezado/Emisor/RegimenContable/text()"
								/>
							</xsl:attribute>
							<xsl:value-of
								select="/DTE/Documento/Encabezado/Emisor/CodigoEmisor[TpoCdgIntEmisor = 'TpoObl']/CdgIntEmisor/text()"
							/>
						</xsl:element>
						<xsl:element name="cac:RegistrationAddress">
							<xsl:element name="cbc:ID">
								<xsl:choose>
									<xsl:when test="(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo') or (/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturoGS')">
										<xsl:value-of select="/DTE/Documento/Encabezado/Emisor/DomFiscal/CodigoPostal"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="/DTE/Documento/Encabezado/Emisor/DomFiscal/Ciudad"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:element>
							<xsl:element name="cbc:CityName">
								<xsl:choose>
									<xsl:when test="(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo') or (/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturoGS')">
										<xsl:call-template name="cityName">
											<xsl:with-param name="Municipio"
												select="normalize-space(/DTE/Documento/Encabezado/Emisor/DomFiscal/CodigoPostal)"
											/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="cityName">
											<xsl:with-param name="Municipio"
												select="normalize-space(/DTE/Documento/Encabezado/Emisor/DomFiscal/Ciudad)"
											/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:element>
							<xsl:choose>
								<xsl:when test="/DTE/Documento/Encabezado/Emisor/DomFiscal/CodigoPostal !='' and (not(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo') or not(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturoGS'))">
									<xsl:element name="cbc:PostalZone">
										<xsl:value-of select="/DTE/Documento/Encabezado/Emisor/DomFiscal/CodigoPostal"/>
									</xsl:element>
								</xsl:when>
								<xsl:otherwise>
									<xsl:element name="cbc:PostalZone">
										<xsl:value-of select="/DTE/Documento/Encabezado/Emisor/DomFiscal/GLN"/>
									</xsl:element>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:element name="cbc:CountrySubentity">
								<xsl:variable name="CountrySubentityNameS">
									<xsl:call-template name="countrySubentityName">
										<xsl:with-param name="Departamento"
											select="normalize-space(/DTE/Documento/Encabezado/Emisor/DomFiscal/Departamento)"
										/>
									</xsl:call-template>
								</xsl:variable>
								<xsl:value-of select="$CountrySubentityNameS"/>
							</xsl:element>
							<xsl:element name="cbc:CountrySubentityCode">
								<xsl:value-of
									select="/DTE/Documento/Encabezado/Emisor/DomFiscal/Departamento"
								/>
							</xsl:element>
							<xsl:element name="cac:AddressLine">
								<xsl:element name="cbc:Line">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Emisor/DomFiscal/Calle"/>
								</xsl:element>
							</xsl:element>
							<xsl:element name="cac:Country">
								<xsl:element name="cbc:IdentificationCode">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Emisor/DomFiscal/Pais"/>
								</xsl:element>
								<xsl:element name="cbc:Name">
									<xsl:attribute name="languageID">
										<xsl:text>es</xsl:text>
									</xsl:attribute>
									<xsl:value-of
										select="concat(substring($PaisEmis, 1, 1), translate(substring($PaisEmis, 2, 100), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'))"
									/>
								</xsl:element>
							</xsl:element>
						</xsl:element>
						<xsl:element name="cac:TaxScheme">
							<xsl:element name="cbc:ID">
								<xsl:value-of select="'01'"/>
							</xsl:element>
							<xsl:element name="cbc:Name">
								<xsl:value-of select="'IVA'"/>
							</xsl:element>
						</xsl:element>
					</xsl:element>
					<xsl:element name="cac:PartyLegalEntity">
						<xsl:element name="cbc:RegistrationName">
							<xsl:value-of select="/DTE/Documento/Encabezado/Emisor/NmbEmisor"/>
						</xsl:element>
						<xsl:element name="cbc:CompanyID">
							<xsl:attribute name="schemeID">
								<xsl:call-template name="calculNIT-dv">
									<xsl:with-param name="NIT"
										select="normalize-space(/DTE/Documento/Encabezado/Emisor/IDEmisor)"
									/>
								</xsl:call-template>
							</xsl:attribute>
							<xsl:attribute name="schemeName">
								<xsl:value-of select="'31'"/>
							</xsl:attribute>
							<xsl:attribute name="schemeAgencyID">
								<xsl:text>195</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="schemeAgencyName">
								<xsl:text>CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)</xsl:text>
							</xsl:attribute>
							<xsl:value-of
								select="normalize-space(/DTE/Documento/Encabezado/Emisor/IDEmisor)"
							/>
						</xsl:element>
						<xsl:element name="cac:CorporateRegistrationScheme">
							<xsl:choose>
								<xsl:when test="/DTE/Documento/Encabezado/IdDoc/Serie != ''">
									<xsl:element name="cbc:ID">
										<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/Serie"
										/>
									</xsl:element>
								</xsl:when>
								<xsl:otherwise/>
							</xsl:choose>
							<xsl:if test="/DTE/Documento/Encabezado/Emisor/CdgSucursal != ''">
								<xsl:element name="cbc:Name">
									<xsl:value-of select="/DTE/Documento/Encabezado/Emisor/CdgSucursal"
									/>
								</xsl:element>
							</xsl:if>
						</xsl:element>
						<!-- Informacion de Participantes de un Consorcio -->
						<xsl:variable name="Consorcio"
							select="/DTE/Documento/Encabezado/Emisor/Consorcio"/>
						<xsl:for-each select="$Consorcio">
							<xsl:element name="cac:ShareholderParty">
								<xsl:element name="cbc:PartecipationPercent">
									<xsl:value-of select="Porcentaje"/>
								</xsl:element>
								<xsl:element name="cac:Party">
									<xsl:element name="cac:PartyTaxScheme">
										<xsl:element name="cbc:RegistrationName">
											<xsl:value-of select="Nombre"/>
										</xsl:element>
										<xsl:element name="cbc:CompanyID">
											<xsl:attribute name="schemeID">
												<xsl:call-template name="calculNIT-dv">
												<xsl:with-param name="NIT"
												select="normalize-space(NroDocCons)"/>
												</xsl:call-template>
											</xsl:attribute>
											<xsl:attribute name="schemeName">
												<xsl:value-of select="'31'"/>
											</xsl:attribute>
											<xsl:attribute name="schemeAgencyID">
												<xsl:text>195</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeAgencyName">
												<xsl:text>CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)</xsl:text>
											</xsl:attribute>
											<xsl:value-of select="normalize-space(NroDocCons)"/>
										</xsl:element>
										<xsl:element name="cbc:TaxLevelCode">
											<xsl:attribute name="listName">
												<xsl:value-of select="RegimenContable/text()"/>
											</xsl:attribute>
											<xsl:value-of
												select="CodigoEmisor[TpoCdgIntEmisor = 'TpoObl']/CdgIntEmisor/text()"
											/>
										</xsl:element>
										<xsl:element name="cac:TaxScheme">
											<xsl:element name="cbc:ID">
												<xsl:value-of select="'01'"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:value-of select="'IVA'"/>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
					<!-- Contact of the Sender (Phone & email) -->
					
						<xsl:element name="cac:Contact">
							<xsl:if test="/DTE/Documento/Encabezado/Emisor/ContactoEmisor/Nombre">
								<xsl:element name="cbc:Name">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Emisor/ContactoEmisor/Nombre"
									/>
								</xsl:element>
							</xsl:if>
							<xsl:if test="/DTE/Documento/Encabezado/Emisor/ContactoEmisor/Telefono">
								<xsl:element name="cbc:Telephone">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Emisor/ContactoEmisor/Telefono"
									/>
								</xsl:element>
							</xsl:if>
							<xsl:if test="/DTE/Documento/Encabezado/Emisor/ContactoEmisor/Fax">
								<xsl:element name="cbc:Telefax">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Emisor/ContactoEmisor/Fax"
									/>
								</xsl:element>
							</xsl:if>
								<xsl:element name="cbc:ElectronicMail">
									<xsl:value-of
										select="if(/DTE/Documento/Encabezado/Emisor/ContactoEmisor/eMail !='') then /DTE/Documento/Encabezado/Emisor/ContactoEmisor/eMail else 'col_intercambio@einvoicing.signature-cloud.com' "/>
								</xsl:element>
							
							<xsl:if
								test="/DTE/Documento/Encabezado/Emisor/ContactoEmisor/Descripcion">
								<xsl:element name="cbc:Note">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Emisor/ContactoEmisor/Descripcion"
									/>
								</xsl:element>
							</xsl:if>
							<xsl:if
								test="/DTE/Documento/Encabezado/Emisor/ContactoEmisor[Tipo = 'Distrib']/eMail">
								<xsl:element name="cac:OtherCommunication">
									<xsl:element name="cbc:Channel">
										<xsl:text>email</xsl:text>
									</xsl:element>
									<xsl:element name="cbc:Value">
										<xsl:value-of
											select="/DTE/Documento/Encabezado/Emisor/ContactoEmisor[Tipo = 'Distrib']/eMail"
										/>
									</xsl:element>
								</xsl:element>
							</xsl:if>
						</xsl:element>
					
				</xsl:element>
			</xsl:element>
			<!--Pais Receptor en letras-->
			<xsl:variable name="PaisRecep">
				<xsl:call-template name="countryName">
					<xsl:with-param name="Pais"
						select="normalize-space(/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/Pais)"
					/>
				</xsl:call-template>
			</xsl:variable>
			<!--Receiver of the document-->
			<xsl:element name="cac:AccountingCustomerParty">
				<xsl:element name="cbc:SupplierAssignedAccountID">
					<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/CdgGLNRecep"/>
				</xsl:element>
				<xsl:element name="cbc:AdditionalAccountID">
					<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/TipoContribuyenteR"/>
				</xsl:element>
				<xsl:element name="cac:Party">
					<xsl:if test="/DTE/Documento/Encabezado/Receptor/TipoContribuyenteR = '2'">
						<xsl:element name="cac:PartyIdentification">
							<xsl:element name="cbc:ID">
								<xsl:choose>
									<xsl:when test="/DTE/Documento/Encabezado/Receptor/DocRecep/TipoDocRecep = '31'">
										<xsl:attribute name="schemeID">
											<xsl:call-template name="calculNIT-dv">
												<xsl:with-param name="NIT"
													select="normalize-space(/DTE/Documento/Encabezado/Receptor/DocRecep/NroDocRecep)"
												/>
											</xsl:call-template>
										</xsl:attribute>
									</xsl:when>
									<xsl:otherwise/>
								</xsl:choose>
								<xsl:attribute name="schemeName">
									<xsl:value-of
										select="normalize-space(/DTE/Documento/Encabezado/Receptor/DocRecep/TipoDocRecep)"
									/>
								</xsl:attribute>
								<xsl:value-of select="normalize-space(/DTE/Documento/Encabezado/Receptor/DocRecep/NroDocRecep)"/>
							</xsl:element>
						</xsl:element>
					</xsl:if>
					<!--Receiver Name-->
					<!--<xsl:if test="/DTE/Documento/Encabezado/Receptor/TipoContribuyenteR != '2'">-->
						<xsl:element name="cac:PartyName">
							<xsl:element name="cbc:Name">
								<xsl:value-of
									select="/DTE/Documento/Encabezado/Receptor/NombreRecep/PrimerNombre"
								/>
							</xsl:element>
						</xsl:element>
					<!--</xsl:if>-->
					<!-- Expedition Address -->
					<xsl:if test="/DTE/Documento/Encabezado/Receptor/LugarRecep">
						<xsl:element name="cac:PhysicalLocation">
							<xsl:element name="cac:Address">
								<xsl:choose>
									<xsl:when test="/DTE/Documento/Encabezado/IdDoc/Tipo != '02'">
										<xsl:element name="cbc:ID">
											<xsl:choose>
												<xsl:when test="(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo') or (/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturoGS')">
													<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/LugarRecep/CodigoPostal"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Ciudad"/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:element>
										<xsl:element name="cbc:CityName">
											<xsl:choose>
												<xsl:when test="(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo') or (/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturoGS')">
													<xsl:call-template name="cityName">
														<xsl:with-param name="Municipio"
															select="normalize-space(/DTE/Documento/Encabezado/Receptor/LugarRecep/CodigoPostal)"
														/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="cityName">
														<xsl:with-param name="Municipio"
															select="normalize-space(/DTE/Documento/Encabezado/Receptor/LugarRecep/Ciudad)"
														/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:element>
										<xsl:choose>
											<xsl:when test="/DTE/Documento/Encabezado/Receptor/LugarRecep/CodigoPostal !='' and (not(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo') or not(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturoGS'))">
												<xsl:element name="cbc:PostalZone">
													<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/LugarRecep/CodigoPostal"/>
												</xsl:element>
											</xsl:when>
											<xsl:otherwise>
												<xsl:element name="cbc:PostalZone">
													<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/LugarRecep/GLN"/>
												</xsl:element>
											</xsl:otherwise>
										</xsl:choose>
										<xsl:element name="cbc:CountrySubentity">
											<xsl:variable name="CountrySubentityNameS">
												<xsl:call-template name="countrySubentityName">
													<xsl:with-param name="Departamento"
														select="normalize-space(/DTE/Documento/Encabezado/Receptor/LugarRecep/Departamento)"
													/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:value-of select="$CountrySubentityNameS"/>
										</xsl:element>
										<xsl:element name="cbc:CountrySubentityCode">
											<xsl:value-of
												select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Departamento"
											/>
										</xsl:element>
										<xsl:element name="cac:AddressLine">
											<xsl:element name="cbc:Line">
												<xsl:value-of
													select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Calle"/>
											</xsl:element>
										</xsl:element>
										<xsl:element name="cac:Country">
											<xsl:element name="cbc:IdentificationCode">
												<xsl:value-of
													select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Pais"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:attribute name="languageID">
													<xsl:text>es</xsl:text>
												</xsl:attribute>
												<xsl:value-of
													select="concat(substring($PaisRecep, 1, 1), translate(substring($PaisRecep, 2, 100), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'))"
												/>
											</xsl:element>
										</xsl:element>
									</xsl:when>
									<xsl:otherwise>
										<xsl:if
											test="/DTE/Documento/Encabezado/Receptor/LugarRecep/Departamento != ''">
											<xsl:element name="cbc:Department">
												<xsl:value-of
												select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Departamento"
												/>
											</xsl:element>
										</xsl:if>
										<xsl:if
											test="/DTE/Documento/Encabezado/Receptor/LugarRecep/Ciudad != ''">
											<xsl:element name="cbc:CityName">
												<xsl:value-of
												select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Ciudad"
												/>
											</xsl:element>
										</xsl:if>
										<xsl:if test="/DTE/Documento/Encabezado/Receptor/LugarRecep/CodigoPostal != ''">
											<xsl:element name="cbc:PostalZone">
												<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/LugarRecep/CodigoPostal"/>
											</xsl:element>
										</xsl:if>
										<xsl:if
											test="/DTE/Documento/Encabezado/Receptor/LugarRecep/Distrito != ''">
											<xsl:element name="cbc:CountrySubentity">
												<xsl:value-of
												select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Distrito"
												/>
											</xsl:element>
										</xsl:if>
										<xsl:element name="cac:AddressLine">
											<xsl:element name="cbc:Line">
												<xsl:value-of
													select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Calle"/>
											</xsl:element>
										</xsl:element>
										<xsl:element name="cac:Country">
											<xsl:element name="cbc:IdentificationCode">
												<xsl:value-of
													select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Pais"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:attribute name="languageID">
													<xsl:text>es</xsl:text>
												</xsl:attribute>
												<xsl:value-of
													select="concat(substring($PaisRecep, 1, 1), translate(substring($PaisRecep, 2, 100), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'))"
												/>
											</xsl:element>
										</xsl:element>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:element>
						</xsl:element>
					</xsl:if>
					<!-- Identification of the Company -->
					<!--<xsl:if test="/DTE/Documento/Encabezado/Receptor/TipoContribuyenteR != '2'">-->
						<xsl:element name="cac:PartyTaxScheme">
							<xsl:element name="cbc:RegistrationName">
								<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/NmbRecep"/>
							</xsl:element>
							<xsl:element name="cbc:CompanyID">
								<xsl:choose>
									<xsl:when test="/DTE/Documento/Encabezado/Receptor/DocRecep/TipoDocRecep = '31'">
										<xsl:attribute name="schemeID">
												<xsl:call-template name="calculNIT-dv">
													<xsl:with-param name="NIT"
														select="normalize-space(/DTE/Documento/Encabezado/Receptor/DocRecep/NroDocRecep)"
													/>
												</xsl:call-template>
											</xsl:attribute>
										</xsl:when>
										<xsl:otherwise/>
									</xsl:choose>
								<xsl:attribute name="schemeName">
									<xsl:value-of
										select="normalize-space(/DTE/Documento/Encabezado/Receptor/DocRecep/TipoDocRecep)"
									/>
								</xsl:attribute>
								<xsl:attribute name="schemeAgencyID">
									<xsl:text>195</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="schemeAgencyName">
									<xsl:text>CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)</xsl:text>
								</xsl:attribute>
								<xsl:value-of
									select="normalize-space(/DTE/Documento/Encabezado/Receptor/DocRecep/NroDocRecep)"
								/>
							</xsl:element>
							<xsl:element name="cbc:TaxLevelCode">
								<xsl:attribute name="listName">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Receptor/RegimenContableR"
									/>
								</xsl:attribute>
								<xsl:value-of
									select="/DTE/Documento/Encabezado/Receptor/CodigoReceptor[TpoCdgIntRecep = 'TpoObl']/CdgIntRecep/text()"
								/>
							</xsl:element>
							<xsl:if test="/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/Calle !=''"> 
								<xsl:element name="cac:RegistrationAddress">
									<xsl:choose>
										<xsl:when test="(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo') or (/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturoGS')">
											<xsl:element name="cbc:ID">
												<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/CodigoPostal"/>
											</xsl:element>
										</xsl:when>
										<xsl:otherwise>
											<!--<xsl:if test="/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/Ciudad !=''">-->
											<xsl:element name="cbc:ID">
												<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/Ciudad"/>
											</xsl:element>
											<!--</xsl:if>-->
										</xsl:otherwise>
									</xsl:choose>
									
									<xsl:choose>
										<xsl:when test="(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo') or (/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturoGS')">
											<xsl:call-template name="cityName">
												<xsl:with-param name="Municipio"
													select="normalize-space(/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/CodigoPostal)"
												/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<!--<xsl:if test="/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/Ciudad !=''">-->
											<xsl:element name="cbc:CityName">
												<xsl:call-template name="cityName">
													<xsl:with-param name="Municipio"
														select="normalize-space(/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/Ciudad)"/>
												</xsl:call-template>
											</xsl:element>
											<!--</xsl:if>-->
										</xsl:otherwise>
									</xsl:choose>
									
									<xsl:choose>
										<xsl:when test="/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/CodigoPostal !='' and (not(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo') or not(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturoGS'))">
											<xsl:element name="cbc:PostalZone">
												<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/CodigoPostal"/>
											</xsl:element>
										</xsl:when>
										<xsl:otherwise>
											<xsl:if test="/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/GLN !=''">
												<xsl:element name="cbc:PostalZone">
													<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/GLN"/>
												</xsl:element>
											</xsl:if>
										</xsl:otherwise>
									</xsl:choose>
									<!--<xsl:if test="/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/Departamento !=''">-->
									<xsl:element name="cbc:CountrySubentity">
										<xsl:variable name="CountrySubentityNameS">
											<xsl:call-template name="countrySubentityName">
												<xsl:with-param name="Departamento"
													select="normalize-space(/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/Departamento)"
												/>
											</xsl:call-template>
										</xsl:variable>
										<xsl:value-of select="$CountrySubentityNameS"/>
									</xsl:element>
									<xsl:element name="cbc:CountrySubentityCode">
										<xsl:value-of
											select="/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/Departamento"/>
									</xsl:element>
									<!--</xsl:if>-->
									<!--<xsl:if test="/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/Calle !=''">-->
									<xsl:element name="cac:AddressLine">
										<xsl:element name="cbc:Line">
											<xsl:value-of
												select="/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/Calle"/>
										</xsl:element>
									</xsl:element>
									<!--</xsl:if>-->
									<!--<xsl:if test="/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/Pais !=''">-->
									<xsl:element name="cac:Country">
										<xsl:element name="cbc:IdentificationCode">
											<xsl:value-of
												select="/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/Pais"/>
										</xsl:element>
										<xsl:element name="cbc:Name">
											<xsl:attribute name="languageID">
												<xsl:text>es</xsl:text>
											</xsl:attribute>
											<xsl:value-of
												select="concat(substring($PaisRecep, 1, 1), translate(substring($PaisRecep, 2, 100), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'))"/>
										</xsl:element>
									</xsl:element>
									<!--</xsl:if>-->
								</xsl:element>
							</xsl:if>
							<xsl:if test="/DTE/Documento/Encabezado/Receptor/DocRecep/NroDocRecep != '222222222222'">
								<xsl:element name="cac:TaxScheme">
									<xsl:element name="cbc:ID">
										<xsl:value-of select="'01'"/>
									</xsl:element>
									<xsl:element name="cbc:Name">
										<xsl:value-of select="'IVA'"/>
									</xsl:element>
								</xsl:element>
							</xsl:if>
							<xsl:if test="/DTE/Documento/Encabezado/Receptor/DocRecep/NroDocRecep = '222222222222'">
								<xsl:element name="cac:TaxScheme">
									<xsl:element name="cbc:ID">
										<xsl:value-of select="'ZZ'"/>
									</xsl:element>
									<xsl:element name="cbc:Name"/>
								</xsl:element>
							</xsl:if>
						</xsl:element>
						<xsl:element name="cac:PartyLegalEntity">
							<xsl:element name="cbc:RegistrationName">
								<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/NmbRecep"/>
							</xsl:element>
							<xsl:element name="cbc:CompanyID">
								<xsl:choose>
									<xsl:when test="/DTE/Documento/Encabezado/Receptor/DocRecep/TipoDocRecep = '31'">
										<xsl:attribute name="schemeID">
											<xsl:call-template name="calculNIT-dv">
												<xsl:with-param name="NIT"
													select="normalize-space(/DTE/Documento/Encabezado/Receptor/DocRecep/NroDocRecep)"
												/>
											</xsl:call-template>
										</xsl:attribute>
									</xsl:when>
									<xsl:otherwise/>
								</xsl:choose>
								<xsl:attribute name="schemeName">
									<xsl:value-of
										select="normalize-space(/DTE/Documento/Encabezado/Receptor/DocRecep/TipoDocRecep)"
									/>
								</xsl:attribute>
								<xsl:attribute name="schemeAgencyID">
									<xsl:text>195</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="schemeAgencyName">
									<xsl:text>CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)</xsl:text>
								</xsl:attribute>
								<xsl:value-of
									select="normalize-space(/DTE/Documento/Encabezado/Receptor/DocRecep/NroDocRecep)"
								/>
							</xsl:element>
							<xsl:if test="/DTE/Documento/Encabezado/Receptor/CdgSucursal != ''">
								<xsl:element name="cac:CorporateRegistrationScheme">
									<xsl:element name="cbc:Name">
										<xsl:value-of
											select="/DTE/Documento/Encabezado/Receptor/CdgSucursal"/>
									</xsl:element>
								</xsl:element>
							</xsl:if>
						</xsl:element>
					<!--</xsl:if>-->
					<!-- Contact of the receiver -->
					<xsl:if test="/DTE/Documento/Encabezado/Receptor/ContactoReceptor/eMail">
						<xsl:element name="cac:Contact">
							<xsl:if
								test="/DTE/Documento/Encabezado/Receptor/ContactoReceptor/Nombre">
								<xsl:element name="cbc:Name">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Receptor/ContactoReceptor/Nombre"
									/>
								</xsl:element>
							</xsl:if>
							<xsl:if
								test="/DTE/Documento/Encabezado/Receptor/ContactoReceptor/Telefono">
								<xsl:element name="cbc:Telephone">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Receptor/ContactoReceptor/Telefono"
									/>
								</xsl:element>
							</xsl:if>
							<xsl:if test="/DTE/Documento/Encabezado/Receptor/ContactoReceptor/Fax">
								<xsl:element name="cbc:Telefax">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Receptor/ContactoReceptor/Fax"
									/>
								</xsl:element>
							</xsl:if>
							<xsl:if test="/DTE/Documento/Encabezado/Receptor/ContactoReceptor/eMail">
								<xsl:element name="cbc:ElectronicMail">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Receptor/ContactoReceptor/eMail"
									/>
								</xsl:element>
							</xsl:if>
							<xsl:if
								test="/DTE/Documento/Encabezado/Receptor/ContactoReceptor/Descripcion">
								<xsl:element name="cbc:Note">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Receptor/ContactoReceptor/Descripcion"
									/>
								</xsl:element>
							</xsl:if>
							<xsl:if
								test="/DTE/Documento/Encabezado/Receptor/ContactoReceptor[Tipo = 'Distrib']/eMail">
								<xsl:element name="cac:OtherCommunication">
									<xsl:element name="cbc:Channel">
										<xsl:text>email</xsl:text>
									</xsl:element>
									<xsl:element name="cbc:Value">
										<xsl:value-of
											select="/DTE/Documento/Encabezado/Receptor/ContactoReceptor[Tipo = 'Distrib']/eMail"
										/>
									</xsl:element>
								</xsl:element>
							</xsl:if>
						</xsl:element>
					</xsl:if>
					<xsl:if test="/DTE/Documento/Encabezado/Receptor/TipoContribuyenteR = '2'">
						<xsl:element name="cac:Person">
							<xsl:element name="cbc:FirstName">
								<xsl:value-of
									select="/DTE/Documento/Encabezado/Receptor/NombreRecep/PrimerNombre"
								/>
							</xsl:element>
							<xsl:if
								test="/DTE/Documento/Encabezado/Receptor/NombreRecep/PrimerApellido">
								<xsl:element name="cbc:FamilyName">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Receptor/NombreRecep/PrimerApellido"
									/>
								</xsl:element>
							</xsl:if>
							<xsl:if
								test="/DTE/Documento/Encabezado/Receptor/NombreRecep/OtrosNombres">
								<xsl:element name="cbc:MiddleName">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Receptor/NombreRecep/OtrosNombres"
									/>
								</xsl:element>
							</xsl:if>
						</xsl:element>
					</xsl:if>
				</xsl:element>
			</xsl:element>
			<!--Persona autorizada para la descarga FALTA MAPEAR VALORES EN DTE-->
			<xsl:if test="//CodigoEmisor/TpoCdgIntEmisor = 'DescargaNIT'">
				<xsl:element name="cac:TaxRepresentativeParty">
					<xsl:element name="cac:PartyIdentification">
						<xsl:element name="cbc:ID">
							<xsl:attribute name="schemeAgencyID">
								<xsl:text>195</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="schemeAgencyName">
								<xsl:text>CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="schemeName">
								<xsl:value-of select="//CodigoEmisor[TpoCdgIntEmisor = 'DescargaType']/CdgIntEmisor"/>
							</xsl:attribute>
							<xsl:choose>
								<xsl:when test="//CodigoEmisor[TpoCdgIntEmisor = 'DescargaType']/CdgIntEmisor = '31'">
									<xsl:attribute name="schemeID">
										<xsl:call-template name="calculNIT-dv">
											<xsl:with-param name="NIT"
												select="normalize-space(//CodigoEmisor[TpoCdgIntEmisor = 'DescargaNIT']/CdgIntEmisor)"
											/>
										</xsl:call-template>
									</xsl:attribute>
								</xsl:when>
								<xsl:otherwise/>
							</xsl:choose>
							<xsl:value-of select="normalize-space(//CodigoEmisor[TpoCdgIntEmisor = 'DescargaNIT']/CdgIntEmisor)"/>
						</xsl:element>
					</xsl:element>
					<xsl:if test="//CodigoEmisor/TpoCdgIntEmisor = 'DescargaName'">
						<xsl:element name="cac:PartyName">
							<xsl:element name="cbc:Name">
								<xsl:value-of select="''"/>
							</xsl:element>
						</xsl:element>
					</xsl:if>
				</xsl:element>
			</xsl:if>
			<!--Pais Delivery en letras-->
			<xsl:variable name="PaisLugarRecep">
				<xsl:call-template name="countryName">
					<xsl:with-param name="Pais"
						select="normalize-space(/DTE/Documento/Encabezado/Receptor/LugarRecep/Pais)"
					/>
				</xsl:call-template>
			</xsl:variable>
			<!-- Delivery -->
			<xsl:if test="DTE/Documento/Encabezado/Receptor/LugarRecep">
				<xsl:element name="cac:Delivery">
					<xsl:choose>
						<xsl:when test="/DTE/Documento/Encabezado/IdDoc/FechaCancel != ''">
							<xsl:element name="cbc:ActualDeliveryDate">
								<xsl:value-of select="substring(/DTE/Documento/Encabezado/IdDoc/FechaCancel, 1, 10)"/>
							</xsl:element>
							<!--<xsl:element name="cbc:ActualDeliveryTime">
							<xsl:value-of select="substring(/DTE/Documento/Encabezado/Traslado/PeriodoDesde, 12, 8)"/>
							</xsl:element>-->
						</xsl:when>
						<xsl:otherwise>
							<xsl:element name="cbc:ActualDeliveryDate">
								<xsl:value-of
									select="substring(/DTE/Documento/Encabezado/IdDoc/FechaEmis, 1, 10)"/>
							</xsl:element>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:element name="cac:DeliveryAddress">
						<xsl:element name="cbc:ID">
							<xsl:value-of
								select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Ciudad"
							/>
						</xsl:element>
						<xsl:element name="cbc:CityName">
							<xsl:call-template name="cityName">
								<xsl:with-param name="Municipio"
									select="normalize-space(/DTE/Documento/Encabezado/Receptor/LugarRecep/Ciudad)"
								/>
							</xsl:call-template>
						</xsl:element>
						<xsl:if test="/DTE/Documento/Encabezado/Receptor/LugarRecep/CodigoPostal != ''">
							<xsl:element name="cbc:PostalZone">
								<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/LugarRecep/CodigoPostal"/>
							</xsl:element>
						</xsl:if>
						<xsl:element name="cbc:CountrySubentity">
							<xsl:call-template name="cityName">
								<xsl:with-param name="Municipio"
									select="normalize-space(/DTE/Documento/Encabezado/Receptor/LugarRecep/Ciudad)"
								/>
							</xsl:call-template>
							<xsl:value-of
								select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Departamento"
							/>
						</xsl:element>
						<xsl:element name="cbc:CountrySubentityCode">
							<xsl:value-of
								select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Departamento"
							/>
						</xsl:element>
						<xsl:element name="cac:AddressLine">
							<xsl:element name="cbc:Line">
								<xsl:value-of
									select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Calle"/>
							</xsl:element>
						</xsl:element>
						<xsl:element name="cac:Country">
							<xsl:element name="cbc:IdentificationCode">
								<xsl:value-of
									select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Pais"/>
							</xsl:element>
							<xsl:element name="cbc:Name">
								<xsl:attribute name="languageID">
									<xsl:text>es</xsl:text>
								</xsl:attribute>
								<xsl:value-of
									select="concat(substring($PaisLugarRecep, 1, 1), lower-case(substring($PaisLugarRecep, 2, 100)))"
								/>
							</xsl:element>
						</xsl:element>
					</xsl:element>
					<xsl:if test="/DTE/Documento/Encabezado/Transporte/NmbTransp">
						<xsl:element name="cac:DeliveryParty">
							<xsl:element name="cac:PartyName">
								<xsl:element name="cbc:Name">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Transporte/NmbTransp"/>
								</xsl:element>
							</xsl:element>
							<xsl:element name="cac:PhysicalLocation">
								<xsl:element name="cac:Address">
									<xsl:element name="cbc:ID">
										<xsl:value-of
											select="/DTE/Documento/Encabezado/Transporte/DomFiscalTransp/Ciudad"
										/>
									</xsl:element>
									<xsl:element name="cbc:CityName">
										<xsl:call-template name="cityName">
											<xsl:with-param name="Municipio"
												select="normalize-space(/DTE/Documento/Encabezado/Transporte/DomFiscalTransp/Ciudad)"
											/>
										</xsl:call-template>
									</xsl:element>
									<xsl:if test="/DTE/Documento/Encabezado/Transporte/DomFiscalTransp/CodigoPostal != ''">
										<xsl:element name="cbc:PostalZone">
											<xsl:value-of select="/DTE/Documento/Encabezado/Transporte/DomFiscalTransp/CodigoPostal"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cbc:CountrySubentity">
										<xsl:call-template name="countrySubentityName">
											<xsl:with-param name="Departamento"
												select="normalize-space(/DTE/Documento/Encabezado/Transporte/DomFiscalTransp/Departamento)"
											/>
										</xsl:call-template>
									</xsl:element>
									<xsl:element name="cbc:CountrySubentityCode">
										<xsl:value-of
											select="/DTE/Documento/Encabezado/Transporte/DomFiscalTransp/Departamento"
										/>
									</xsl:element>
									<xsl:element name="cac:AddressLine">
										<xsl:element name="cbc:Line">
											<xsl:value-of
												select="/DTE/Documento/Encabezado/Transporte/DomFiscalTransp/Calle"
											/>
										</xsl:element>
									</xsl:element>
									<xsl:element name="cac:Country">
										<xsl:element name="cbc:IdentificationCode">
											<xsl:value-of
												select="/DTE/Documento/Encabezado/Transporte/DomFiscalTransp/Pais"
											/>
										</xsl:element>
										<xsl:element name="cbc:Name">
											<xsl:attribute name="languageID">
												<xsl:text>es</xsl:text>
											</xsl:attribute>
											<xsl:value-of
												select="concat(substring($PaisLugarRecep, 1, 1), lower-case(substring($PaisLugarRecep, 2, 100)))"
											/>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:element>
							<xsl:element name="cac:PartyTaxScheme">
								<xsl:element name="cbc:RegistrationName">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Transporte/NmbTransp"/>
								</xsl:element>
								<xsl:element name="cbc:CompanyID">
									<xsl:attribute name="schemeID">
										<xsl:call-template name="calculNIT-dv">
											<xsl:with-param name="NIT"
												select="normalize-space(/DTE/Documento/Encabezado/Transporte/DocTransp/NroDocTransp)"
											/>
										</xsl:call-template>
									</xsl:attribute>
									<xsl:attribute name="schemeName">
										<xsl:value-of
											select="/DTE/Documento/Encabezado/Transporte/DocTransp/TipoDocTransp"
										/>
									</xsl:attribute>
									<xsl:attribute name="schemeAgencyName">
										<xsl:text>CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)</xsl:text>
									</xsl:attribute>
									<xsl:attribute name="schemeAgencyID">
										<xsl:text>195</xsl:text>
									</xsl:attribute>
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Transporte/DocTransp/NroDocTransp"
									/>
								</xsl:element>
								<xsl:element name="cbc:TaxLevelCode">
									<xsl:attribute name="listName">
										<xsl:value-of
											select="/DTE/Documento/Encabezado/Transporte/CodigoTransp[TpoCdgIntTransp = 'TpoReg']/CdgIntTransp/text()"
										/>
									</xsl:attribute>
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Transporte/CodigoTransp[TpoCdgIntTransp = 'TpoObl']/CdgIntTransp/text()"
									/>
								</xsl:element>
								<xsl:element name="cac:TaxScheme">
									<xsl:element name="cbc:ID">
										<xsl:text>01</xsl:text>
									</xsl:element>
									<xsl:element name="cbc:Name">
										<xsl:text>IVA</xsl:text>
									</xsl:element>
								</xsl:element>
							</xsl:element>
							<xsl:element name="cac:PartyLegalEntity">
								<xsl:element name="cbc:RegistrationName">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Transporte/NmbTransp"/>
								</xsl:element>
								<xsl:element name="cbc:CompanyID">
									<xsl:attribute name="schemeID">
										<xsl:call-template name="calculNIT-dv">
											<xsl:with-param name="NIT"
												select="normalize-space(/DTE/Documento/Encabezado/Transporte/DocTransp/NroDocTransp)"
											/>
										</xsl:call-template>
									</xsl:attribute>
									<xsl:attribute name="schemeName">
										<xsl:value-of
											select="/DTE/Documento/Encabezado/Transporte/DocTransp/TipoDocTransp"
										/>
									</xsl:attribute>
									<xsl:attribute name="schemeAgencyName">
										<xsl:text>CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)</xsl:text>
									</xsl:attribute>
									<xsl:attribute name="schemeAgencyID">
										<xsl:text>195</xsl:text>
									</xsl:attribute>
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Transporte/DocTransp/NroDocTransp"
									/>
								</xsl:element>
								<xsl:element name="cac:CorporateRegistrationScheme">
									<xsl:element name="cbc:Name">
										<xsl:value-of
											select="/DTE/Documento/Encabezado/Transporte/CodigoTransp[TpoCdgIntTransp = 'MatMerc']/CdgIntTransp/text()"
										/>
									</xsl:element>
								</xsl:element>
							</xsl:element>
							<!-- Contact of the transportista -->
							<xsl:if test="/DTE/Documento/Encabezado/Transporte/ContactoTransp">
								<xsl:element name="cac:Contact">
									<xsl:if
										test="/DTE/Documento/Encabezado/Transporte/ContactoTransp/Nombre">
										<xsl:element name="cbc:Name">
											<xsl:value-of
												select="/DTE/Documento/Encabezado/Transporte/ContactoTransp/Nombre"
											/>
										</xsl:element>
									</xsl:if>
									<xsl:if
										test="/DTE/Documento/Encabezado/Transporte/ContactoTransp/Telefono">
										<xsl:element name="cbc:Telephone">
											<xsl:value-of
												select="/DTE/Documento/Encabezado/Transporte/ContactoTransp/Telefono"
											/>
										</xsl:element>
									</xsl:if>
									<xsl:if
										test="/DTE/Documento/Encabezado/Transporte/ContactoTransp/Fax">
										<xsl:element name="cbc:Telefax">
											<xsl:value-of
												select="/DTE/Documento/Encabezado/Transporte/ContactoTransp/Fax"
											/>
										</xsl:element>
									</xsl:if>
									<xsl:if
										test="/DTE/Documento/Encabezado/Transporte/ContactoTransp/eMail">
										<xsl:element name="cbc:ElectronicMail">
											<xsl:value-of
												select="/DTE/Documento/Encabezado/Transporte/ContactoTransp/eMail"
											/>
										</xsl:element>
									</xsl:if>
									<xsl:if
										test="/DTE/Documento/Encabezado/Transporte/ContactoTransp/Descripcion">
										<xsl:element name="cbc:Note">
											<xsl:value-of
												select="/DTE/Documento/Encabezado/Transporte/ContactoTransp/Descripcion"
											/>
										</xsl:element>
									</xsl:if>
									<xsl:if
										test="/DTE/Documento/Encabezado/Transporte/ContactoTransp[Tipo = 'Distrib']/eMail">
										<xsl:element name="cac:OtherCommunication">
											<xsl:element name="cbc:Channel">
												<xsl:text>email</xsl:text>
											</xsl:element>
											<xsl:element name="cbc:Value">
												<xsl:value-of
												select="/DTE/Documento/Encabezado/Transporte/ContactoTransp[Tipo = 'Distrib']/eMail"
												/>
											</xsl:element>
										</xsl:element>
									</xsl:if>
								</xsl:element>
							</xsl:if>
						</xsl:element>
					</xsl:if>
				</xsl:element>
			</xsl:if>
			<!-- Delivery Terms -->
			<xsl:if test="DTE/Documento/Encabezado/IdDoc/Incoterms">
				<xsl:element name="cac:DeliveryTerms">
					<xsl:if test="DTE/Documento/Encabezado/IdDoc/TermPagoCdg">
						<xsl:element name="cbc:SpecialTerms">
							<xsl:value-of select="DTE/Documento/Encabezado/IdDoc/TermPagoCdg"/>
						</xsl:element>
					</xsl:if>
					<xsl:element name="cbc:LossRiskResponsibilityCode">
						<xsl:value-of select="DTE/Documento/Encabezado/IdDoc/Incoterms/CodIncoterms"
						/>
					</xsl:element>
					<xsl:element name="cbc:LossRisk">
						<xsl:value-of select="DTE/Documento/Encabezado/IdDoc/Incoterms/IncotermDs"/>
					</xsl:element>
				</xsl:element>
			</xsl:if>
			<!-- Payment Means -->
			<xsl:if test="/DTE/Documento/Encabezado/IdDoc/MedioPago">
				<xsl:element name="cac:PaymentMeans">
					<xsl:element name="cbc:ID">
						<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/TipoNegociacion"/>
					</xsl:element>
					<xsl:element name="cbc:PaymentMeansCode">
						<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/MedioPago"/>
					</xsl:element>
					<xsl:if test="/DTE/Documento/Encabezado/IdDoc/FechaVenc">
						<xsl:element name="cbc:PaymentDueDate">
							<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/FechaVenc"/>
						</xsl:element>
					</xsl:if>
					<xsl:if test="/DTE/Documento/Encabezado/IdDoc/IDPago != ''">
						<xsl:element name="cbc:PaymentID">
							<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/IDPago"/>
						</xsl:element>
					</xsl:if>
				</xsl:element>
			</xsl:if>
			<!--Terminos de Pago DIAN MYPE -->
			<!--<xsl:variable name="TipoNegociacion"
				select="/DTE/Documento/Encabezado/IdDoc/TipoNegociacion"/>
			<xsl:variable name="Plazo" select="/DTE/Documento/Encabezado/IdDoc/Plazo"/>
			<xsl:choose>
				<xsl:when test="$TipoNegociacion != '' and $Plazo != ''">
					<xsl:element name="cac:PaymentTerms">
						<xsl:element name="cbc:ReferenceEventCode">
							<xsl:value-of select="$TipoNegociacion"/>
							<!-\- Codigo Medio Pago -\->
						</xsl:element>
						<xsl:element name="cac:SettlementPeriod">
							<xsl:element name="cbc:DurationMeasure">
								<xsl:attribute name="unitCode">
									<xsl:text>DAY</xsl:text>
								</xsl:attribute>
								<xsl:value-of select="$Plazo"/>
								<!-\- Plazo de Pago expresado en dias -\->
							</xsl:element>
						</xsl:element>
					</xsl:element>
				</xsl:when>
			</xsl:choose>-->
			<!-- Prepaid Payment -->
			<!--<xsl:if test="//*[local-name() = 'PrepaidPayment']/*[local-name() = 'PaidAmount']">
				<xsl:element name="cac:PrepaidPayment">
					<xsl:element name="cbc:ID"/>
					<xsl:element name="cbc:PaidAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of
							select="//*[local-name() = 'PrepaidPayment']/*[local-name() = 'PaidAmount']"
						/>
					</xsl:element>
					<xsl:if
						test="//*[local-name() = 'PrepaidPayment']/*[local-name() = 'ReceivedDate']">
						<xsl:element name="cbc:ReceivedDate">
							<xsl:value-of
								select="//*[local-name() = 'PrepaidPayment']/*[local-name() = 'ReceivedDate']"
							/>
						</xsl:element>
					</xsl:if>
					<xsl:if test="//*[local-name() = 'PrepaidPayment']/*[local-name() = 'PaidDate']">
						<xsl:element name="cbc:PaidDate">
							<xsl:value-of
								select="//*[local-name() = 'PrepaidPayment']/*[local-name() = 'PaidDate']"
							/>
						</xsl:element>
					</xsl:if>
					<xsl:if test="//*[local-name() = 'PrepaidPayment']/*[local-name() = 'PaidTime']">
						<xsl:element name="cbc:PaidTime">
							<xsl:value-of
								select="//*[local-name() = 'PrepaidPayment']/*[local-name() = 'PaidTime']"
							/>
						</xsl:element>
					</xsl:if>
					<xsl:if
						test="//*[local-name() = 'PrepaidPayment']/*[local-name() = 'InstructionID']">
						<xsl:element name="cbc:InstructionID">
							<xsl:value-of
								select="//*[local-name() = 'PrepaidPayment']/*[local-name() = 'InstructionID']"
							/>
						</xsl:element>
					</xsl:if>
				</xsl:element>
			</xsl:if>-->
			<!-- Payment Exchange Rate -->
			<xsl:if test="$MonedaC != 'COP'">
				<xsl:element name="cac:PaymentExchangeRate">
					<xsl:element name="cbc:SourceCurrencyCode">
						<xsl:value-of select="$MonedaC"/>
					</xsl:element>
					<xsl:element name="cbc:SourceCurrencyBaseRate">
						<xsl:value-of select="'1.00'"/>
					</xsl:element>
					<xsl:element name="cbc:TargetCurrencyCode">
						<xsl:value-of select="'COP'"/>
					</xsl:element>
					<xsl:element name="cbc:TargetCurrencyBaseRate">
						<xsl:value-of select="'1.00'"/>
					</xsl:element>
					<xsl:element name="cbc:CalculationRate">
						<xsl:value-of select="/DTE/Documento/Encabezado/Totales/FctConv"/>
					</xsl:element>
					<xsl:element name="cbc:Date">
						<xsl:value-of
							select="substring-before(/DTE/Documento/Encabezado/IdDoc/FechaEmis, 'T')"
						/>
					</xsl:element>
				</xsl:element>
			</xsl:if>
			<!-- Allowance Charges -->
			<xsl:for-each select="/DTE/Documento/DscRcgGlobal">
				<xsl:element name="cac:AllowanceCharge">
					<xsl:element name="cbc:ID">
						<xsl:value-of select="position()"/>
					</xsl:element>
					<xsl:element name="cbc:ChargeIndicator">
						<xsl:if test="TpoMov = 'D'">
							<xsl:value-of select="'false'"/>
						</xsl:if>
						<xsl:if test="TpoMov = 'R'">
							<xsl:value-of select="'true'"/>
						</xsl:if>
					</xsl:element>
					<xsl:if test="TpoMov = 'D'">
						<xsl:element name="cbc:AllowanceChargeReasonCode">
							<xsl:choose>
								<xsl:when test="CodigoDR">
									<xsl:value-of select="CodigoDR"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="'11'"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:element>
					</xsl:if>
					<xsl:if test="GlosaDR != '' and not(//IdDoc/Tipo = '02')">
						<xsl:element name="cbc:AllowanceChargeReason">
							<xsl:value-of select="GlosaDR"/>
						</xsl:element>
					</xsl:if>
					<xsl:if test="not(GlosaDR) or Glosa = '' and not(//IdDoc/Tipo = '02')">
						<xsl:element name="cbc:AllowanceChargeReason">
							<xsl:call-template name="CodigoDescuento">
								<xsl:with-param name="CodDesc">
									<xsl:value-of select="CodigoDR"/>
								</xsl:with-param>
							</xsl:call-template>
						</xsl:element>
					</xsl:if>
					<xsl:if test="GlosaDR != '' and //IdDoc/Tipo = '02'">
						<xsl:element name="cbc:AllowanceChargeReason">
							<xsl:value-of select="GlosaDR"/>
						</xsl:element>
					</xsl:if>
					<xsl:element name="cbc:MultiplierFactorNumeric">
						<xsl:value-of select="format-number(PctDR, '#0.00')"/>
					</xsl:element>
					<xsl:element name="cbc:Amount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="format-number(ValorDR, '#0.00')"/>
					</xsl:element>
					<xsl:element name="cbc:BaseAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="format-number(ValorDR div (PctDR div 100), '#0.00')"/>
					</xsl:element>
				</xsl:element>
			</xsl:for-each>
			<!-- Impuestos a nivel global -->
			<xsl:variable name="SumImp01">
				<xsl:value-of select="sum(/DTE/Documento/Encabezado/Impuestos[TipoImp = '01']/MontoImp)"/>
			</xsl:variable>
			<xsl:variable name="SumImpBase01">
				<xsl:value-of select="(sum((/DTE/Documento/Encabezado/Impuestos[TipoImp = '01'][1]/MontoBAseImp[1]*((/DTE/Documento/Encabezado/Impuestos[TipoImp = '01'][1]/TasaImp[1]) div 100))-/DTE/Documento/Encabezado/Impuestos[TipoImp = '01'][1]/MontoImp[1])) + (sum((/DTE/Documento/Encabezado/Impuestos[TipoImp = '01'][2]/MontoBAseImp[2]*((/DTE/Documento/Encabezado/Impuestos[TipoImp = '01'][2]/TasaImp[2]) div 100))-/DTE/Documento/Encabezado/Impuestos[TipoImp = '01'][2]/MontoImp[2])) + (sum((/DTE/Documento/Encabezado/Impuestos[TipoImp = '01'][3]/MontoBAseImp[3]*((/DTE/Documento/Encabezado/Impuestos[TipoImp = '01'][3]/TasaImp[3]) div 100))-/DTE/Documento/Encabezado/Impuestos[TipoImp = '01'][3]/MontoImp[3]))"/>
			</xsl:variable>
			<xsl:variable name="SumImp02">
				<xsl:value-of select="sum(/DTE/Documento/Encabezado/Impuestos[TipoImp = '02']/MontoImp)"/>
			</xsl:variable>
			<xsl:variable name="SumImpBase02">
				<xsl:value-of select="(sum((/DTE/Documento/Encabezado/Impuestos[TipoImp = '02'][1]/MontoBAseImp[1]*((/DTE/Documento/Encabezado/Impuestos[TipoImp = '02'][1]/TasaImp[1]) div 100))-/DTE/Documento/Encabezado/Impuestos[TipoImp = '02'][1]/MontoImp[1])) + (sum((/DTE/Documento/Encabezado/Impuestos[TipoImp = '02'][2]/MontoBAseImp[2]*((/DTE/Documento/Encabezado/Impuestos[TipoImp = '02'][2]/TasaImp[2]) div 100))-/DTE/Documento/Encabezado/Impuestos[TipoImp = '02'][2]/MontoImp[2])) + (sum((/DTE/Documento/Encabezado/Impuestos[TipoImp = '02'][3]/MontoBAseImp[3]*((/DTE/Documento/Encabezado/Impuestos[TipoImp = '02'][3]/TasaImp[3]) div 100))-/DTE/Documento/Encabezado/Impuestos[TipoImp = '02'][3]/MontoImp[3]))"/>
			</xsl:variable>
			<xsl:variable name="SumImp03">
				<xsl:value-of select="sum(/DTE/Documento/Encabezado/Impuestos[TipoImp = '03']/MontoImp)"/>
			</xsl:variable>
			<xsl:variable name="SumImpBase03">
				<xsl:value-of select="(sum((/DTE/Documento/Encabezado/Impuestos[TipoImp = '03'][1]/MontoBAseImp[1]*((/DTE/Documento/Encabezado/Impuestos[TipoImp = '03'][1]/TasaImp[1]) div 100))-/DTE/Documento/Encabezado/Impuestos[TipoImp = '03'][1]/MontoImp[1])) + (sum((/DTE/Documento/Encabezado/Impuestos[TipoImp = '03'][2]/MontoBAseImp[2]*((/DTE/Documento/Encabezado/Impuestos[TipoImp = '03'][2]/TasaImp[2]) div 100))-/DTE/Documento/Encabezado/Impuestos[TipoImp = '03'][2]/MontoImp[2])) + (sum((/DTE/Documento/Encabezado/Impuestos[TipoImp = '03'][3]/MontoBAseImp[3]*((/DTE/Documento/Encabezado/Impuestos[TipoImp = '03'][3]/TasaImp[3]) div 100))-/DTE/Documento/Encabezado/Impuestos[TipoImp = '03'][3]/MontoImp[3]))"/>
			</xsl:variable>
			<xsl:variable name="SumImp04">
				<xsl:value-of select="sum(/DTE/Documento/Encabezado/Impuestos[TipoImp = '04']/MontoImp)"/>
			</xsl:variable>
			<xsl:variable name="SumImpBase04">
				<xsl:value-of select="(sum((/DTE/Documento/Encabezado/Impuestos[TipoImp = '04'][1]/MontoBAseImp[1]*((/DTE/Documento/Encabezado/Impuestos[TipoImp = '04'][1]/TasaImp[1]) div 100))-/DTE/Documento/Encabezado/Impuestos[TipoImp = '04'][1]/MontoImp[1])) + (sum((/DTE/Documento/Encabezado/Impuestos[TipoImp = '04'][2]/MontoBAseImp[2]*((/DTE/Documento/Encabezado/Impuestos[TipoImp = '04'][2]/TasaImp[2]) div 100))-/DTE/Documento/Encabezado/Impuestos[TipoImp = '04'][2]/MontoImp[2])) + (sum((/DTE/Documento/Encabezado/Impuestos[TipoImp = '04'][3]/MontoBAseImp[3]*((/DTE/Documento/Encabezado/Impuestos[TipoImp = '04'][3]/TasaImp[3]) div 100))-/DTE/Documento/Encabezado/Impuestos[TipoImp = '04'][3]/MontoImp[3]))"/>
			</xsl:variable>
			<xsl:variable name="SumImp20">
				<xsl:value-of select="sum(/DTE/Documento/Encabezado/Impuestos[TipoImp = '20']/MontoImp)"/>
			</xsl:variable>
			<xsl:variable name="SumImp21">
				<xsl:value-of select="sum(/DTE/Documento/Encabezado/Impuestos[TipoImp = '21']/MontoImp)"/>
			</xsl:variable>
			<xsl:variable name="SumImp22">
				<xsl:value-of select="sum(/DTE/Documento/Encabezado/Impuestos[TipoImp = '22']/MontoImp)"/>
			</xsl:variable>
			<xsl:variable name="SumImp23">
				<xsl:value-of select="sum(/DTE/Documento/Encabezado/Impuestos[TipoImp = '23']/MontoImp)"/>
			</xsl:variable>
			<xsl:variable name="SumImp24">
				<xsl:value-of select="sum(/DTE/Documento/Encabezado/Impuestos[TipoImp = '24']/MontoImp)"/>
			</xsl:variable>
			<xsl:variable name="SumImp25">
				<xsl:value-of select="sum(/DTE/Documento/Encabezado/Impuestos[TipoImp = '25']/MontoImp)"/>
			</xsl:variable>
			<xsl:variable name="SumImp26">
				<xsl:value-of select="sum(/DTE/Documento/Encabezado/Impuestos[TipoImp = '26']/MontoImp)"/>
			</xsl:variable>
			<xsl:for-each select="/DTE/Documento/Encabezado/Impuestos[TipoImp = '01'][1]">
				<xsl:element name="cac:TaxTotal">
					<xsl:element name="cbc:TaxAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="format-number($SumImp01, '#0.00')"/>
					</xsl:element>
					<xsl:element name="cbc:RoundingAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="format-number($SumImpBase01, '#0.00')"/>
					</xsl:element>
					<xsl:for-each select="../Impuestos[TipoImp = '01']">
						<xsl:element name="cac:TaxSubtotal">
							<xsl:if test="not(PrecioPorUnidad)">
								<xsl:element name="cbc:TaxableAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of
										select="normalize-space(format-number(MontoBAseImp, '#0.00'))"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
							</xsl:element>
							<xsl:if test="UnidadMedida">
								<xsl:element name="cbc:BaseUnitMeasure">
									<xsl:attribute name="unitCode">
										<xsl:value-of select="UnidadMedida"/>
									</xsl:attribute>
									<xsl:value-of select="'1.000000'"/>
								</xsl:element>
							</xsl:if>
							<xsl:if test="PrecioPorUnidad">
								<xsl:element name="cbc:PerUnitAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cac:TaxCategory">
								<xsl:if test="not(PrecioPorUnidad)">
									<xsl:choose>
										<xsl:when test="TipoImp = '03'">
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
											</xsl:element>
										</xsl:when>
										<xsl:otherwise>
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
											</xsl:element>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:element name="cac:TaxScheme">
									<xsl:element name="cbc:ID">
										<xsl:value-of select="TipoImp"/>
									</xsl:element>
									<xsl:element name="cbc:Name">
										<xsl:call-template name="TipoImpuesto">
											<xsl:with-param name="TpoImp">
												<xsl:value-of select="TipoImp"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="/DTE/Documento/Encabezado/Impuestos[TipoImp = '02'][1]">
				<xsl:element name="cac:TaxTotal">
					<xsl:element name="cbc:TaxAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:if test="TipoImp = '02'">
							<xsl:value-of select="format-number($SumImp02, '#0.00')"/>
						</xsl:if>
					</xsl:element>
					<xsl:element name="cbc:RoundingAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="format-number($SumImpBase02, '#0.00')"/>
					</xsl:element>
					<xsl:for-each select="../Impuestos[TipoImp = '02']">
						<xsl:element name="cac:TaxSubtotal">
							<xsl:if test="not(PrecioPorUnidad)">
								<xsl:element name="cbc:TaxableAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of
										select="normalize-space(format-number(MontoBAseImp, '#0.00'))"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
							</xsl:element>
							<xsl:if test="UnidadMedida">
								<xsl:element name="cbc:BaseUnitMeasure">
									<xsl:attribute name="unitCode">
										<xsl:value-of select="UnidadMedida"/>
									</xsl:attribute>
									<xsl:value-of select="'1.000000'"/>
								</xsl:element>
							</xsl:if>
							<xsl:if test="PrecioPorUnidad">
								<xsl:element name="cbc:PerUnitAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cac:TaxCategory">
								<xsl:if test="not(PrecioPorUnidad)">
									<xsl:choose>
										<xsl:when test="TipoImp = '03'">
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
											</xsl:element>
										</xsl:when>
										<xsl:otherwise>
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
											</xsl:element>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:element name="cac:TaxScheme">
									<xsl:element name="cbc:ID">
										<xsl:value-of select="TipoImp"/>
									</xsl:element>
									<xsl:element name="cbc:Name">
										<xsl:call-template name="TipoImpuesto">
											<xsl:with-param name="TpoImp">
												<xsl:value-of select="TipoImp"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="/DTE/Documento/Encabezado/Impuestos[TipoImp = '03'][1]">
				<xsl:element name="cac:TaxTotal">
					<xsl:element name="cbc:TaxAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:if test="TipoImp = '03'">
							<xsl:value-of select="format-number($SumImp03, '#0.00')"/>
						</xsl:if>
					</xsl:element>
					<xsl:element name="cbc:RoundingAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="format-number($SumImpBase03, '#0.00')"/>
					</xsl:element>
					<xsl:for-each select="../Impuestos[TipoImp = '03']">
						<xsl:element name="cac:TaxSubtotal">
							<xsl:if test="not(PrecioPorUnidad)">
								<xsl:element name="cbc:TaxableAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of
										select="normalize-space(format-number(MontoBAseImp, '#0.00'))"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
							</xsl:element>
							<xsl:if test="UnidadMedida">
								<xsl:element name="cbc:BaseUnitMeasure">
									<xsl:attribute name="unitCode">
										<xsl:value-of select="UnidadMedida"/>
									</xsl:attribute>
									<xsl:value-of select="'1.000000'"/>
								</xsl:element>
							</xsl:if>
							<xsl:if test="PrecioPorUnidad">
								<xsl:element name="cbc:PerUnitAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cac:TaxCategory">
								<xsl:if test="not(PrecioPorUnidad)">
									<xsl:choose>
										<xsl:when test="TipoImp = '03'">
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
											</xsl:element>
										</xsl:when>
										<xsl:otherwise>
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
											</xsl:element>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:element name="cac:TaxScheme">
									<xsl:element name="cbc:ID">
										<xsl:value-of select="TipoImp"/>
									</xsl:element>
									<xsl:element name="cbc:Name">
										<xsl:call-template name="TipoImpuesto">
											<xsl:with-param name="TpoImp">
												<xsl:value-of select="TipoImp"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="/DTE/Documento/Encabezado/Impuestos[TipoImp = '04'][1]">
				<xsl:element name="cac:TaxTotal">
					<xsl:element name="cbc:TaxAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:if test="TipoImp = '04'">
							<xsl:value-of select="format-number($SumImp04, '#0.00')"/>
						</xsl:if>
					</xsl:element>
					<xsl:element name="cbc:RoundingAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="format-number($SumImpBase04, '#0.00')"/>
					</xsl:element>
					<xsl:for-each select="../Impuestos[TipoImp = '04']">
						<xsl:element name="cac:TaxSubtotal">
							<xsl:if test="not(PrecioPorUnidad)">
								<xsl:element name="cbc:TaxableAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of
										select="normalize-space(format-number(MontoBAseImp, '#0.00'))"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
							</xsl:element>
							<xsl:if test="UnidadMedida">
								<xsl:element name="cbc:BaseUnitMeasure">
									<xsl:attribute name="unitCode">
										<xsl:value-of select="UnidadMedida"/>
									</xsl:attribute>
									<xsl:value-of select="'1.000000'"/>
								</xsl:element>
							</xsl:if>
							<xsl:if test="PrecioPorUnidad">
								<xsl:element name="cbc:PerUnitAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cac:TaxCategory">
								<xsl:if test="not(PrecioPorUnidad)">
									<xsl:choose>
										<xsl:when test="TipoImp = '03'">
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
											</xsl:element>
										</xsl:when>
										<xsl:otherwise>
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
											</xsl:element>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:element name="cac:TaxScheme">
									<xsl:element name="cbc:ID">
										<xsl:value-of select="TipoImp"/>
									</xsl:element>
									<xsl:element name="cbc:Name">
										<xsl:call-template name="TipoImpuesto">
											<xsl:with-param name="TpoImp">
												<xsl:value-of select="TipoImp"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
			
			<xsl:for-each select="/DTE/Documento/Encabezado/Impuestos[TipoImp = '20'][1]">
				<xsl:element name="cac:TaxTotal">
					<xsl:element name="cbc:TaxAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:if test="TipoImp = '20'">
							<xsl:value-of select="format-number($SumImp20, '#0.00')"/>
						</xsl:if>
					</xsl:element>
					<xsl:for-each select="../Impuestos[TipoImp = '20']">
						<xsl:element name="cac:TaxSubtotal">
							<xsl:if test="not(PrecioPorUnidad)">
								<xsl:element name="cbc:TaxableAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of
										select="normalize-space(format-number(MontoBAseImp, '#0.00'))"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
							</xsl:element>
							<xsl:if test="UnidadMedida">
								<xsl:element name="cbc:BaseUnitMeasure">
									<xsl:attribute name="unitCode">
										<xsl:value-of select="UnidadMedida"/>
									</xsl:attribute>
									<xsl:value-of select="'1.000000'"/>
								</xsl:element>
							</xsl:if>
							<xsl:if test="PrecioPorUnidad">
								<xsl:element name="cbc:PerUnitAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cac:TaxCategory">
								<xsl:if test="not(PrecioPorUnidad)">
									<xsl:choose>
										<xsl:when test="TipoImp = '03'">
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
											</xsl:element>
										</xsl:when>
										<xsl:otherwise>
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
											</xsl:element>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:element name="cac:TaxScheme">
									<xsl:element name="cbc:ID">
										<xsl:value-of select="TipoImp"/>
									</xsl:element>
									<xsl:element name="cbc:Name">
										<xsl:call-template name="TipoImpuesto">
											<xsl:with-param name="TpoImp">
												<xsl:value-of select="TipoImp"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="/DTE/Documento/Encabezado/Impuestos[TipoImp = '21'][1]">
				<xsl:element name="cac:TaxTotal">
					<xsl:element name="cbc:TaxAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:if test="TipoImp = '21'">
							<xsl:value-of select="format-number($SumImp21, '#0.00')"/>
						</xsl:if>
					</xsl:element>
					<xsl:for-each select="../Impuestos[TipoImp = '21']">
						<xsl:element name="cac:TaxSubtotal">
							<xsl:if test="not(PrecioPorUnidad)">
								<xsl:element name="cbc:TaxableAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of
										select="normalize-space(format-number(MontoBAseImp, '#0.00'))"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
							</xsl:element>
							<xsl:if test="UnidadMedida">
								<xsl:element name="cbc:BaseUnitMeasure">
									<xsl:attribute name="unitCode">
										<xsl:value-of select="UnidadMedida"/>
									</xsl:attribute>
									<xsl:value-of select="'1.000000'"/>
								</xsl:element>
							</xsl:if>
							<xsl:if test="PrecioPorUnidad">
								<xsl:element name="cbc:PerUnitAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cac:TaxCategory">
								<xsl:if test="not(PrecioPorUnidad)">
									<xsl:choose>
										<xsl:when test="TipoImp = '03'">
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
											</xsl:element>
										</xsl:when>
										<xsl:otherwise>
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
											</xsl:element>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:element name="cac:TaxScheme">
									<xsl:element name="cbc:ID">
										<xsl:value-of select="TipoImp"/>
									</xsl:element>
									<xsl:element name="cbc:Name">
										<xsl:call-template name="TipoImpuesto">
											<xsl:with-param name="TpoImp">
												<xsl:value-of select="TipoImp"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="/DTE/Documento/Encabezado/Impuestos[TipoImp = '22'][1]">
				<xsl:element name="cac:TaxTotal">
					<xsl:element name="cbc:TaxAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:if test="TipoImp = '22'">
							<xsl:value-of select="format-number($SumImp22, '#0.00')"/>
						</xsl:if>
					</xsl:element>
					<xsl:for-each select="../Impuestos[TipoImp = '22']">
						<xsl:element name="cac:TaxSubtotal">
							<xsl:if test="not(PrecioPorUnidad)">
								<xsl:element name="cbc:TaxableAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of
										select="normalize-space(format-number(MontoBAseImp, '#0.00'))"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
							</xsl:element>
							<xsl:if test="UnidadMedida">
								<xsl:element name="cbc:BaseUnitMeasure">
									<xsl:attribute name="unitCode">
										<xsl:value-of select="UnidadMedida"/>
									</xsl:attribute>
									<xsl:value-of select="'1.000000'"/>
								</xsl:element>
							</xsl:if>
							<xsl:if test="PrecioPorUnidad">
								<xsl:element name="cbc:PerUnitAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cac:TaxCategory">
								<xsl:if test="not(PrecioPorUnidad)">
									<xsl:choose>
										<xsl:when test="TipoImp = '03'">
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
											</xsl:element>
										</xsl:when>
										<xsl:otherwise>
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
											</xsl:element>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:element name="cac:TaxScheme">
									<xsl:element name="cbc:ID">
										<xsl:value-of select="TipoImp"/>
									</xsl:element>
									<xsl:element name="cbc:Name">
										<xsl:call-template name="TipoImpuesto">
											<xsl:with-param name="TpoImp">
												<xsl:value-of select="TipoImp"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="/DTE/Documento/Encabezado/Impuestos[TipoImp = '23'][1]">
				<xsl:element name="cac:TaxTotal">
					<xsl:element name="cbc:TaxAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:if test="TipoImp = '23'">
							<xsl:value-of select="format-number($SumImp23, '#0.00')"/>
						</xsl:if>
					</xsl:element>
					<xsl:for-each select="../Impuestos[TipoImp = '23']">
						<xsl:element name="cac:TaxSubtotal">
							<xsl:if test="not(PrecioPorUnidad)">
								<xsl:element name="cbc:TaxableAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of
										select="normalize-space(format-number(MontoBAseImp, '#0.00'))"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
							</xsl:element>
							<xsl:if test="UnidadMedida">
								<xsl:element name="cbc:BaseUnitMeasure">
									<xsl:attribute name="unitCode">
										<xsl:value-of select="UnidadMedida"/>
									</xsl:attribute>
									<xsl:value-of select="'1.000000'"/>
								</xsl:element>
							</xsl:if>
							<xsl:if test="PrecioPorUnidad">
								<xsl:element name="cbc:PerUnitAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cac:TaxCategory">
								<xsl:if test="not(PrecioPorUnidad)">
									<xsl:choose>
										<xsl:when test="TipoImp = '03'">
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
											</xsl:element>
										</xsl:when>
										<xsl:otherwise>
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
											</xsl:element>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:element name="cac:TaxScheme">
									<xsl:element name="cbc:ID">
										<xsl:value-of select="TipoImp"/>
									</xsl:element>
									<xsl:element name="cbc:Name">
										<xsl:call-template name="TipoImpuesto">
											<xsl:with-param name="TpoImp">
												<xsl:value-of select="TipoImp"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="/DTE/Documento/Encabezado/Impuestos[TipoImp = '24'][1]">
				<xsl:element name="cac:TaxTotal">
					<xsl:element name="cbc:TaxAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:if test="TipoImp = '24'">
							<xsl:value-of select="format-number($SumImp24, '#0.00')"/>
						</xsl:if>
					</xsl:element>
					<xsl:for-each select="../Impuestos[TipoImp = '24']">
						<xsl:element name="cac:TaxSubtotal">
							<xsl:if test="not(PrecioPorUnidad)">
								<xsl:element name="cbc:TaxableAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of
										select="normalize-space(format-number(MontoBAseImp, '#0.00'))"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
							</xsl:element>
							<xsl:if test="UnidadMedida">
								<xsl:element name="cbc:BaseUnitMeasure">
									<xsl:attribute name="unitCode">
										<xsl:value-of select="UnidadMedida"/>
									</xsl:attribute>
									<xsl:value-of select="'1.000000'"/>
								</xsl:element>
							</xsl:if>
							<xsl:if test="PrecioPorUnidad">
								<xsl:element name="cbc:PerUnitAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cac:TaxCategory">
								<xsl:if test="not(PrecioPorUnidad)">
									<xsl:choose>
										<xsl:when test="TipoImp = '03'">
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
											</xsl:element>
										</xsl:when>
										<xsl:otherwise>
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
											</xsl:element>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:element name="cac:TaxScheme">
									<xsl:element name="cbc:ID">
										<xsl:value-of select="TipoImp"/>
									</xsl:element>
									<xsl:element name="cbc:Name">
										<xsl:call-template name="TipoImpuesto">
											<xsl:with-param name="TpoImp">
												<xsl:value-of select="TipoImp"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="/DTE/Documento/Encabezado/Impuestos[TipoImp = '25'][1]">
				<xsl:element name="cac:TaxTotal">
					<xsl:element name="cbc:TaxAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:if test="TipoImp = '25'">
							<xsl:value-of select="format-number($SumImp25, '#0.00')"/>
						</xsl:if>
					</xsl:element>
					<xsl:for-each select="../Impuestos[TipoImp = '25']">
						<xsl:element name="cac:TaxSubtotal">
							<xsl:if test="not(PrecioPorUnidad)">
								<xsl:element name="cbc:TaxableAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of
										select="normalize-space(format-number(MontoBAseImp, '#0.00'))"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
							</xsl:element>
							<xsl:if test="UnidadMedida">
								<xsl:element name="cbc:BaseUnitMeasure">
									<xsl:attribute name="unitCode">
										<xsl:value-of select="UnidadMedida"/>
									</xsl:attribute>
									<xsl:value-of select="'1.000000'"/>
								</xsl:element>
							</xsl:if>
							<xsl:if test="PrecioPorUnidad">
								<xsl:element name="cbc:PerUnitAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cac:TaxCategory">
								<xsl:if test="not(PrecioPorUnidad)">
									<xsl:choose>
										<xsl:when test="TipoImp = '03'">
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
											</xsl:element>
										</xsl:when>
										<xsl:otherwise>
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
											</xsl:element>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:element name="cac:TaxScheme">
									<xsl:element name="cbc:ID">
										<xsl:value-of select="TipoImp"/>
									</xsl:element>
									<xsl:element name="cbc:Name">
										<xsl:call-template name="TipoImpuesto">
											<xsl:with-param name="TpoImp">
												<xsl:value-of select="TipoImp"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="/DTE/Documento/Encabezado/Impuestos[TipoImp = '26'][1]">
				<xsl:element name="cac:TaxTotal">
					<xsl:element name="cbc:TaxAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:if test="TipoImp = '26'">
							<xsl:value-of select="format-number($SumImp26, '#0.00')"/>
						</xsl:if>
					</xsl:element>
					<xsl:for-each select="../Impuestos[TipoImp = '26']">
						<xsl:element name="cac:TaxSubtotal">
							<xsl:if test="not(PrecioPorUnidad)">
								<xsl:element name="cbc:TaxableAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of
										select="normalize-space(format-number(MontoBAseImp, '#0.00'))"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
							</xsl:element>
							<xsl:if test="UnidadMedida">
								<xsl:element name="cbc:BaseUnitMeasure">
									<xsl:attribute name="unitCode">
										<xsl:value-of select="UnidadMedida"/>
									</xsl:attribute>
									<xsl:value-of select="'1.000000'"/>
								</xsl:element>
							</xsl:if>
							<xsl:if test="PrecioPorUnidad">
								<xsl:element name="cbc:PerUnitAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cac:TaxCategory">
								<xsl:if test="not(PrecioPorUnidad)">
									<xsl:choose>
										<xsl:when test="TipoImp = '03'">
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
											</xsl:element>
										</xsl:when>
										<xsl:otherwise>
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
											</xsl:element>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:element name="cac:TaxScheme">
									<xsl:element name="cbc:ID">
										<xsl:value-of select="TipoImp"/>
									</xsl:element>
									<xsl:element name="cbc:Name">
										<xsl:call-template name="TipoImpuesto">
											<xsl:with-param name="TpoImp">
												<xsl:value-of select="TipoImp"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
			<!-- TOTALS OF THE INVOICE -->
			<xsl:variable name="HLEAmount"
				select="normalize-space(format-number(/DTE/Documento/Encabezado/Totales/SubTotal, '#0.00'))"/>
			<xsl:variable name="TEAmount"
				select="normalize-space(format-number(/DTE/Documento/Encabezado/Totales/MntBase, '#0.00'))"/>
			<xsl:variable name="TIAmount"
				select="normalize-space(format-number(/DTE/Documento/Encabezado/Totales/SubTotal + /DTE/Documento/Encabezado/Totales/MntImp, '#0.00'))"/>
			<xsl:variable name="PAmount"
				select="normalize-space(format-number(/DTE/Documento/Encabezado/Totales/VlrPagar, '#0.00'))"/>
			<xsl:variable name="DescuentoGlobal"
				select="
					if (exists(/DTE/Documento/Encabezado/Totales/MntDcto)) then
						normalize-space(format-number(/DTE/Documento/Encabezado/Totales/MntDcto, '#0.00'))
					else
						'0.00'"/>
			<xsl:variable name="OtrosCargos"
				select="
					if (exists(/DTE/Documento/Encabezado/Totales/MntRcgo)) then
						normalize-space(format-number(/DTE/Documento/Encabezado/Totales/MntRcgo, '#0.00'))
					else
						'0.00'"/>
			<xsl:variable name="Redondeo"
				select="
				if (exists(/DTE/Documento/Encabezado/Totales/SaldoAnterior)) then
				normalize-space(format-number(/DTE/Documento/Encabezado/Totales/SaldoAnterior, '#0.00'))
				else
				'0.00'"/>
			<xsl:element name="cac:LegalMonetaryTotal">
				<xsl:if test="$HLEAmount != ''">
					<xsl:element name="cbc:LineExtensionAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="$HLEAmount"/>
					</xsl:element>
				</xsl:if>
				<xsl:if test="$TEAmount != ''">
					<xsl:element name="cbc:TaxExclusiveAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="$TEAmount"/>
					</xsl:element>
				</xsl:if>
				<xsl:if test="$TIAmount != '' and $TIAmount != 'NaN'">
					<xsl:element name="cbc:TaxInclusiveAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="$TIAmount"/>
					</xsl:element>
				</xsl:if>
				<!-- Global Discount -->
				<xsl:if test="$DescuentoGlobal != 'NaN' and number($DescuentoGlobal) != 0.00">
					<xsl:element name="cbc:AllowanceTotalAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="$DescuentoGlobal"/>
					</xsl:element>
				</xsl:if>
				<!--Other charges-->
				<xsl:if test="number($OtrosCargos) != 0.00 and $OtrosCargos != 'NaN'">
					<xsl:element name="cbc:ChargeTotalAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="$OtrosCargos"/>
					</xsl:element>
				</xsl:if>
				<!--Payable Rounding Amount of Invoice-->
				<xsl:if test="number($Redondeo) != 0.00 and $Redondeo != 'NaN'">
					<xsl:element name="cbc:PayableRoundingAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="$Redondeo"/>
					</xsl:element>
				</xsl:if>
				<!--Payable Amount of Invoice -->
				<xsl:element name="cbc:PayableAmount">
					<xsl:attribute name="currencyID">
						<xsl:value-of select="$MonedaC"/>
					</xsl:attribute>
					<xsl:value-of select="$PAmount"/>
				</xsl:element>
			</xsl:element>
			<!--DETAIL SECTION -->
			<xsl:for-each select="/DTE/Documento/Detalle">
				<xsl:element name="cac:CreditNoteLine">
					<!--Invoice Line ID-->
					<xsl:element name="cbc:ID">
						<xsl:value-of select="position()"/>
					</xsl:element>
					<xsl:if test="DscLang != ''">
						<xsl:element name="cbc:Note">
							<xsl:value-of select="DscLang"/>
						</xsl:element>
					</xsl:if>
					<xsl:element name="cbc:CreditedQuantity">
						<!--Unit of Measure -->
						<xsl:attribute name="unitCode">
							<xsl:value-of select="UnmdItem"/>
						</xsl:attribute>
						<xsl:value-of select="format-number(QtyItem, '#0.000000')"/>
					</xsl:element>
					<xsl:variable name="LineExtentionAmount">
						<xsl:value-of select="format-number(MontoTotalItem, '#0.00')"/>
					</xsl:variable>
					<xsl:element name="cbc:LineExtensionAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="format-number($LineExtentionAmount, '#0.00')"/>
					</xsl:element>
					<!--Precio referencia en caso de ser Item gratuito -->
					<xsl:if test="MontoTotalItem = 0 and SubMonto[Tipo = 'FREE']/MontoConcepto">
						<xsl:element name="cac:PricingReference">
							<xsl:element name="cac:AlternativeConditionPrice">
								<xsl:element name="cbc:PriceAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of select="SubMonto[Tipo = 'FREE']/MontoConcepto"/>
								</xsl:element>
								<xsl:element name="cbc:PriceTypeCode">
									<xsl:value-of select="SubMonto[Tipo = 'FREE']/CodTipoMonto"/>
								</xsl:element>
								<xsl:element name="cbc:PriceType">
									<xsl:call-template name="CodigoPrecioRef">
										<xsl:with-param name="CodRef">
											<xsl:value-of
												select="SubMonto[Tipo = 'FREE']/CodTipoMonto"/>
										</xsl:with-param>
									</xsl:call-template>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:if>
					<!--Item' taxes-->
					<xsl:variable name="SumImpDet01">
						<xsl:value-of select="sum(ImpuestosDet[TipoImp = '01']/MontoImp)"/>
					</xsl:variable>
					<xsl:variable name="SumBaseImpDet01">
						<xsl:value-of select="(sum((ImpuestosDet[TipoImp = '01'][1]/MontoBaseImp[1]*((ImpuestosDet[TipoImp = '01'][1]/TasaImp[1]) div 100))-ImpuestosDet[TipoImp = '01'][1]/MontoImp[1])) + sum((ImpuestosDet[TipoImp = '01'][2]/MontoBaseImp[2]*((ImpuestosDet[TipoImp = '01'][2]/TasaImp[2]) div 100))-ImpuestosDet[TipoImp = '01'][2]/MontoImp[2]) + sum((ImpuestosDet[TipoImp = '01'][3]/MontoBaseImp[3]*((ImpuestosDet[TipoImp = '01'][3]/TasaImp[3]) div 100))-ImpuestosDet[TipoImp = '01'][3]/MontoImp[3])"/>
					</xsl:variable>
					<xsl:variable name="SumImpDet02">
						<xsl:value-of select="sum(ImpuestosDet[TipoImp = '02']/MontoImp)"/>
					</xsl:variable>
					<xsl:variable name="SumBaseImpDet02">
						<xsl:value-of select="(sum((ImpuestosDet[TipoImp = '02'][1]/MontoBaseImp[1]*((ImpuestosDet[TipoImp = '02'][1]/TasaImp[1]) div 100))-ImpuestosDet[TipoImp = '02'][1]/MontoImp[1])) + sum((ImpuestosDet[TipoImp = '02'][2]/MontoBaseImp[2]*((ImpuestosDet[TipoImp = '02'][2]/TasaImp[2]) div 100))-ImpuestosDet[TipoImp = '02'][2]/MontoImp[2]) + sum((ImpuestosDet[TipoImp = '02'][3]/MontoBaseImp[3]*((ImpuestosDet[TipoImp = '02'][3]/TasaImp[3]) div 100))-ImpuestosDet[TipoImp = '02'][3]/MontoImp[3])"/>
					</xsl:variable>
					<xsl:variable name="SumImpDet03">
						<xsl:value-of select="sum(ImpuestosDet[TipoImp = '03']/MontoImp)"/>
					</xsl:variable>
					<xsl:variable name="SumBaseImpDet03">
						<xsl:value-of select="(sum((ImpuestosDet[TipoImp = '03'][1]/MontoBaseImp[1]*((ImpuestosDet[TipoImp = '03'][1]/TasaImp[1]) div 100))-ImpuestosDet[TipoImp = '03'][1]/MontoImp[1])) + sum((ImpuestosDet[TipoImp = '03'][2]/MontoBaseImp[2]*((ImpuestosDet[TipoImp = '03'][2]/TasaImp[2]) div 100))-ImpuestosDet[TipoImp = '03'][2]/MontoImp[2]) + sum((ImpuestosDet[TipoImp = '03'][3]/MontoBaseImp[3]*((ImpuestosDet[TipoImp = '03'][3]/TasaImp[3]) div 100))-ImpuestosDet[TipoImp = '03'][3]/MontoImp[3])"/>
					</xsl:variable>
					<xsl:variable name="SumImpDet04">
						<xsl:value-of select="sum(ImpuestosDet[TipoImp = '04']/MontoImp)"/>
					</xsl:variable>
					<xsl:variable name="SumBaseImpDet04">
						<xsl:value-of select="(sum((ImpuestosDet[TipoImp = '04'][1]/MontoBaseImp[1]*((ImpuestosDet[TipoImp = '04'][1]/TasaImp[1]) div 100))-ImpuestosDet[TipoImp = '04'][1]/MontoImp[1])) + sum((ImpuestosDet[TipoImp = '04'][2]/MontoBaseImp[2]*((ImpuestosDet[TipoImp = '04'][2]/TasaImp[2]) div 100))-ImpuestosDet[TipoImp = '04'][2]/MontoImp[2]) + sum((ImpuestosDet[TipoImp = '04'][3]/MontoBaseImp[3]*((ImpuestosDet[TipoImp = '04'][3]/TasaImp[3]) div 100))-ImpuestosDet[TipoImp = '04'][3]/MontoImp[3])"/>
					</xsl:variable>
					<xsl:variable name="SumImpDet20">
						<xsl:value-of select="sum(ImpuestosDet[TipoImp = '20']/MontoImp)"/>
					</xsl:variable>
					<xsl:variable name="SumImpDet21">
						<xsl:value-of select="sum(ImpuestosDet[TipoImp = '21']/MontoImp)"/>
					</xsl:variable>
					<xsl:variable name="SumImpDet22">
						<xsl:value-of select="sum(ImpuestosDet[TipoImp = '22']/MontoImp)"/>
					</xsl:variable>
					<xsl:variable name="SumImpDet23">
						<xsl:value-of select="sum(ImpuestosDet[TipoImp = '23']/MontoImp)"/>
					</xsl:variable>
					<xsl:variable name="SumImpDet24">
						<xsl:value-of select="sum(ImpuestosDet[TipoImp = '24']/MontoImp)"/>
					</xsl:variable>
					<xsl:variable name="SumImpDet25">
						<xsl:value-of select="sum(ImpuestosDet[TipoImp = '25']/MontoImp)"/>
					</xsl:variable>
					<xsl:variable name="SumImpDet26">
						<xsl:value-of select="sum(ImpuestosDet[TipoImp = '26']/MontoImp)"/>
					</xsl:variable>
					<xsl:for-each select="ImpuestosDet[TipoImp = '01'][1]">
						<xsl:element name="cac:TaxTotal">
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number($SumImpDet01, '#0.00')"/>
							</xsl:element>
							<xsl:element name="cbc:RoundingAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number($SumBaseImpDet01, '#0.00')"/>
							</xsl:element>
							<xsl:for-each select="../ImpuestosDet[TipoImp = '01']">
								<xsl:element name="cac:TaxSubtotal">
									<xsl:if test="not(PrecioPorUnidad)">
										<xsl:element name="cbc:TaxableAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of
												select="normalize-space(format-number(MontoBaseImp, '#0.00'))"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cbc:TaxAmount">
										<xsl:attribute name="currencyID">
											<xsl:value-of select="$MonedaC"/>
										</xsl:attribute>
										<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
									</xsl:element>
									<xsl:if test="UnidadMedida">
										<xsl:element name="cbc:BaseUnitMeasure">
											<xsl:attribute name="unitCode">
												<xsl:value-of select="UnidadMedida"/>
											</xsl:attribute>
											<xsl:value-of select="'1.000000'"/>
										</xsl:element>
									</xsl:if>
									<xsl:if test="PrecioPorUnidad">
										<xsl:element name="cbc:PerUnitAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cac:TaxCategory">
										<xsl:if test="not(PrecioPorUnidad)">
											<xsl:choose>
												<xsl:when test="TipoImp = '03'">
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
													</xsl:element>
												</xsl:when>
												<xsl:otherwise>
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
													</xsl:element>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:element name="cac:TaxScheme">
											<xsl:element name="cbc:ID">
												<xsl:value-of select="TipoImp"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:call-template name="TipoImpuesto">
													<xsl:with-param name="TpoImp">
														<xsl:value-of select="TipoImp"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:for-each>
						</xsl:element>
					</xsl:for-each>
					<xsl:for-each select="ImpuestosDet[TipoImp = '02'][1]">
						<xsl:element name="cac:TaxTotal">
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:if test="TipoImp = '02'">
									<xsl:value-of select="format-number($SumImpDet02, '#0.00')"/>
								</xsl:if>
							</xsl:element>
							<xsl:element name="cbc:RoundingAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number($SumBaseImpDet02, '#0.00')"/>
							</xsl:element>
							<xsl:for-each select="../ImpuestosDet[TipoImp = '02']">
								<xsl:element name="cac:TaxSubtotal">
									<xsl:if test="not(PrecioPorUnidad)">
										<xsl:element name="cbc:TaxableAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of
												select="normalize-space(format-number(MontoBaseImp, '#0.00'))"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cbc:TaxAmount">
										<xsl:attribute name="currencyID">
											<xsl:value-of select="$MonedaC"/>
										</xsl:attribute>
										<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
									</xsl:element>
									<xsl:if test="UnidadMedida">
										<xsl:element name="cbc:BaseUnitMeasure">
											<xsl:attribute name="unitCode">
												<xsl:value-of select="UnidadMedida"/>
											</xsl:attribute>
											<xsl:value-of select="'1.000000'"/>
										</xsl:element>
									</xsl:if>
									<xsl:if test="PrecioPorUnidad">
										<xsl:element name="cbc:PerUnitAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cac:TaxCategory">
										<xsl:if test="not(PrecioPorUnidad)">
											<xsl:choose>
												<xsl:when test="TipoImp = '03'">
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
													</xsl:element>
												</xsl:when>
												<xsl:otherwise>
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
													</xsl:element>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:element name="cac:TaxScheme">
											<xsl:element name="cbc:ID">
												<xsl:value-of select="TipoImp"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:call-template name="TipoImpuesto">
													<xsl:with-param name="TpoImp">
														<xsl:value-of select="TipoImp"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:for-each>
						</xsl:element>
					</xsl:for-each>
					<xsl:for-each select="ImpuestosDet[TipoImp = '03'][1]">
						<xsl:element name="cac:TaxTotal">
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:if test="TipoImp = '03'">
									<xsl:value-of select="format-number($SumImpDet03, '#0.00')"/>
								</xsl:if>
							</xsl:element>
							<xsl:element name="cbc:RoundingAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number($SumBaseImpDet03, '#0.00')"/>
							</xsl:element>
							<xsl:for-each select="../ImpuestosDet[TipoImp = '03']">
								<xsl:element name="cac:TaxSubtotal">
									<xsl:if test="not(PrecioPorUnidad)">
										<xsl:element name="cbc:TaxableAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of
												select="normalize-space(format-number(MontoBaseImp, '#0.00'))"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cbc:TaxAmount">
										<xsl:attribute name="currencyID">
											<xsl:value-of select="$MonedaC"/>
										</xsl:attribute>
										<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
									</xsl:element>
									<xsl:if test="UnidadMedida">
										<xsl:element name="cbc:BaseUnitMeasure">
											<xsl:attribute name="unitCode">
												<xsl:value-of select="UnidadMedida"/>
											</xsl:attribute>
											<xsl:value-of select="'1.000000'"/>
										</xsl:element>
									</xsl:if>
									<xsl:if test="PrecioPorUnidad">
										<xsl:element name="cbc:PerUnitAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cac:TaxCategory">
										<xsl:if test="not(PrecioPorUnidad)">
											<xsl:choose>
												<xsl:when test="TipoImp = '03'">
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
													</xsl:element>
												</xsl:when>
												<xsl:otherwise>
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
													</xsl:element>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:element name="cac:TaxScheme">
											<xsl:element name="cbc:ID">
												<xsl:value-of select="TipoImp"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:call-template name="TipoImpuesto">
													<xsl:with-param name="TpoImp">
														<xsl:value-of select="TipoImp"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:for-each>
						</xsl:element>
					</xsl:for-each>
					<xsl:for-each select="ImpuestosDet[TipoImp = '04'][1]">
						<xsl:element name="cac:TaxTotal">
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:if test="TipoImp = '04'">
									<xsl:value-of select="format-number($SumImpDet04, '#0.00')"/>
								</xsl:if>
							</xsl:element>
							<xsl:element name="cbc:RoundingAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number($SumBaseImpDet04, '#0.00')"/>
							</xsl:element>
							<xsl:for-each select="../ImpuestosDet[TipoImp = '04']">
								<xsl:element name="cac:TaxSubtotal">
									<xsl:if test="not(PrecioPorUnidad)">
										<xsl:element name="cbc:TaxableAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of
												select="normalize-space(format-number(MontoBaseImp, '#0.00'))"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cbc:TaxAmount">
										<xsl:attribute name="currencyID">
											<xsl:value-of select="$MonedaC"/>
										</xsl:attribute>
										<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
									</xsl:element>
									<xsl:if test="UnidadMedida">
										<xsl:element name="cbc:BaseUnitMeasure">
											<xsl:attribute name="unitCode">
												<xsl:value-of select="UnidadMedida"/>
											</xsl:attribute>
											<xsl:value-of select="'1.000000'"/>
										</xsl:element>
									</xsl:if>
									<xsl:if test="PrecioPorUnidad">
										<xsl:element name="cbc:PerUnitAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cac:TaxCategory">
										<xsl:if test="not(PrecioPorUnidad)">
											<xsl:choose>
												<xsl:when test="TipoImp = '03'">
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
													</xsl:element>
												</xsl:when>
												<xsl:otherwise>
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
													</xsl:element>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:element name="cac:TaxScheme">
											<xsl:element name="cbc:ID">
												<xsl:value-of select="TipoImp"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:call-template name="TipoImpuesto">
													<xsl:with-param name="TpoImp">
														<xsl:value-of select="TipoImp"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:for-each>
						</xsl:element>
					</xsl:for-each>
					<xsl:for-each select="ImpuestosDet[TipoImp = '20'][1]">
						<xsl:element name="cac:TaxTotal">
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:if test="TipoImp = '20'">
									<xsl:value-of select="format-number($SumImpDet20, '#0.00')"/>
								</xsl:if>
							</xsl:element>
							<xsl:for-each select="../ImpuestosDet[TipoImp = '20']">
								<xsl:element name="cac:TaxSubtotal">
									<xsl:if test="not(PrecioPorUnidad)">
										<xsl:element name="cbc:TaxableAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of
												select="normalize-space(format-number(MontoBaseImp, '#0.00'))"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cbc:TaxAmount">
										<xsl:attribute name="currencyID">
											<xsl:value-of select="$MonedaC"/>
										</xsl:attribute>
										<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
									</xsl:element>
									<xsl:if test="UnidadMedida">
										<xsl:element name="cbc:BaseUnitMeasure">
											<xsl:attribute name="unitCode">
												<xsl:value-of select="UnidadMedida"/>
											</xsl:attribute>
											<xsl:value-of select="'1.000000'"/>
										</xsl:element>
									</xsl:if>
									<xsl:if test="PrecioPorUnidad">
										<xsl:element name="cbc:PerUnitAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cac:TaxCategory">
										<xsl:if test="not(PrecioPorUnidad)">
											<xsl:choose>
												<xsl:when test="TipoImp = '03'">
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
													</xsl:element>
												</xsl:when>
												<xsl:otherwise>
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
													</xsl:element>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:element name="cac:TaxScheme">
											<xsl:element name="cbc:ID">
												<xsl:value-of select="TipoImp"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:call-template name="TipoImpuesto">
													<xsl:with-param name="TpoImp">
														<xsl:value-of select="TipoImp"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:for-each>
						</xsl:element>
					</xsl:for-each>
					<xsl:for-each select="ImpuestosDet[TipoImp = '21'][1]">
						<xsl:element name="cac:TaxTotal">
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:if test="TipoImp = '21'">
									<xsl:value-of select="format-number($SumImpDet21, '#0.00')"/>
								</xsl:if>
							</xsl:element>
							<xsl:for-each select="../ImpuestosDet[TipoImp = '21']">
								<xsl:element name="cac:TaxSubtotal">
									<xsl:if test="not(PrecioPorUnidad)">
										<xsl:element name="cbc:TaxableAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of
												select="normalize-space(format-number(MontoBaseImp, '#0.00'))"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cbc:TaxAmount">
										<xsl:attribute name="currencyID">
											<xsl:value-of select="$MonedaC"/>
										</xsl:attribute>
										<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
									</xsl:element>
									<xsl:if test="UnidadMedida">
										<xsl:element name="cbc:BaseUnitMeasure">
											<xsl:attribute name="unitCode">
												<xsl:value-of select="UnidadMedida"/>
											</xsl:attribute>
											<xsl:value-of select="'1.000000'"/>
										</xsl:element>
									</xsl:if>
									<xsl:if test="PrecioPorUnidad">
										<xsl:element name="cbc:PerUnitAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cac:TaxCategory">
										<xsl:if test="not(PrecioPorUnidad)">
											<xsl:choose>
												<xsl:when test="TipoImp = '03'">
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
													</xsl:element>
												</xsl:when>
												<xsl:otherwise>
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
													</xsl:element>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:element name="cac:TaxScheme">
											<xsl:element name="cbc:ID">
												<xsl:value-of select="TipoImp"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:call-template name="TipoImpuesto">
													<xsl:with-param name="TpoImp">
														<xsl:value-of select="TipoImp"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:for-each>
						</xsl:element>
					</xsl:for-each>
					<xsl:for-each select="ImpuestosDet[TipoImp = '22'][1]">
						<xsl:element name="cac:TaxTotal">
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:if test="TipoImp = '22'">
									<xsl:value-of select="format-number($SumImpDet22, '#0.00')"/>
								</xsl:if>
							</xsl:element>
							<xsl:for-each select="../ImpuestosDet[TipoImp = '22']">
								<xsl:element name="cac:TaxSubtotal">
									<xsl:if test="not(PrecioPorUnidad)">
										<xsl:element name="cbc:TaxableAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of
												select="normalize-space(format-number(MontoBaseImp, '#0.00'))"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cbc:TaxAmount">
										<xsl:attribute name="currencyID">
											<xsl:value-of select="$MonedaC"/>
										</xsl:attribute>
										<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
									</xsl:element>
									<xsl:if test="UnidadMedida">
										<xsl:element name="cbc:BaseUnitMeasure">
											<xsl:attribute name="unitCode">
												<xsl:value-of select="UnidadMedida"/>
											</xsl:attribute>
											<xsl:value-of select="'1.000000'"/>
										</xsl:element>
									</xsl:if>
									<xsl:if test="PrecioPorUnidad">
										<xsl:element name="cbc:PerUnitAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cac:TaxCategory">
										<xsl:if test="not(PrecioPorUnidad)">
											<xsl:choose>
												<xsl:when test="TipoImp = '03'">
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
													</xsl:element>
												</xsl:when>
												<xsl:otherwise>
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
													</xsl:element>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:element name="cac:TaxScheme">
											<xsl:element name="cbc:ID">
												<xsl:value-of select="TipoImp"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:call-template name="TipoImpuesto">
													<xsl:with-param name="TpoImp">
														<xsl:value-of select="TipoImp"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:for-each>
						</xsl:element>
					</xsl:for-each>
					<xsl:for-each select="ImpuestosDet[TipoImp = '23'][1]">
						<xsl:element name="cac:TaxTotal">
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:if test="TipoImp = '23'">
									<xsl:value-of select="format-number($SumImpDet23, '#0.00')"/>
								</xsl:if>
							</xsl:element>
							<xsl:for-each select="../ImpuestosDet[TipoImp = '23']">
								<xsl:element name="cac:TaxSubtotal">
									<xsl:if test="not(PrecioPorUnidad)">
										<xsl:element name="cbc:TaxableAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of
												select="normalize-space(format-number(MontoBaseImp, '#0.00'))"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cbc:TaxAmount">
										<xsl:attribute name="currencyID">
											<xsl:value-of select="$MonedaC"/>
										</xsl:attribute>
										<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
									</xsl:element>
									<xsl:if test="UnidadMedida">
										<xsl:element name="cbc:BaseUnitMeasure">
											<xsl:attribute name="unitCode">
												<xsl:value-of select="UnidadMedida"/>
											</xsl:attribute>
											<xsl:value-of select="'1.000000'"/>
										</xsl:element>
									</xsl:if>
									<xsl:if test="PrecioPorUnidad">
										<xsl:element name="cbc:PerUnitAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cac:TaxCategory">
										<xsl:if test="not(PrecioPorUnidad)">
											<xsl:choose>
												<xsl:when test="TipoImp = '03'">
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
													</xsl:element>
												</xsl:when>
												<xsl:otherwise>
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
													</xsl:element>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:element name="cac:TaxScheme">
											<xsl:element name="cbc:ID">
												<xsl:value-of select="TipoImp"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:call-template name="TipoImpuesto">
													<xsl:with-param name="TpoImp">
														<xsl:value-of select="TipoImp"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:for-each>
						</xsl:element>
					</xsl:for-each>
					<xsl:for-each select="ImpuestosDet[TipoImp = '24'][1]">
						<xsl:element name="cac:TaxTotal">
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:if test="TipoImp = '24'">
									<xsl:value-of select="format-number($SumImpDet24, '#0.00')"/>
								</xsl:if>
							</xsl:element>
							<xsl:for-each select="../ImpuestosDet[TipoImp = '24']">
								<xsl:element name="cac:TaxSubtotal">
									<xsl:if test="not(PrecioPorUnidad)">
										<xsl:element name="cbc:TaxableAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of
												select="normalize-space(format-number(MontoBaseImp, '#0.00'))"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cbc:TaxAmount">
										<xsl:attribute name="currencyID">
											<xsl:value-of select="$MonedaC"/>
										</xsl:attribute>
										<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
									</xsl:element>
									<xsl:if test="UnidadMedida">
										<xsl:element name="cbc:BaseUnitMeasure">
											<xsl:attribute name="unitCode">
												<xsl:value-of select="UnidadMedida"/>
											</xsl:attribute>
											<xsl:value-of select="'1.000000'"/>
										</xsl:element>
									</xsl:if>
									<xsl:if test="PrecioPorUnidad">
										<xsl:element name="cbc:PerUnitAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cac:TaxCategory">
										<xsl:if test="not(PrecioPorUnidad)">
											<xsl:choose>
												<xsl:when test="TipoImp = '03'">
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
													</xsl:element>
												</xsl:when>
												<xsl:otherwise>
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
													</xsl:element>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:element name="cac:TaxScheme">
											<xsl:element name="cbc:ID">
												<xsl:value-of select="TipoImp"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:call-template name="TipoImpuesto">
													<xsl:with-param name="TpoImp">
														<xsl:value-of select="TipoImp"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:for-each>
						</xsl:element>
					</xsl:for-each>
					<xsl:for-each select="ImpuestosDet[TipoImp = '25'][1]">
						<xsl:element name="cac:TaxTotal">
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:if test="TipoImp = '25'">
									<xsl:value-of select="format-number($SumImpDet25, '#0.00')"/>
								</xsl:if>
							</xsl:element>
							<xsl:for-each select="../ImpuestosDet[TipoImp = '25']">
								<xsl:element name="cac:TaxSubtotal">
									<xsl:if test="not(PrecioPorUnidad)">
										<xsl:element name="cbc:TaxableAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of
												select="normalize-space(format-number(MontoBaseImp, '#0.00'))"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cbc:TaxAmount">
										<xsl:attribute name="currencyID">
											<xsl:value-of select="$MonedaC"/>
										</xsl:attribute>
										<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
									</xsl:element>
									<xsl:if test="UnidadMedida">
										<xsl:element name="cbc:BaseUnitMeasure">
											<xsl:attribute name="unitCode">
												<xsl:value-of select="UnidadMedida"/>
											</xsl:attribute>
											<xsl:value-of select="'1.000000'"/>
										</xsl:element>
									</xsl:if>
									<xsl:if test="PrecioPorUnidad">
										<xsl:element name="cbc:PerUnitAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cac:TaxCategory">
										<xsl:if test="not(PrecioPorUnidad)">
											<xsl:choose>
												<xsl:when test="TipoImp = '03'">
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
													</xsl:element>
												</xsl:when>
												<xsl:otherwise>
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
													</xsl:element>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:element name="cac:TaxScheme">
											<xsl:element name="cbc:ID">
												<xsl:value-of select="TipoImp"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:call-template name="TipoImpuesto">
													<xsl:with-param name="TpoImp">
														<xsl:value-of select="TipoImp"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:for-each>
						</xsl:element>
					</xsl:for-each>
					<xsl:for-each select="ImpuestosDet[TipoImp = '26'][1]">
						<xsl:element name="cac:TaxTotal">
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:if test="TipoImp = '26'">
									<xsl:value-of select="format-number($SumImpDet26, '#0.00')"/>
								</xsl:if>
							</xsl:element>
							<xsl:for-each select="../ImpuestosDet[TipoImp = '26']">
								<xsl:element name="cac:TaxSubtotal">
									<xsl:if test="not(PrecioPorUnidad)">
										<xsl:element name="cbc:TaxableAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of
												select="normalize-space(format-number(MontoBaseImp, '#0.00'))"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cbc:TaxAmount">
										<xsl:attribute name="currencyID">
											<xsl:value-of select="$MonedaC"/>
										</xsl:attribute>
										<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
									</xsl:element>
									<xsl:if test="UnidadMedida">
										<xsl:element name="cbc:BaseUnitMeasure">
											<xsl:attribute name="unitCode">
												<xsl:value-of select="UnidadMedida"/>
											</xsl:attribute>
											<xsl:value-of select="'1.000000'"/>
										</xsl:element>
									</xsl:if>
									<xsl:if test="PrecioPorUnidad">
										<xsl:element name="cbc:PerUnitAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cac:TaxCategory">
										<xsl:if test="not(PrecioPorUnidad)">
											<xsl:choose>
												<xsl:when test="TipoImp = '03'">
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
													</xsl:element>
												</xsl:when>
												<xsl:otherwise>
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
													</xsl:element>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:element name="cac:TaxScheme">
											<xsl:element name="cbc:ID">
												<xsl:value-of select="TipoImp"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:call-template name="TipoImpuesto">
													<xsl:with-param name="TpoImp">
														<xsl:value-of select="TipoImp"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:for-each>
						</xsl:element>
					</xsl:for-each>
					<xsl:for-each select="SubDscto">
						<xsl:element name="cac:AllowanceCharge">
							<xsl:element name="cbc:ID">
								<xsl:value-of select="position()"/>
							</xsl:element>
							<xsl:element name="cbc:ChargeIndicator">
								<xsl:value-of select="false()"/>
							</xsl:element>
							<xsl:element name="cbc:AllowanceChargeReason">
								<xsl:value-of select="GlosaDscto"/>
							</xsl:element>
							<xsl:element name="cbc:MultiplierFactorNumeric">
								<xsl:value-of select="format-number(PctDscto, '#0.00')"/>
							</xsl:element>
							<xsl:element name="cbc:Amount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number(MntDscto, '#0.00')"/>
							</xsl:element>
							<xsl:element name="cbc:BaseAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of
									select="format-number((../PrcBrutoItem * ../QtyItem), '#0.00')"
								/>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
					<!--Item' charges-->
					<xsl:for-each select="SubRecargo">
						<xsl:element name="cac:AllowanceCharge">
							<xsl:element name="cbc:ID">
								<xsl:value-of select="position()"/>
							</xsl:element>
							<xsl:element name="cbc:ChargeIndicator">
								<xsl:value-of select="true()"/>
							</xsl:element>
							<xsl:element name="cbc:AllowanceChargeReason">
								<xsl:value-of select="GlosaRecargo"/>
							</xsl:element>
							<xsl:element name="cbc:MultiplierFactorNumeric">
								<xsl:value-of select="PctRecargo"/>
							</xsl:element>
							<xsl:element name="cbc:Amount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number(MntRecargo, '#0.00')"/>
							</xsl:element>
							<xsl:element name="cbc:BaseAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of
									select="format-number((../PrcBrutoItem * ../QtyItem), '#0.00')"
								/>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
					<xsl:element name="cac:Item">
						<!--Description of the item-->
						<xsl:element name="cbc:Description">
							<xsl:value-of select="DscItem"/>
						</xsl:element>
						<xsl:if test="CdgItem[TpoCodigo = 'INT']/VlrCodigo != ''">
							<xsl:element name="cac:SellersItemIdentification">
								<xsl:element name="cbc:ID">
									<xsl:value-of select="CdgItem[TpoCodigo = 'INT']/VlrCodigo"/>
								</xsl:element>
							</xsl:element>
						</xsl:if>
						<xsl:choose>
							<xsl:when test="CdgItem[1]/TpoCodigo != '' and CdgItem[2]/TpoCodigo != ''">
								<xsl:if test="CdgItem[TpoCodigo = '001']/VlrCodigo != ''">
									<xsl:element name="cac:StandardItemIdentification">
										<xsl:element name="cbc:ID">
											<xsl:attribute name="schemeID">
												<xsl:text>001</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeName">
												<xsl:text>UNSPSC</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeAgencyID">
												<xsl:text>10</xsl:text>
											</xsl:attribute>
											<xsl:value-of select="CdgItem[TpoCodigo = '001']/VlrCodigo"/>
										</xsl:element>
									</xsl:element>
								</xsl:if>
								<xsl:if test="CdgItem[TpoCodigo = '010']/VlrCodigo != ''">
									<xsl:element name="cac:StandardItemIdentification">
										<xsl:element name="cbc:ID">
											<xsl:attribute name="schemeID">
												<xsl:text>010</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeName">
												<xsl:text>GTIN</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeAgencyID">
												<xsl:text>9</xsl:text>
											</xsl:attribute>
											<xsl:value-of
												select="format-number(CdgItem[TpoCodigo = '010']/VlrCodigo, '#00000000000000')"
											/>
										</xsl:element>
									</xsl:element>
								</xsl:if>
								<xsl:if test="CdgItem[TpoCodigo = '020']/VlrCodigo != ''">
									<xsl:element name="cac:StandardItemIdentification">
										<xsl:element name="cbc:ID">
											<xsl:attribute name="schemeID">
												<xsl:text>020</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeName">
												<xsl:text>Partida Aranceraria</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeAgencyID">
												<xsl:text>195</xsl:text>
											</xsl:attribute>
											<xsl:value-of select="CdgItem[TpoCodigo = '020']/VlrCodigo"/>
										</xsl:element>
									</xsl:element>
								</xsl:if>
								<xsl:if test="CdgItem[TpoCodigo = 'EAN13']/VlrCodigo != ''">
									<xsl:element name="cac:StandardItemIdentification">
										<xsl:element name="cbc:ID">
											<xsl:attribute name="schemeID">
												<xsl:text>999</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeName">
												<xsl:text>EAN13</xsl:text>
											</xsl:attribute>
											<xsl:value-of select="CdgItem[TpoCodigo = 'EAN13']/VlrCodigo"/>
										</xsl:element>
									</xsl:element>
								</xsl:if>
							</xsl:when>
							<xsl:otherwise>
								<xsl:if test="CdgItem[TpoCodigo = '001']/VlrCodigo != ''">
									<xsl:element name="cac:StandardItemIdentification">
										<xsl:element name="cbc:ID">
											<xsl:attribute name="schemeID">
												<xsl:text>001</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeName">
												<xsl:text>UNSPSC</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeAgencyID">
												<xsl:text>10</xsl:text>
											</xsl:attribute>
											<xsl:value-of select="CdgItem[TpoCodigo = '001']/VlrCodigo"/>
										</xsl:element>
									</xsl:element>
								</xsl:if>
								<xsl:if test="CdgItem[TpoCodigo = '010']/VlrCodigo != ''">
									<xsl:element name="cac:StandardItemIdentification">
										<xsl:element name="cbc:ID">
											<xsl:attribute name="schemeID">
												<xsl:text>010</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeName">
												<xsl:text>GTIN</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeAgencyID">
												<xsl:text>9</xsl:text>
											</xsl:attribute>
											<xsl:value-of
												select="format-number(CdgItem[TpoCodigo = '010']/VlrCodigo, '#00000000000000')"
											/>
										</xsl:element>
									</xsl:element>
								</xsl:if>
								<xsl:if test="CdgItem[TpoCodigo = '020']/VlrCodigo != ''">
									<xsl:element name="cac:StandardItemIdentification">
										<xsl:element name="cbc:ID">
											<xsl:attribute name="schemeID">
												<xsl:text>020</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeName">
												<xsl:text>Partida Aranceraria</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeAgencyID">
												<xsl:text>195</xsl:text>
											</xsl:attribute>
											<xsl:value-of select="CdgItem[TpoCodigo = '020']/VlrCodigo"/>
										</xsl:element>
									</xsl:element>
								</xsl:if>
								<xsl:if test="CdgItem[TpoCodigo = '999']/VlrCodigo != ''">
									<xsl:element name="cac:StandardItemIdentification">
										<xsl:element name="cbc:ID">
											<xsl:attribute name="schemeID">
												<xsl:text>999</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeName">
												<xsl:text>EAN13</xsl:text>
											</xsl:attribute>
											<xsl:value-of select="CdgItem[TpoCodigo = '999']/VlrCodigo"/>
										</xsl:element>
									</xsl:element>
								</xsl:if>
								<xsl:if test="CdgItem[TpoCodigo = 'EAN13']/VlrCodigo != ''">
									<xsl:element name="cac:StandardItemIdentification">
										<xsl:element name="cbc:ID">
											<xsl:attribute name="schemeID">
												<xsl:text>999</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeName">
												<xsl:text>EAN13</xsl:text>
											</xsl:attribute>
											<xsl:value-of select="CdgItem[TpoCodigo = 'EAN13']/VlrCodigo"/>
										</xsl:element>
									</xsl:element>
								</xsl:if>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:if test="CdgItem[TpoCodigo = '999']/VlrCodigo != ''">
							<xsl:element name="cac:AdditionalItemIdentification">
								<xsl:element name="cbc:ID">
									<xsl:attribute name="schemeID">
										<xsl:text>999</xsl:text>
									</xsl:attribute>
									<xsl:attribute name="schemeName">
										<xsl:text>EAN13</xsl:text>
									</xsl:attribute>
									<xsl:value-of select="CdgItem[TpoCodigo = '999']/VlrCodigo"/>
								</xsl:element>
							</xsl:element>
						</xsl:if>
						<!--Informacion transportista-->
						
						<xsl:if test="(//IdDoc/TipoServicio = '12') and ServicioItem[position()]/Numero !=''">
							<xsl:element name="cac:AdditionalItemProperty">
								<xsl:element name="cbc:Name">
									<xsl:text>01</xsl:text>
								</xsl:element>
								<xsl:element name="cbc:Value">
									<xsl:value-of select="ServicioItem/Numero"/>
								</xsl:element>
							</xsl:element>
							<xsl:element name="cac:AdditionalItemProperty">
								<xsl:element name="cbc:Name">
									<xsl:text>02</xsl:text>
								</xsl:element>
								<xsl:element name="cbc:Value">
									<xsl:value-of select="ServicioItem/NroExp"/>
								</xsl:element>
							</xsl:element>
							<xsl:element name="cac:AdditionalItemProperty">
								<xsl:element name="cbc:Name">
									<xsl:text>03</xsl:text>
								</xsl:element>
								<xsl:element name="cbc:Value">
									<xsl:value-of select="ServicioItem/RazonServ"/>
								</xsl:element>
								<xsl:element name="cbc:ValueQuantity">
									<xsl:attribute name="unitCode">
										<xsl:value-of select="UnmdItem"/>
									</xsl:attribute>
									<xsl:value-of select="ServicioItem/Ejecutor"/>
								</xsl:element>
							</xsl:element>
						</xsl:if>
						
						<!--Informacion del Mandante-->
						<xsl:if
							test="(//IdDoc/TipoServicio = '11' or //IdDoc/TipoServicio = '12' or //IdDoc/TipoServicio = '20' or //IdDoc/TipoServicio = '22' or //IdDoc/TipoServicio = '23') and ServicioItem/Mandante!=''">
							<xsl:element name="cac:InformationContentProviderParty">
								<xsl:element name="cac:PowerOfAttorney">
									<xsl:element name="cac:AgentParty">
										<xsl:element name="cac:PartyIdentification">
											<xsl:element name="cbc:ID">
												<xsl:attribute name="schemeID">
												<xsl:call-template name="calculNIT-dv">
												<xsl:with-param name="NIT">
												<xsl:value-of select="ServicioItem/Mandante"/>
												</xsl:with-param>
												</xsl:call-template>
												</xsl:attribute>
												<xsl:attribute name="schemeName">
												<xsl:text>31</xsl:text>
												</xsl:attribute>
												<xsl:attribute name="schemeAgencyID">
												<xsl:text>195</xsl:text>
												</xsl:attribute>
												<xsl:value-of select="ServicioItem/Mandante"/>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:if>
					</xsl:element>
					<!--Unit Price-->
					<xsl:element name="cac:Price">
						<xsl:element name="cbc:PriceAmount">
							<xsl:attribute name="currencyID">
								<xsl:value-of select="$MonedaC"/>
							</xsl:attribute>
							<xsl:value-of
								select="normalize-space(format-number(PrcBrutoItem, '#0.00'))"/>
						</xsl:element>
						<xsl:element name="cbc:BaseQuantity">
							<!--Unit of Measure -->
							<xsl:attribute name="unitCode">
								<xsl:value-of select="UnmdItem"/>
							</xsl:attribute>
							<xsl:value-of select="format-number(QtyItem, '#0.000000')"/>
						</xsl:element>
					</xsl:element>
				</xsl:element>
			</xsl:for-each>
			<xsl:element name="Personalizados">
				<xsl:element name="DocPersonalizado">
					<xsl:attribute name="dteID">
						<xsl:value-of select="/DTE/Personalizados/DocPersonalizado/@dteID"/>
					</xsl:attribute>
					<xsl:element name="campoString">
						<xsl:attribute name="name">
							<xsl:text>QRCode</xsl:text>
						</xsl:attribute>
						<xsl:variable name="CUFE">
							<!--<xsl:value-of select="crypto:hash($CUFEString, 'SHA-384')"/>-->
							<xsl:value-of select="$CUFEString"/>
						</xsl:variable>
						<xsl:value-of select="concat('NumFac:=',concat(/DTE/Documento/Encabezado/IdDoc/Serie, /DTE/Documento/Encabezado/IdDoc/Numero))"/>
						<xsl:text>
								</xsl:text>
						<xsl:value-of select="concat('FecFac:',substring(/DTE/Documento/Encabezado/IdDoc/FechaEmis, 1, 10))"/>
						<xsl:text>
								</xsl:text>
						<xsl:value-of select="concat('HorFac:',substring(/DTE/Documento/Encabezado/IdDoc/FechaEmis, 12, 8),'-05:00')"/>
						<xsl:text>
								</xsl:text>
						<xsl:value-of select="concat('NitFac:',normalize-space(/DTE/Documento/Encabezado/Emisor/IDEmisor))"/>
						<xsl:text>
								</xsl:text>
						<xsl:value-of select="concat('DocAdq:',normalize-space(/DTE/Documento/Encabezado/Receptor/DocRecep/NroDocRecep))"/>
						<xsl:text>
								</xsl:text>
						<xsl:value-of select="concat('ValFac:',format-number(/DTE/Documento/Encabezado/Totales/SubTotal,'#0.00'))"/>
						<xsl:text>
								</xsl:text>
						<xsl:value-of select="concat('ValIva:',format-number(/DTE/Documento/Encabezado/Totales/MntImp,'#0.00'))"/>
						<xsl:text>
								</xsl:text>
						<xsl:choose>
							<xsl:when test="/DTE/Documento/Encabezado/Totales/MntRet !=''">
								<xsl:value-of select="concat('ValOtroIm:',format-number(/DTE/Documento/Encabezado/Totales/VlrPagar,'#0.00'))"/>
								<xsl:text>
								</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="'ValOtroIm:'"/>
								<xsl:text>
								</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:value-of select="concat('ValTolFac:',format-number(/DTE/Documento/Encabezado/Totales/VlrPagar,'#0.00'))"/>
						<xsl:text>
								</xsl:text>
						<xsl:value-of select="concat('CUFE:',$CUFE)"/>
						<xsl:text>
								</xsl:text>
						<xsl:choose>
							<xsl:when test="/DTE/Documento/Encabezado/IdDoc/Ambiente = 2 and not(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo')">
								<xsl:value-of select="concat('QRCode:','https://catalogo-vpfe-hab.dian.gov.co/document/searchqr?documentkey=',$CUFE)"/>
							</xsl:when>
							<xsl:when test="/DTE/Documento/Encabezado/IdDoc/Ambiente = 1 and not(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo')">
								<xsl:value-of select="concat('QRCode:','https://catalogo-vpfe.dian.gov.co/document/searchqr?documentkey=',$CUFE)"/>
							</xsl:when>
							<xsl:when test="/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo'">
								<xsl:value-of select="concat('QRCode:','https://catalogo-vpfe.dian.gov.co/document/searchqr?documentkey=',$CUFE)"/>
							</xsl:when>
						</xsl:choose>
					</xsl:element>
					<xsl:element name="campoString">
						<xsl:attribute name="name">
							<xsl:text>SERIE</xsl:text>
						</xsl:attribute>
						<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/Serie"/>
					</xsl:element>
					<xsl:element name="campoString">
						<xsl:attribute name="name">
							<xsl:text>FOLIO</xsl:text>
						</xsl:attribute>
						<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/Numero"/>
					</xsl:element>
					<xsl:element name="campoString">
						<xsl:attribute name="name">
							<xsl:text>FechaGeneracion</xsl:text>
						</xsl:attribute>
						<xsl:value-of select="substring(string(current-dateTime()), 1, 10)"/>
					</xsl:element>
					<xsl:element name="campoString">
						<xsl:attribute name="name">
							<xsl:text>HoraGeneracion</xsl:text>
						</xsl:attribute>
						<xsl:value-of select="substring(string(current-dateTime()), 12, 8)"/>
					</xsl:element>					
					<xsl:copy-of select="/DTE/Personalizados/DocPersonalizado/*"/>
					<xsl:for-each select="/DTE/Documento/Referencia[TpoDocRef = '90']">
						<xsl:element name="ImpresionReferencia">
							<xsl:element name="PersonNroLinRef">
								<xsl:value-of select="NroLinRef"/>
							</xsl:element>
							<xsl:element name="ECB02">
								<xsl:value-of select="ECB02"/>
							</xsl:element>
							<xsl:element name="ECB03">
								<xsl:value-of select="ECB03"/>
							</xsl:element>
							<xsl:element name="ECB04">
								<xsl:value-of select="ECB04"/>
							</xsl:element>
							<xsl:element name="ECB05">
								<xsl:value-of select="ECB05"/>
							</xsl:element>
							<xsl:element name="ECB06">
								<xsl:value-of select="ECB06"/>
							</xsl:element>
							<xsl:element name="ECB07">
								<xsl:value-of select="ECB07"/>
							</xsl:element>
							<xsl:element name="ECB08">
								<xsl:value-of select="ECB08"/>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:element>
		</CreditNote>
	</xsl:template>
	<xsl:template name="DEBITNOTE">
		<!--Gosocket DTE v1.2 CO to UBL 2.1 OASIS Oficial-->
		<DebitNote xmlns="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2"
			xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
			xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
			xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
			xmlns:sts="dian:gov:co:facturaelectronica:Structures-2-1"
			xmlns:xades="http://uri.etsi.org/01903/v1.3.2#"
			xmlns:xades141="http://uri.etsi.org/01903/v1.4.1#"
			xmlns:fn="http://www.w3.org/2005/xpath-functions">
			<!--xsi:schemaLocation="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2
			http://docs.oasis-open.org/ubl/os-UBL-2.1/xsd/maindoc/UBL-DebitNote-2.1.xsd">-->
			<!--var CurrencyType-->
			<xsl:variable name="MonedaC" select="normalize-space(//Moneda)"/>
			<!-- var CUFEString -->
			<xsl:variable name="CUFEString">
				<xsl:value-of
					select="
					concat(/DTE/Documento/Encabezado/IdDoc/Serie, /DTE/Documento/Encabezado/IdDoc/Numero, substring(/DTE/Documento/Encabezado/IdDoc/FechaEmis, 1, 10), if (string-length(substring-after(/DTE/Documento/Encabezado/IdDoc/FechaEmis, 'T')) != 9) then
					concat(substring-after(/DTE/Documento/Encabezado/IdDoc/FechaEmis, 'T'), '-05:00')
					else
					concat(substring(/DTE/Documento/Encabezado/IdDoc/FechaEmis, 12, 8), '-05:00'), format-number(/DTE/Documento/Encabezado/Totales/SubTotal, '#0.00'), '01', if (not(/DTE/Documento/Encabezado/Impuestos[TipoImp = '01']/MontoImp)) then
					'0.00'
					else
					format-number(sum(/DTE/Documento/Encabezado/Impuestos[TipoImp = '01']/MontoImp), '#0.00'), '04', if (not(/DTE/Documento/Encabezado/Impuestos[TipoImp = '04']/MontoImp)) then
					'0.00'
					else
					format-number(sum(/DTE/Documento/Encabezado/Impuestos[TipoImp = '04']/MontoImp), '#0.00'), '03', if (not(/DTE/Documento/Encabezado/Impuestos[TipoImp = '03']/MontoImp)) then
					'0.00'
					else
					format-number(sum(/DTE/Documento/Encabezado/Impuestos[TipoImp = '03']/MontoImp), '#0.00'), format-number(/DTE/Documento/Encabezado/Totales/VlrPagar, '#0.00'), /DTE/Documento/Encabezado/Emisor/IDEmisor, /DTE/Documento/Encabezado/Receptor/DocRecep/NroDocRecep, /DTE/Documento/CAE/ClaveTC, /DTE/Documento/Encabezado/IdDoc/Ambiente)"
				/>
			</xsl:variable>
			<xsl:variable name="CodigoSoftware">
				<xsl:choose>
					<xsl:when test="/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo'">
						<xsl:text>fa326ca7-c1f8-40d3-a6fc-24d7c1040607</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>56f2ae4e-9812-4fad-9255-08fcfcd5ccb0</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<!--EXTENSIONES DEFINIDAS POR DIAN-->
			<xsl:element name="ext:UBLExtensions">
				<xsl:element name="ext:UBLExtension">
					<xsl:element name="ext:ExtensionContent">
						<sts:DianExtensions>
							<xsl:element name="sts:InvoiceSource">
								<xsl:element name="cbc:IdentificationCode">
									<xsl:attribute name="listAgencyID">
										<xsl:text>6</xsl:text>
									</xsl:attribute>
									<xsl:attribute name="listAgencyName">
										<xsl:text>United Nations Economic Commission for Europe</xsl:text>
									</xsl:attribute>
									<xsl:attribute name="listSchemeURI">
										<xsl:text>urn:oasis:names:specification:ubl:codelist:gc:CountryIdentificationCode-2.1</xsl:text>
									</xsl:attribute>
									<xsl:text>CO</xsl:text>
								</xsl:element>
							</xsl:element>
							<xsl:element name="sts:SoftwareProvider">
								<xsl:element name="sts:ProviderID">
									<xsl:attribute name="schemeID">
										<xsl:choose>
											<xsl:when test="/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo'">
												<xsl:call-template name="calculNIT-dv">
													<xsl:with-param name="NIT">
														<xsl:text>800197268</xsl:text>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="calculNIT-dv">
													<xsl:with-param name="NIT">
														<xsl:text>900508908</xsl:text>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
									<xsl:attribute name="schemeName">
										<xsl:text>31</xsl:text>
									</xsl:attribute>
									<xsl:attribute name="schemeAgencyID">
										<xsl:text>195</xsl:text>
									</xsl:attribute>
									<xsl:attribute name="schemeAgencyName">
										<xsl:text>CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)</xsl:text>
									</xsl:attribute>
									<xsl:choose>
										<xsl:when test="/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo'">
											<!-- NIT DIAN como proveedor tecnologico (Facturador Gratuito) -->
											<xsl:text>800197268</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<!-- NIT Gosocket como proveedor tecnologico (Todos los productos) -->
											<xsl:text>900508908</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:element>
								<xsl:element name="sts:SoftwareID">
									<xsl:attribute name="schemeAgencyID">
										<xsl:text>195</xsl:text>
									</xsl:attribute>
									<xsl:attribute name="schemeAgencyName">
										<xsl:text>CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)</xsl:text>
									</xsl:attribute>
									<xsl:choose>
										<xsl:when
											test="/DTE/Documento/Encabezado/IdDoc/Area/IdArea != ''">
											<xsl:value-of
												select="/DTE/Documento/Encabezado/IdDoc/Area/IdArea"
											/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="$CodigoSoftware"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:element>
							</xsl:element>
							<xsl:element name="sts:SoftwareSecurityCode">
								<xsl:attribute name="schemeAgencyID">
									<xsl:text>195</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="schemeAgencyName">
									<xsl:text>CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)</xsl:text>
								</xsl:attribute>
								<xsl:choose>
									<!-- Test si existe Codigo Software y Pin software en DTE. -->
									<xsl:when test="/DTE/Documento/Encabezado/IdDoc/Area/IdArea != '' and /DTE/Documento/Encabezado/IdDoc/Area/IdRevision != ''">
										<!-- Clave seguridad del software en caso de tener la informacion en DTE. -->
										<xsl:variable name="CodigoSeguridad">
											<xsl:value-of select="concat(/DTE/Documento/Encabezado/IdDoc/Area/IdArea, /DTE/Documento/Encabezado/IdDoc/Area/IdRevision, /DTE/Documento/Encabezado/IdDoc/Serie, /DTE/Documento/Encabezado/IdDoc/Numero)" />
										</xsl:variable>
										<xsl:value-of select="$CodigoSeguridad" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:choose>
											<xsl:when test="/DTE/Documento/Encabezado/IdDoc/Ambiente = 2">
												<!-- Si es ambiente de pruebas -->
												<xsl:variable name="CodigoSeguridad">
													<xsl:value-of select="concat($CodigoSoftware, '20191', /DTE/Documento/Encabezado/IdDoc/Serie, /DTE/Documento/Encabezado/IdDoc/Numero)" />
												</xsl:variable>
												<xsl:value-of select="$CodigoSeguridad"/>
											</xsl:when>
											<xsl:otherwise>
												<!-- Si es ambiente de producción -->
												<xsl:variable name="CodigoSeguridad">
													<xsl:value-of select="concat($CodigoSoftware, '20191', /DTE/Documento/Encabezado/IdDoc/Serie, /DTE/Documento/Encabezado/IdDoc/Numero)" />
												</xsl:variable>
												<xsl:value-of select="$CodigoSeguridad"/>
												<!--<xsl:value-of
												select="crypto:hash($CodigoSeguridad, 'SHA-384')"
												/>-->
											</xsl:otherwise>
										</xsl:choose>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:element>
							<xsl:element name="sts:AuthorizationProvider">
								<xsl:element name="sts:AuthorizationProviderID">
									<xsl:attribute name="schemeID">
										<xsl:call-template name="calculNIT-dv">
											<xsl:with-param name="NIT">
												<xsl:text>800197268</xsl:text>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:attribute>
									<xsl:attribute name="schemeName">
										<xsl:text>31</xsl:text>
									</xsl:attribute>
									<xsl:attribute name="schemeAgencyID">
										<xsl:text>195</xsl:text>
									</xsl:attribute>
									<xsl:attribute name="schemeAgencyName">
										<xsl:text>CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)</xsl:text>
									</xsl:attribute>
									<xsl:text>800197268</xsl:text>
								</xsl:element>
							</xsl:element>
							<xsl:element name="sts:QRCode">
								<xsl:variable name="CUFE">
									<!--<xsl:value-of select="crypto:hash($CUFEString, 'SHA-384')"/>-->
									<xsl:value-of select="$CUFEString"/>
								</xsl:variable>
								<!--<xsl:value-of select="concat('FechaFactura=',substring(/DTE/Documento/Encabezado/IdDoc/FechaEmis, 1, 10))"/>
								<xsl:text>
								</xsl:text>-->
								<xsl:choose>
									<xsl:when test="/DTE/Documento/Encabezado/IdDoc/Ambiente = 2 and not(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo')">
										<xsl:value-of select="concat('https://catalogo-vpfe-hab.dian.gov.co/document/searchqr?documentkey=',$CUFE)"/>
									</xsl:when>
									<xsl:when test="/DTE/Documento/Encabezado/IdDoc/Ambiente = 1 and not(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo')">
										<xsl:value-of select="concat('https://catalogo-vpfe.dian.gov.co/document/searchqr?documentkey=',$CUFE)"/>
									</xsl:when>
									<xsl:when test="/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo'">
										<xsl:value-of select="concat('https://catalogo-vpfe.dian.gov.co/document/searchqr?documentkey=',$CUFE)"/>
									</xsl:when>
								</xsl:choose>
							</xsl:element>
						</sts:DianExtensions>
					</xsl:element>
				</xsl:element>
			</xsl:element>
			<!--VersionUBL-->
			<xsl:element name="cbc:UBLVersionID">
				<xsl:text>UBL 2.1</xsl:text>
			</xsl:element>
			<!--Customization ID-->
			<xsl:element name="cbc:CustomizationID">
				<xsl:if test="not(/DTE/Documento/Encabezado/IdDoc/TipoServicio)">
					<xsl:text>1</xsl:text>
				</xsl:if>
				<xsl:if test="/DTE/Documento/Encabezado/IdDoc/TipoServicio">
					<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/TipoServicio"/>
				</xsl:if>
			</xsl:element>
			<!--VersionProfile-->
			<xsl:element name="cbc:ProfileID">
				<xsl:text>DIAN 2.1: Nota Débito de Factura Electrónica de Venta</xsl:text>
			</xsl:element>
			<!--Ambiente de destino-->
			<xsl:variable name="Ambiente">
				<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/Ambiente"/>
			</xsl:variable>
			<xsl:element name="cbc:ProfileExecutionID">
				<xsl:value-of select="$Ambiente"/>
			</xsl:element>
			<!--Number of the Invoice-->
			<xsl:element name="cbc:ID">
				<xsl:value-of
					select="normalize-space(concat(/DTE/Documento/Encabezado/IdDoc/Serie, /DTE/Documento/Encabezado/IdDoc/Numero))"
				/>
			</xsl:element>
			<!--CUFE of the Invoice-->
			<xsl:element name="cbc:UUID">
				<xsl:attribute name="schemeID">
					<xsl:value-of select="$Ambiente"/>
				</xsl:attribute>
				<xsl:attribute name="schemeName">
					<xsl:text>CUDE-SHA384</xsl:text>
				</xsl:attribute>
				<xsl:variable name="CUFE">
					<xsl:value-of select="$CUFEString"/>
					<!--<xsl:value-of select="crypto:hash($CUFEString, 'SHA-384')"/>-->
				</xsl:variable>
				<xsl:value-of select="$CUFE"/>
			</xsl:element>
			<!--Issuing Date of the document -->
			<xsl:element name="cbc:IssueDate">
				<xsl:value-of select="substring(/DTE/Documento/Encabezado/IdDoc/FechaEmis, 1, 10)"/>
			</xsl:element>
			<!--Issuing Time of the document -->
			<xsl:element name="cbc:IssueTime">
				<xsl:value-of
					select="concat(substring(/DTE/Documento/Encabezado/IdDoc/FechaEmis, 12, 8), '-05:00')"
				/>
			</xsl:element>
			<xsl:if test="/DTE/Documento/Encabezado/IdDoc/IndServicio != ''">
				<xsl:element name="cbc:Note">
					<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/IndServicio"/>
				</xsl:element>
			</xsl:if>
			<xsl:for-each select="DTE/Personalizados/DocPersonalizado/campoString[@name = 'Notas']">
				<xsl:if test=". != ''">
					<xsl:element name="cbc:Note">
						<xsl:value-of select="."/>
					</xsl:element>
				</xsl:if>
			</xsl:for-each>
			<!--Document Currency Type-->
			<xsl:element name="cbc:DocumentCurrencyCode">
				<xsl:attribute name="listID">
					<xsl:text>ISO 4217 Alpha</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="listAgencyID">
					<xsl:text>6</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="listAgencyName">
					<xsl:text>United Nations Economic Commission for Europe</xsl:text>
				</xsl:attribute>
				<xsl:value-of select="$MonedaC"/>
			</xsl:element>
			<xsl:element name="cbc:LineCountNumeric">
				<xsl:value-of select="count(//DTE/Documento/Detalle)"/>
			</xsl:element>
			<!-- Periodo de Facturacion -->
			<xsl:if test="/DTE/Documento/Encabezado/IdDoc/PeriodoDesde">
				<xsl:element name="cac:InvoicePeriod">
					<xsl:element name="cbc:StartDate">
						<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/PeriodoDesde"/>
					</xsl:element>
					<xsl:element name="cbc:EndDate">
						<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/PeriodoHasta"/>
					</xsl:element>
				</xsl:element>
			</xsl:if>
			<!--DISCREPANCY RESPONSE-->
			<xsl:for-each select="//Referencia">
				<xsl:choose>
					<xsl:when test="TpoDocRef = '01'">
						<xsl:element name="cac:DiscrepancyResponse">
							<xsl:element name="cbc:ReferenceID">
								<xsl:value-of select="SerieRef"/>
								<xsl:value-of select="NumeroRef"/>
							</xsl:element>
							<!--ResponceCode referente a al tipo de documento: 1 Devolución de parte de los bienes; no aceptación de partes del servicio,  2 Anulación de factura electrónica; 3 Rebaja total aplicada; 4 Descuento total aplicado; 5 Rescisión: nulidad por falta de requisitos; 6 Otros -->
							<xsl:element name="cbc:ResponseCode">
								<xsl:value-of select="CodRef"/>
							</xsl:element>
							<!-- Referente a la razon de referencia-->
							<xsl:element name="cbc:Description">
								<xsl:value-of select="RazonRef"/>
							</xsl:element>
						</xsl:element>
					</xsl:when>
					<xsl:when test="TpoDocRef = '02'">
						<xsl:element name="cac:DiscrepancyResponse">
							<xsl:element name="cbc:ReferenceID">
								<xsl:value-of select="SerieRef"/>
								<xsl:value-of select="NumeroRef"/>
							</xsl:element>
							<!--ResponceCode referente a al tipo de documento: 1 Devolución de parte de los bienes; no aceptación de partes del servicio,  2 Anulación de factura electrónica; 3 Rebaja total aplicada; 4 Descuento total aplicado; 5 Rescisión: nulidad por falta de requisitos; 6 Otros -->
							<xsl:element name="cbc:ResponseCode">
								<xsl:value-of select="CodRef"/>
							</xsl:element>
							<!-- Referente a la razon de referencia-->
							<xsl:element name="cbc:Description">
								<xsl:value-of select="RazonRef"/>
							</xsl:element>
						</xsl:element>
					</xsl:when>
					<xsl:when test="TpoDocRef = '03'">
						<xsl:element name="cac:DiscrepancyResponse">
							<xsl:element name="cbc:ReferenceID">
								<xsl:value-of select="SerieRef"/>
								<xsl:value-of select="NumeroRef"/>
							</xsl:element>
							<!--ResponceCode referente a al tipo de documento: 1 Devolución de parte de los bienes; no aceptación de partes del servicio,  2 Anulación de factura electrónica; 3 Rebaja total aplicada; 4 Descuento total aplicado; 5 Rescisión: nulidad por falta de requisitos; 6 Otros -->
							<xsl:element name="cbc:ResponseCode">
								<xsl:value-of select="CodRef"/>
							</xsl:element>
							<!-- Referente a la razon de referencia-->
							<xsl:element name="cbc:Description">
								<xsl:value-of select="RazonRef"/>
							</xsl:element>
						</xsl:element>
					</xsl:when>
					<xsl:when test="TpoDocRef = '04'">
						<xsl:element name="cac:DiscrepancyResponse">
							<xsl:element name="cbc:ReferenceID">
								<xsl:value-of select="SerieRef"/>
								<xsl:value-of select="NumeroRef"/>
							</xsl:element>
							<!--ResponceCode referente a al tipo de documento: 1 Devolución de parte de los bienes; no aceptación de partes del servicio,  2 Anulación de factura electrónica; 3 Rebaja total aplicada; 4 Descuento total aplicado; 5 Rescisión: nulidad por falta de requisitos; 6 Otros -->
							<xsl:element name="cbc:ResponseCode">
								<xsl:value-of select="CodRef"/>
							</xsl:element>
							<!-- Referente a la razon de referencia-->
							<xsl:element name="cbc:Description">
								<xsl:value-of select="RazonRef"/>
							</xsl:element>
						</xsl:element>
					</xsl:when>
				</xsl:choose>
			</xsl:for-each>
			<!--Reference for Purchase Order-->
			<xsl:variable name="OrdenCompra"
				select="/DTE/Documento/Referencia[TpoDocRef = 'OC'][1]/NumeroRef"/>
			<xsl:if test="$OrdenCompra != ''">
				<xsl:element name="cac:OrderReference">
					<xsl:element name="cbc:ID">
						<xsl:value-of select="$OrdenCompra"/>
					</xsl:element>
					<xsl:if test="/DTE/Documento/Referencia[TpoDocRef = 'OC'][1]/FechaRef">
						<xsl:element name="cbc:IssueDate">
							<xsl:value-of select="/DTE/Documento/Referencia[TpoDocRef = 'OC'][1]/FechaRef"/>
						</xsl:element>
					</xsl:if>
				</xsl:element>
			</xsl:if>
			<!--Referencias (Invoice | CreditNote | DebitNote)-->
			<xsl:for-each select="/DTE/Documento/Referencia">
				<xsl:choose>
					<xsl:when test="(TpoDocRef = '01' and (not(MontosRef/Monto) or MontosRef/Monto = '')) or TpoDocRef = '02' or TpoDocRef = '04'">
						<xsl:element name="cac:BillingReference">
							<xsl:element name="cac:InvoiceDocumentReference">
								<xsl:element name="cbc:ID">
									<xsl:value-of select="concat(SerieRef, NumeroRef)"/>
								</xsl:element>
								<xsl:element name="cbc:UUID">
									<xsl:attribute name="schemeName">
										<xsl:choose>
											<xsl:when test="string-length(ECB01) = 40">
												<xsl:value-of select="'CUFE-SHA1'"/>
											</xsl:when>
											<xsl:when test="string-length(ECB01) = 64">
												<xsl:value-of select="'CUFE-SHA256'"/>
											</xsl:when>
											<xsl:when test="string-length(ECB01) = 96">
												<xsl:value-of select="'CUFE-SHA384'"/>
											</xsl:when>
											<xsl:when test="string-length(ECB01) = 128">
												<xsl:value-of select="'CUFE-SHA512'"/>
											</xsl:when>
											<xsl:otherwise/>
										</xsl:choose>
									</xsl:attribute>
									<xsl:value-of select="ECB01"/>
								</xsl:element>
								<xsl:element name="cbc:IssueDate">
									<xsl:value-of select="FechaRef"/>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:when>
					<xsl:when test="TpoDocRef = '03'">
						<xsl:element name="cac:BillingReference">
							<xsl:element name="cac:InvoiceDocumentReference">
								<xsl:element name="cbc:ID">
									<xsl:value-of select="concat(SerieRef, NumeroRef)"/>
								</xsl:element>
								<xsl:element name="cbc:UUID">
									<xsl:attribute name="schemeName">
										<xsl:choose>
											<xsl:when test="string-length(ECB01) = 40">
												<xsl:value-of select="'CUDE-SHA1'"/>
											</xsl:when>
											<xsl:when test="string-length(ECB01) = 64">
												<xsl:value-of select="'CUDE-SHA256'"/>
											</xsl:when>
											<xsl:when test="string-length(ECB01) = 96">
												<xsl:value-of select="'CUDE-SHA384'"/>
											</xsl:when>
											<xsl:when test="string-length(ECB01) = 128">
												<xsl:value-of select="'CUDE-SHA512'"/>
											</xsl:when>
											<xsl:otherwise/>
										</xsl:choose>
									</xsl:attribute>
									<xsl:value-of select="ECB01"/>
								</xsl:element>
								<xsl:element name="cbc:IssueDate">
									<xsl:value-of select="FechaRef"/>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:when>
					<!--<xsl:when test="TpoDocRef = '07'">
						<xsl:element name="cac:BillingReference">
							<xsl:element name="cac:CreditNoteDocumentReference">
								<xsl:element name="cbc:ID">
									<xsl:value-of select="concat(SerieRef, NumeroRef)"/>
								</xsl:element>
								<xsl:if test="ECB01 != ''">
									<xsl:element name="cbc:UUID">
										<xsl:attribute name="schemeName">
											<xsl:choose>
												<xsl:when test="string-length(ECB01) = 40">
												<xsl:value-of select="'CUFE-SHA1'"/>
												</xsl:when>
												<xsl:when test="string-length(ECB01) = 64">
												<xsl:value-of select="'CUFE-SHA256'"/>
												</xsl:when>
												<xsl:when test="string-length(ECB01) = 96">
												<xsl:value-of select="'CUFE-SHA384'"/>
												</xsl:when>
												<xsl:when test="string-length(ECB01) = 128">
												<xsl:value-of select="'CUFE-SHA512'"/>
												</xsl:when>
												<xsl:otherwise/>
											</xsl:choose>
										</xsl:attribute>
										<xsl:value-of select="ECB01"/>
									</xsl:element>
								</xsl:if>
								<xsl:element name="cbc:IssueDate">
									<xsl:value-of select="FechaRef"/>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:when>
					<xsl:when test="TpoDocRef = '08'">
						<xsl:element name="cac:BillingReference">
							<xsl:element name="cac:DebitNoteDocumentReference">
								<xsl:element name="cbc:ID">
									<xsl:value-of select="concat(SerieRef, NumeroRef)"/>
								</xsl:element>
								<xsl:if test="ECB01 != ''">
									<xsl:element name="cbc:UUID">
										<xsl:attribute name="schemeName">
											<xsl:choose>
												<xsl:when test="string-length(ECB01) = 40">
												<xsl:value-of select="'CUFE-SHA1'"/>
												</xsl:when>
												<xsl:when test="string-length(ECB01) = 64">
												<xsl:value-of select="'CUFE-SHA256'"/>
												</xsl:when>
												<xsl:when test="string-length(ECB01) = 96">
												<xsl:value-of select="'CUFE-SHA384'"/>
												</xsl:when>
												<xsl:when test="string-length(ECB01) = 128">
												<xsl:value-of select="'CUFE-SHA512'"/>
												</xsl:when>
												<xsl:otherwise/>
											</xsl:choose>
										</xsl:attribute>
										<xsl:value-of select="ECB01"/>
									</xsl:element>
								</xsl:if>
								<xsl:element name="cbc:IssueDate">
									<xsl:value-of select="FechaRef"/>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:when>-->
					<xsl:otherwise/>
				</xsl:choose>
			</xsl:for-each>
			<xsl:for-each select="/DTE/Documento/Referencia">
				<!--Despatch Document Reference -->
				<xsl:if test="TpoDocRef = '09'">
					<xsl:element name="cac:DespatchDocumentReference">
						<xsl:element name="cbc:ID">
							<xsl:value-of select="concat(SerieRef, NumeroRef)"/>
						</xsl:element>
						<xsl:if test="FechaRef">
							<xsl:element name="cbc:IssueDate">
								<xsl:value-of select="FechaRef"/>
							</xsl:element>
						</xsl:if>
					</xsl:element>
				</xsl:if>
				<!--Receipt Document Reference -->
				<xsl:if test="TpoDocRef = '20'">
					<xsl:element name="cac:ReceiptDocumentReference">
						<xsl:element name="cbc:ID">
							<xsl:value-of select="concat(SerieRef, NumeroRef)"/>
						</xsl:element>
						<xsl:if test="FechaRef">
							<xsl:element name="cbc:IssueDate">
								<xsl:value-of select="FechaRef"/>
							</xsl:element>
						</xsl:if>
					</xsl:element>
				</xsl:if>
				<!-- Additional Document Reference -->
				<xsl:if test="TpoDocRef = '99'">
					<xsl:element name="cac:AdditionalDocumentReference">
						<xsl:element name="cbc:ID">
							<xsl:value-of select="concat(SerieRef, NumeroRef)"/>
						</xsl:element>
						<xsl:if test="ECB01 != ''">
							<xsl:element name="cbc:UUID">
								<xsl:attribute name="schemeName">
									<xsl:choose>
										<xsl:when test="string-length(ECB01) = 40">
											<xsl:value-of select="'CUFE-SHA1'"/>
										</xsl:when>
										<xsl:when test="string-length(ECB01) = 64">
											<xsl:value-of select="'CUFE-SHA256'"/>
										</xsl:when>
										<xsl:when test="string-length(ECB01) = 96">
											<xsl:value-of select="'CUFE-SHA384'"/>
										</xsl:when>
										<xsl:when test="string-length(ECB01) = 128">
											<xsl:value-of select="'CUFE-SHA512'"/>
										</xsl:when>
										<xsl:otherwise/>
									</xsl:choose>
								</xsl:attribute>
								<xsl:value-of select="ECB01"/>
							</xsl:element>
						</xsl:if>
						<xsl:element name="cbc:DocumentTypeCode">
							<xsl:value-of select="TpoDocRef"/>
						</xsl:element>
					</xsl:element>
				</xsl:if>
				<xsl:if test="TpoDocRef = '01' and //IdDoc/Tipo = '03'">
					<xsl:element name="cac:AdditionalDocumentReference">
						<xsl:element name="cbc:ID">
							<xsl:value-of select="concat(SerieRef, NumeroRef)"/>
						</xsl:element>
						<xsl:element name="cbc:UUID">
							<xsl:attribute name="schemeName">
								<xsl:choose>
									<xsl:when test="string-length(ECB01) = 40">
										<xsl:value-of select="'CUFE-SHA1'"/>
									</xsl:when>
									<xsl:when test="string-length(ECB01) = 64">
										<xsl:value-of select="'CUFE-SHA256'"/>
									</xsl:when>
									<xsl:when test="string-length(ECB01) = 96">
										<xsl:value-of select="'CUFE-SHA384'"/>
									</xsl:when>
									<xsl:when test="string-length(ECB01) = 128">
										<xsl:value-of select="'CUFE-SHA512'"/>
									</xsl:when>
									<xsl:otherwise/>
								</xsl:choose>
							</xsl:attribute>
							<xsl:value-of select="ECB01"/>
						</xsl:element>
						<xsl:element name="cbc:DocumentTypeCode">
							<xsl:value-of select="TpoDocRef"/>
						</xsl:element>
					</xsl:element>
				</xsl:if>
				<!--<xsl:if test="((TpoDocRef = '01') and (//IdDoc/Tipo = '07' or //IdDoc/Tipo = '91')) or ((TpoDocRef = '02') and (//IdDoc/Tipo = '07' or //IdDoc/Tipo = '91')) or ((TpoDocRef = '03') and (//IdDoc/Tipo = '07' or //IdDoc/Tipo = '91')) or ((TpoDocRef = '01') and (//IdDoc/Tipo = '08' or //IdDoc/Tipo = '92')) or ((TpoDocRef = '02') and (//IdDoc/Tipo = '08' or //IdDoc/Tipo = '92')) or ((TpoDocRef = '03') and (//IdDoc/Tipo = '08' or //IdDoc/Tipo = '92'))">
<xsl:element name="cac:AdditionalDocumentReference">
	<xsl:element name="cbc:ID">
		<xsl:value-of select="concat(SerieRef, NumeroRef)"/>
	</xsl:element>
	<xsl:element name="cbc:UUID">
		<xsl:attribute name="schemeName">
			<xsl:choose>
				<xsl:when test="string-length(ECB01) = 40">
					<xsl:value-of select="'CUFE-SHA1'"/>
				</xsl:when>
				<xsl:when test="string-length(ECB01) = 64">
					<xsl:value-of select="'CUFE-SHA256'"/>
				</xsl:when>
				<xsl:when test="string-length(ECB01) = 96">
					<xsl:value-of select="'CUFE-SHA384'"/>
				</xsl:when>
				<xsl:when test="string-length(ECB01) = 128">
					<xsl:value-of select="'CUFE-SHA512'"/>
				</xsl:when>
				<xsl:otherwise/>
			</xsl:choose>
		</xsl:attribute>
		<xsl:value-of select="ECB01"/>
	</xsl:element>
	<xsl:element name="cbc:DocumentTypeCode">
		<xsl:value-of select="TpoDocRef"/>
	</xsl:element>
</xsl:element>
</xsl:if>-->
			</xsl:for-each>
			<xsl:for-each select="/DTE/Documento/Referencia">
				<!--REFERENCIA-->
				<xsl:choose>
					<xsl:when
						test="TpoDocRef != '01' and TpoDocRef != '02' and TpoDocRef != '03' and TpoDocRef != '07' and TpoDocRef != '08' and TpoDocRef != '91' and TpoDocRef != '92' and TpoDocRef != '09' and TpoDocRef != '20' and TpoDocRef != '100' and TpoDocRef != 'OC'">
						<!--Otro tipo de referencia-->
						<xsl:element name="cac:AdditionalDocumentReference">
							<xsl:element name="cbc:ID">
								<xsl:value-of select="NumeroRef"/>
							</xsl:element>
							<xsl:if test="FechaRef != ''">
							<xsl:element name="cbc:IssueDate">
								<xsl:value-of select="substring(FechaRef, 1, 10)"/>
							</xsl:element>
							</xsl:if>
							<xsl:element name="cbc:DocumentTypeCode">
								<xsl:value-of select="TpoDocRef"/>
							</xsl:element>
							<xsl:variable name="DocRefDesc">
								<xsl:call-template name="TipoDocRef">
									<xsl:with-param name="TpoDocRef">
										<xsl:value-of select="TpoDocRef"/>
									</xsl:with-param>
								</xsl:call-template>
							</xsl:variable>
							<xsl:if test="$DocRefDesc != ''">
								<xsl:element name="cbc:DocumentType">
									<xsl:value-of select="$DocRefDesc"/>
								</xsl:element>
							</xsl:if>
						</xsl:element>
					</xsl:when>
				</xsl:choose>
			</xsl:for-each>
			<!--Pais Emisor en letras -->
			<xsl:variable name="PaisEmis">
				<xsl:call-template name="countryName">
					<xsl:with-param name="Pais"
						select="normalize-space(/DTE/Documento/Encabezado/Emisor/DomFiscal/Pais)"/>
				</xsl:call-template>
			</xsl:variable>
			<!--Issuer of the document-->
			<xsl:element name="cac:AccountingSupplierParty">
				<xsl:element name="cbc:AdditionalAccountID">
					<xsl:value-of select="/DTE/Documento/Encabezado/Emisor/TipoContribuyente"/>
				</xsl:element>
				<xsl:element name="cac:Party">
					<xsl:if
						test="/DTE/Documento/Encabezado/Emisor/CodigoEmisor/TpoCdgIntEmisor = 'CIIU'">
						<xsl:element name="cbc:IndustryClassificationCode">
							<xsl:value-of
								select="/DTE/Documento/Encabezado/Emisor/CodigoEmisor[TpoCdgIntEmisor = 'CIIU']/CdgIntEmisor"
							/>
						</xsl:element>
					</xsl:if>
					<xsl:if test="/DTE/Documento/Encabezado/IdDoc/PtoEmis !=''">
						<xsl:element name="cac:PartyName">
							<!--Nombre Tienda -->
							<xsl:element name="cbc:Name">
								<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/PtoEmis"/>
							</xsl:element>
						</xsl:element>
					</xsl:if>
					<xsl:if test="/DTE/Documento/Encabezado/IdDoc/Establecimiento !=''">
						<xsl:element name="cac:PartyName">
							<!--Establecimiento-->
							<xsl:element name="cbc:Name">
								<xsl:value-of
									select="/DTE/Documento/Encabezado/IdDoc/Establecimiento"/>
							</xsl:element>
						</xsl:element>
					</xsl:if>
					<xsl:element name="cac:PartyName">
						<!--Name of the Issuer-->
						<xsl:element name="cbc:Name">
							<xsl:value-of
								select="/DTE/Documento/Encabezado/Emisor/NombreEmisor/PrimerNombre"
							/>
						</xsl:element>
					</xsl:element>
					<!--Fiscal Address-->
					<xsl:element name="cac:PhysicalLocation">
						<xsl:element name="cac:Address">
							<xsl:element name="cbc:ID">
								<xsl:choose>
									<xsl:when test="(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo') or (/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturoGS')">
										<xsl:value-of select="/DTE/Documento/Encabezado/Emisor/LugarExped/CodigoPostal"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="/DTE/Documento/Encabezado/Emisor/LugarExped/Ciudad"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:element>
							<xsl:element name="cbc:CityName">
								<xsl:choose>
									<xsl:when test="(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo') or (/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturoGS')">
										<xsl:call-template name="cityName">
											<xsl:with-param name="Municipio"
												select="normalize-space(/DTE/Documento/Encabezado/Emisor/LugarExped/CodigoPostal)"
											/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="cityName">
											<xsl:with-param name="Municipio"
												select="normalize-space(/DTE/Documento/Encabezado/Emisor/LugarExped/Ciudad)"
											/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:element>
							<xsl:choose>
								<xsl:when test="/DTE/Documento/Encabezado/Emisor/LugarExped/CodigoPostal !='' and (not(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo') or not(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturoGS'))">
									<xsl:element name="cbc:PostalZone">
										<xsl:value-of select="/DTE/Documento/Encabezado/Emisor/LugarExped/CodigoPostal"/>
									</xsl:element>
								</xsl:when>
								<xsl:otherwise>
									<xsl:element name="cbc:PostalZone">
										<xsl:value-of select="/DTE/Documento/Encabezado/Emisor/LugarExped/GLN"/>
									</xsl:element>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:element name="cbc:CountrySubentity">
								<xsl:variable name="CountrySubentityNameS">
									<xsl:call-template name="countrySubentityName">
										<xsl:with-param name="Departamento"
											select="normalize-space(/DTE/Documento/Encabezado/Emisor/LugarExped/Departamento)"
										/>
									</xsl:call-template>
								</xsl:variable>
								<xsl:value-of select="$CountrySubentityNameS"/>
							</xsl:element>
							<xsl:element name="cbc:CountrySubentityCode">
								<xsl:value-of
									select="/DTE/Documento/Encabezado/Emisor/LugarExped/Departamento"
								/>
							</xsl:element>
							<xsl:element name="cac:AddressLine">
								<xsl:element name="cbc:Line">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Emisor/LugarExped/Calle"/>
								</xsl:element>
							</xsl:element>
							<xsl:element name="cac:Country">
								<xsl:element name="cbc:IdentificationCode">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Emisor/LugarExped/Pais"/>
								</xsl:element>
								<xsl:element name="cbc:Name">
									<xsl:attribute name="languageID">
								<xsl:text>es</xsl:text>
							</xsl:attribute>
									<xsl:value-of
										select="concat(substring($PaisEmis, 1, 1), translate(substring($PaisEmis, 2, 100), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'))"
									/>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:element>
					<!-- Identification of the Company -->
					<xsl:element name="cac:PartyTaxScheme">
						<xsl:element name="cbc:RegistrationName">
							<xsl:value-of select="/DTE/Documento/Encabezado/Emisor/NmbEmisor"/>
						</xsl:element>
						<xsl:element name="cbc:CompanyID">
							<xsl:attribute name="schemeID">
								<xsl:call-template name="calculNIT-dv">
									<xsl:with-param name="NIT"
										select="normalize-space(/DTE/Documento/Encabezado/Emisor/IDEmisor)"
									/>
								</xsl:call-template>
							</xsl:attribute>
							<xsl:attribute name="schemeName">
								<xsl:value-of select="'31'"/>
							</xsl:attribute>
							<xsl:attribute name="schemeAgencyID">
								<xsl:text>195</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="schemeAgencyName">
								<xsl:text>CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)</xsl:text>
							</xsl:attribute>
							<xsl:value-of
								select="normalize-space(/DTE/Documento/Encabezado/Emisor/IDEmisor)"
							/>
						</xsl:element>
						<xsl:element name="cbc:TaxLevelCode">
							<xsl:attribute name="listName">
								<xsl:value-of
									select="/DTE/Documento/Encabezado/Emisor/RegimenContable/text()"
								/>
							</xsl:attribute>
							<xsl:value-of
								select="/DTE/Documento/Encabezado/Emisor/CodigoEmisor[TpoCdgIntEmisor = 'TpoObl']/CdgIntEmisor/text()"
							/>
						</xsl:element>
						<xsl:element name="cac:RegistrationAddress">
							<xsl:element name="cbc:ID">
								<xsl:choose>
									<xsl:when test="(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo') or (/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturoGS')">
										<xsl:value-of select="/DTE/Documento/Encabezado/Emisor/DomFiscal/CodigoPostal"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="/DTE/Documento/Encabezado/Emisor/DomFiscal/Ciudad"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:element>
							<xsl:element name="cbc:CityName">
								<xsl:choose>
									<xsl:when test="(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo') or (/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturoGS')">
										<xsl:call-template name="cityName">
											<xsl:with-param name="Municipio"
												select="normalize-space(/DTE/Documento/Encabezado/Emisor/DomFiscal/CodigoPostal)"
											/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="cityName">
											<xsl:with-param name="Municipio"
												select="normalize-space(/DTE/Documento/Encabezado/Emisor/DomFiscal/Ciudad)"
											/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:element>
							<xsl:choose>
								<xsl:when test="/DTE/Documento/Encabezado/Emisor/DomFiscal/CodigoPostal !='' and (not(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo') or not(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturoGS'))">
									<xsl:element name="cbc:PostalZone">
										<xsl:value-of select="/DTE/Documento/Encabezado/Emisor/DomFiscal/CodigoPostal"/>
									</xsl:element>
								</xsl:when>
								<xsl:otherwise>
									<xsl:element name="cbc:PostalZone">
										<xsl:value-of select="/DTE/Documento/Encabezado/Emisor/DomFiscal/GLN"/>
									</xsl:element>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:element name="cbc:CountrySubentity">
								<xsl:variable name="CountrySubentityNameS">
									<xsl:call-template name="countrySubentityName">
										<xsl:with-param name="Departamento"
											select="normalize-space(/DTE/Documento/Encabezado/Emisor/DomFiscal/Departamento)"
										/>
									</xsl:call-template>
								</xsl:variable>
								<xsl:value-of select="$CountrySubentityNameS"/>
							</xsl:element>
							<xsl:element name="cbc:CountrySubentityCode">
								<xsl:value-of
									select="/DTE/Documento/Encabezado/Emisor/DomFiscal/Departamento"
								/>
							</xsl:element>
							<xsl:element name="cac:AddressLine">
								<xsl:element name="cbc:Line">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Emisor/DomFiscal/Calle"/>
								</xsl:element>
							</xsl:element>
							<xsl:element name="cac:Country">
								<xsl:element name="cbc:IdentificationCode">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Emisor/DomFiscal/Pais"/>
								</xsl:element>
								<xsl:element name="cbc:Name">
									<xsl:attribute name="languageID">
										<xsl:text>es</xsl:text>
									</xsl:attribute>
									<xsl:value-of
										select="concat(substring($PaisEmis, 1, 1), translate(substring($PaisEmis, 2, 100), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'))"
									/>
								</xsl:element>
							</xsl:element>
						</xsl:element>
						<xsl:element name="cac:TaxScheme">
							<xsl:element name="cbc:ID">
								<xsl:value-of select="'01'"/>
							</xsl:element>
							<xsl:element name="cbc:Name">
								<xsl:value-of select="'IVA'"/>
							</xsl:element>
						</xsl:element>
					</xsl:element>
					<xsl:element name="cac:PartyLegalEntity">
						<xsl:element name="cbc:RegistrationName">
							<xsl:value-of select="/DTE/Documento/Encabezado/Emisor/NmbEmisor"/>
						</xsl:element>
						<xsl:element name="cbc:CompanyID">
							<xsl:attribute name="schemeID">
								<xsl:call-template name="calculNIT-dv">
									<xsl:with-param name="NIT"
										select="normalize-space(/DTE/Documento/Encabezado/Emisor/IDEmisor)"
									/>
								</xsl:call-template>
							</xsl:attribute>
							<xsl:attribute name="schemeName">
								<xsl:value-of select="'31'"/>
							</xsl:attribute>
							<xsl:attribute name="schemeAgencyID">
								<xsl:text>195</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="schemeAgencyName">
								<xsl:text>CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)</xsl:text>
							</xsl:attribute>
							<xsl:value-of
								select="normalize-space(/DTE/Documento/Encabezado/Emisor/IDEmisor)"
							/>
						</xsl:element>
						<xsl:element name="cac:CorporateRegistrationScheme">
							<xsl:choose>
								<xsl:when test="/DTE/Documento/Encabezado/IdDoc/Serie != ''">
									<xsl:element name="cbc:ID">
										<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/Serie"
										/>
									</xsl:element>
								</xsl:when>
								<xsl:otherwise/>
							</xsl:choose>
							<xsl:if test="/DTE/Documento/Encabezado/Emisor/CdgSucursal != ''">
								<xsl:element name="cbc:Name">
									<xsl:value-of select="/DTE/Documento/Encabezado/Emisor/CdgSucursal"
									/>
								</xsl:element>
							</xsl:if>
						</xsl:element>
						<!-- Informacion de Participantes de un Consorcio -->
						<xsl:variable name="Consorcio"
							select="/DTE/Documento/Encabezado/Emisor/Consorcio"/>
						<xsl:for-each select="$Consorcio">
							<xsl:element name="cac:ShareholderParty">
								<xsl:element name="cbc:PartecipationPercent">
									<xsl:value-of select="Porcentaje"/>
								</xsl:element>
								<xsl:element name="cac:Party">
									<xsl:element name="cac:PartyTaxScheme">
										<xsl:element name="cbc:RegistrationName">
											<xsl:value-of select="Nombre"/>
										</xsl:element>
										<xsl:element name="cbc:CompanyID">
											<xsl:attribute name="schemeID">
												<xsl:call-template name="calculNIT-dv">
												<xsl:with-param name="NIT"
												select="normalize-space(NroDocCons)"/>
												</xsl:call-template>
											</xsl:attribute>
											<xsl:attribute name="schemeName">
												<xsl:value-of select="'31'"/>
											</xsl:attribute>
											<xsl:attribute name="schemeAgencyID">
												<xsl:text>195</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeAgencyName">
												<xsl:text>CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)</xsl:text>
											</xsl:attribute>
											<xsl:value-of select="normalize-space(NroDocCons)"/>
										</xsl:element>
										<xsl:element name="cbc:TaxLevelCode">
											<xsl:attribute name="listName">
												<xsl:value-of select="RegimenContable/text()"/>
											</xsl:attribute>
											<xsl:value-of
												select="CodigoEmisor[TpoCdgIntEmisor = 'TpoObl']/CdgIntEmisor/text()"
											/>
										</xsl:element>
										<xsl:element name="cac:TaxScheme">
											<xsl:element name="cbc:ID">
												<xsl:value-of select="'01'"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:value-of select="'IVA'"/>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
					<!-- Contact of the Sender (Phone & email) -->
					
						<xsl:element name="cac:Contact">
							<xsl:if test="/DTE/Documento/Encabezado/Emisor/ContactoEmisor/Nombre">
								<xsl:element name="cbc:Name">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Emisor/ContactoEmisor/Nombre"
									/>
								</xsl:element>
							</xsl:if>
							<xsl:if test="/DTE/Documento/Encabezado/Emisor/ContactoEmisor/Telefono">
								<xsl:element name="cbc:Telephone">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Emisor/ContactoEmisor/Telefono"
									/>
								</xsl:element>
							</xsl:if>
							<xsl:if test="/DTE/Documento/Encabezado/Emisor/ContactoEmisor/Fax">
								<xsl:element name="cbc:Telefax">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Emisor/ContactoEmisor/Fax"
									/>
								</xsl:element>
							</xsl:if>
							
								<xsl:element name="cbc:ElectronicMail">
									<xsl:value-of
										select="if(/DTE/Documento/Encabezado/Emisor/ContactoEmisor/eMail !='') then /DTE/Documento/Encabezado/Emisor/ContactoEmisor/eMail else 'col_intercambio@einvoicing.signature-cloud.com' "/>
								</xsl:element>
							
							<xsl:if
								test="/DTE/Documento/Encabezado/Emisor/ContactoEmisor/Descripcion">
								<xsl:element name="cbc:Note">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Emisor/ContactoEmisor/Descripcion"
									/>
								</xsl:element>
							</xsl:if>
							<xsl:if
								test="/DTE/Documento/Encabezado/Emisor/ContactoEmisor[Tipo = 'Distrib']/eMail">
								<xsl:element name="cac:OtherCommunication">
									<xsl:element name="cbc:Channel">
										<xsl:text>email</xsl:text>
									</xsl:element>
									<xsl:element name="cbc:Value">
										<xsl:value-of
											select="/DTE/Documento/Encabezado/Emisor/ContactoEmisor[Tipo = 'Distrib']/eMail"
										/>
									</xsl:element>
								</xsl:element>
							</xsl:if>
						</xsl:element>
					
				</xsl:element>
			</xsl:element>
			<!--Pais Receptor en letras-->
			<xsl:variable name="PaisRecep">
				<xsl:call-template name="countryName">
					<xsl:with-param name="Pais"
						select="normalize-space(/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/Pais)"
					/>
				</xsl:call-template>
			</xsl:variable>
			<!--Receiver of the document-->
			<xsl:element name="cac:AccountingCustomerParty">
				<xsl:element name="cbc:SupplierAssignedAccountID">
					<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/CdgGLNRecep"/>
				</xsl:element>
				<xsl:element name="cbc:AdditionalAccountID">
					<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/TipoContribuyenteR"/>
				</xsl:element>
				<xsl:element name="cac:Party">
					<xsl:if test="/DTE/Documento/Encabezado/Receptor/TipoContribuyenteR = '2'">
						<xsl:element name="cac:PartyIdentification">
							<xsl:element name="cbc:ID">
								<xsl:choose>
									<xsl:when test="/DTE/Documento/Encabezado/Receptor/DocRecep/TipoDocRecep = '31'">
										<xsl:attribute name="schemeID">
											<xsl:call-template name="calculNIT-dv">
												<xsl:with-param name="NIT"
													select="normalize-space(/DTE/Documento/Encabezado/Receptor/DocRecep/NroDocRecep)"
												/>
											</xsl:call-template>
										</xsl:attribute>
									</xsl:when>
									<xsl:otherwise/>
								</xsl:choose>
								<xsl:attribute name="schemeName">
									<xsl:value-of
										select="normalize-space(/DTE/Documento/Encabezado/Receptor/DocRecep/TipoDocRecep)"
									/>
								</xsl:attribute>
								<xsl:value-of select="normalize-space(/DTE/Documento/Encabezado/Receptor/DocRecep/NroDocRecep)"/>
							</xsl:element>
						</xsl:element>
					</xsl:if>
					<!--Receiver Name-->
					<!--<xsl:if test="/DTE/Documento/Encabezado/Receptor/TipoContribuyenteR != '2'">-->
						<xsl:element name="cac:PartyName">
							<xsl:element name="cbc:Name">
								<xsl:value-of
									select="/DTE/Documento/Encabezado/Receptor/NombreRecep/PrimerNombre"
								/>
							</xsl:element>
						</xsl:element>
					<!--</xsl:if>-->
					<!-- Expedition Address -->
					<xsl:if test="/DTE/Documento/Encabezado/Receptor/LugarRecep">
						<xsl:element name="cac:PhysicalLocation">
							<xsl:element name="cac:Address">
								<xsl:choose>
									<xsl:when test="/DTE/Documento/Encabezado/IdDoc/Tipo != '02'">
										<xsl:element name="cbc:ID">
											<xsl:choose>
												<xsl:when test="(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo') or (/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturoGS')">
													<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/LugarRecep/CodigoPostal"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Ciudad"/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:element>
										<xsl:element name="cbc:CityName">
											<xsl:choose>
												<xsl:when test="(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo') or (/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturoGS')">
													<xsl:call-template name="cityName">
														<xsl:with-param name="Municipio"
															select="normalize-space(/DTE/Documento/Encabezado/Receptor/LugarRecep/CodigoPostal)"
														/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="cityName">
														<xsl:with-param name="Municipio"
															select="normalize-space(/DTE/Documento/Encabezado/Receptor/LugarRecep/Ciudad)"
														/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:element>
										<xsl:choose>
											<xsl:when test="/DTE/Documento/Encabezado/Receptor/LugarRecep/CodigoPostal !='' and (not(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo') or not(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturoGS'))">
												<xsl:element name="cbc:PostalZone">
													<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/LugarRecep/CodigoPostal"/>
												</xsl:element>
											</xsl:when>
											<xsl:otherwise>
												<xsl:element name="cbc:PostalZone">
													<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/LugarRecep/GLN"/>
												</xsl:element>
											</xsl:otherwise>
										</xsl:choose>
										<xsl:element name="cbc:CountrySubentity">
											<xsl:variable name="CountrySubentityNameS">
												<xsl:call-template name="countrySubentityName">
													<xsl:with-param name="Departamento"
														select="normalize-space(/DTE/Documento/Encabezado/Receptor/LugarRecep/Departamento)"
													/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:value-of select="$CountrySubentityNameS"/>
										</xsl:element>
										<xsl:element name="cbc:CountrySubentityCode">
											<xsl:value-of
												select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Departamento"
											/>
										</xsl:element>
										<xsl:element name="cac:AddressLine">
											<xsl:element name="cbc:Line">
												<xsl:value-of
													select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Calle"/>
											</xsl:element>
										</xsl:element>
										<xsl:element name="cac:Country">
											<xsl:element name="cbc:IdentificationCode">
												<xsl:value-of
													select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Pais"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:attribute name="languageID">
													<xsl:text>es</xsl:text>
												</xsl:attribute>
												<xsl:value-of
													select="concat(substring($PaisRecep, 1, 1), translate(substring($PaisRecep, 2, 100), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'))"
												/>
											</xsl:element>
										</xsl:element>
									</xsl:when>
									<xsl:otherwise>
										<xsl:if
											test="/DTE/Documento/Encabezado/Receptor/LugarRecep/Departamento != ''">
											<xsl:element name="cbc:Department">
												<xsl:value-of
												select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Departamento"
												/>
											</xsl:element>
										</xsl:if>
										<xsl:if
											test="/DTE/Documento/Encabezado/Receptor/LugarRecep/Ciudad != ''">
											<xsl:element name="cbc:CityName">
												<xsl:value-of
												select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Ciudad"
												/>
											</xsl:element>
										</xsl:if>
										<xsl:if test="/DTE/Documento/Encabezado/Receptor/LugarRecep/CodigoPostal != ''">
											<xsl:element name="cbc:PostalZone">
												<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/LugarRecep/CodigoPostal"/>
											</xsl:element>
										</xsl:if>
										<xsl:if
											test="/DTE/Documento/Encabezado/Receptor/LugarRecep/Distrito != ''">
											<xsl:element name="cbc:CountrySubentity">
												<xsl:value-of
												select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Distrito"
												/>
											</xsl:element>
										</xsl:if>
										<xsl:element name="cac:AddressLine">
											<xsl:element name="cbc:Line">
												<xsl:value-of
													select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Calle"/>
											</xsl:element>
										</xsl:element>
										<xsl:element name="cac:Country">
											<xsl:element name="cbc:IdentificationCode">
												<xsl:value-of
													select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Pais"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:attribute name="languageID">
													<xsl:text>es</xsl:text>
												</xsl:attribute>
												<xsl:value-of
													select="concat(substring($PaisRecep, 1, 1), translate(substring($PaisRecep, 2, 100), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'))"
												/>
											</xsl:element>
										</xsl:element>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:element>
						</xsl:element>
					</xsl:if>
					<!-- Identification of the Company -->
					<!--<xsl:if test="/DTE/Documento/Encabezado/Receptor/TipoContribuyenteR != '2'">-->
						<xsl:element name="cac:PartyTaxScheme">
							<xsl:element name="cbc:RegistrationName">
								<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/NmbRecep"/>
							</xsl:element>
							<xsl:element name="cbc:CompanyID">
								<xsl:choose>
									<xsl:when test="/DTE/Documento/Encabezado/Receptor/DocRecep/TipoDocRecep = '31'">
										<xsl:attribute name="schemeID">
												<xsl:call-template name="calculNIT-dv">
													<xsl:with-param name="NIT"
														select="normalize-space(/DTE/Documento/Encabezado/Receptor/DocRecep/NroDocRecep)"
													/>
												</xsl:call-template>
											</xsl:attribute>
										</xsl:when>
										<xsl:otherwise/>
									</xsl:choose>
								<xsl:attribute name="schemeName">
									<xsl:value-of
										select="normalize-space(/DTE/Documento/Encabezado/Receptor/DocRecep/TipoDocRecep)"
									/>
								</xsl:attribute>
								<xsl:attribute name="schemeAgencyID">
									<xsl:text>195</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="schemeAgencyName">
									<xsl:text>CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)</xsl:text>
								</xsl:attribute>
								<xsl:value-of
									select="normalize-space(/DTE/Documento/Encabezado/Receptor/DocRecep/NroDocRecep)"
								/>
							</xsl:element>
							<xsl:element name="cbc:TaxLevelCode">
								<xsl:attribute name="listName">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Receptor/RegimenContableR"
									/>
								</xsl:attribute>
								<xsl:value-of
									select="/DTE/Documento/Encabezado/Receptor/CodigoReceptor[TpoCdgIntRecep = 'TpoObl']/CdgIntRecep/text()"
								/>
							</xsl:element>
							<xsl:if test="/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/Calle !=''"> 
								<xsl:element name="cac:RegistrationAddress">
									<xsl:choose>
										<xsl:when test="(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo') or (/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturoGS')">
											<xsl:element name="cbc:ID">
												<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/CodigoPostal"/>
											</xsl:element>
										</xsl:when>
										<xsl:otherwise>
											<!--<xsl:if test="/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/Ciudad !=''">-->
											<xsl:element name="cbc:ID">
												<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/Ciudad"/>
											</xsl:element>
											<!--</xsl:if>-->
										</xsl:otherwise>
									</xsl:choose>
									
									<xsl:choose>
										<xsl:when test="(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo') or (/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturoGS')">
											<xsl:call-template name="cityName">
												<xsl:with-param name="Municipio"
													select="normalize-space(/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/CodigoPostal)"
												/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<!--<xsl:if test="/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/Ciudad !=''">-->
											<xsl:element name="cbc:CityName">
												<xsl:call-template name="cityName">
													<xsl:with-param name="Municipio"
														select="normalize-space(/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/Ciudad)"/>
												</xsl:call-template>
											</xsl:element>
											<!--</xsl:if>-->
										</xsl:otherwise>
									</xsl:choose>
									
									<xsl:choose>
										<xsl:when test="/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/CodigoPostal !='' and (not(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo') or not(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturoGS'))">
											<xsl:element name="cbc:PostalZone">
												<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/CodigoPostal"/>
											</xsl:element>
										</xsl:when>
										<xsl:otherwise>
											<xsl:if test="/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/GLN !=''">
												<xsl:element name="cbc:PostalZone">
													<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/GLN"/>
												</xsl:element>
											</xsl:if>
										</xsl:otherwise>
									</xsl:choose>
									<!--<xsl:if test="/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/Departamento !=''">-->
									<xsl:element name="cbc:CountrySubentity">
										<xsl:variable name="CountrySubentityNameS">
											<xsl:call-template name="countrySubentityName">
												<xsl:with-param name="Departamento"
													select="normalize-space(/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/Departamento)"
												/>
											</xsl:call-template>
										</xsl:variable>
										<xsl:value-of select="$CountrySubentityNameS"/>
									</xsl:element>
									<xsl:element name="cbc:CountrySubentityCode">
										<xsl:value-of
											select="/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/Departamento"/>
									</xsl:element>
									<!--</xsl:if>-->
									<!--<xsl:if test="/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/Calle !=''">-->
									<xsl:element name="cac:AddressLine">
										<xsl:element name="cbc:Line">
											<xsl:value-of
												select="/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/Calle"/>
										</xsl:element>
									</xsl:element>
									<!--</xsl:if>-->
									<!--<xsl:if test="/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/Pais !=''">-->
									<xsl:element name="cac:Country">
										<xsl:element name="cbc:IdentificationCode">
											<xsl:value-of
												select="/DTE/Documento/Encabezado/Receptor/DomFiscalRcp/Pais"/>
										</xsl:element>
										<xsl:element name="cbc:Name">
											<xsl:attribute name="languageID">
												<xsl:text>es</xsl:text>
											</xsl:attribute>
											<xsl:value-of
												select="concat(substring($PaisRecep, 1, 1), translate(substring($PaisRecep, 2, 100), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'))"/>
										</xsl:element>
									</xsl:element>
									<!--</xsl:if>-->
								</xsl:element>
							</xsl:if>
							<xsl:if test="/DTE/Documento/Encabezado/Receptor/DocRecep/NroDocRecep != '222222222222'">
								<xsl:element name="cac:TaxScheme">
									<xsl:element name="cbc:ID">
										<xsl:value-of select="'01'"/>
									</xsl:element>
									<xsl:element name="cbc:Name">
										<xsl:value-of select="'IVA'"/>
									</xsl:element>
								</xsl:element>
							</xsl:if>
							<xsl:if test="/DTE/Documento/Encabezado/Receptor/DocRecep/NroDocRecep = '222222222222'">
								<xsl:element name="cac:TaxScheme">
									<xsl:element name="cbc:ID">
										<xsl:value-of select="'ZZ'"/>
									</xsl:element>
									<xsl:element name="cbc:Name"/>
								</xsl:element>
							</xsl:if>
						</xsl:element>
						<xsl:element name="cac:PartyLegalEntity">
							<xsl:element name="cbc:RegistrationName">
								<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/NmbRecep"/>
							</xsl:element>
							<xsl:element name="cbc:CompanyID">
								<xsl:choose>
									<xsl:when test="/DTE/Documento/Encabezado/Receptor/DocRecep/TipoDocRecep = '31'">
										<xsl:attribute name="schemeID">
											<xsl:call-template name="calculNIT-dv">
												<xsl:with-param name="NIT"
													select="normalize-space(/DTE/Documento/Encabezado/Receptor/DocRecep/NroDocRecep)"
												/>
											</xsl:call-template>
										</xsl:attribute>
									</xsl:when>
									<xsl:otherwise/>
								</xsl:choose>
								<xsl:attribute name="schemeName">
									<xsl:value-of
										select="normalize-space(/DTE/Documento/Encabezado/Receptor/DocRecep/TipoDocRecep)"
									/>
								</xsl:attribute>
								<xsl:attribute name="schemeAgencyID">
									<xsl:text>195</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="schemeAgencyName">
									<xsl:text>CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)</xsl:text>
								</xsl:attribute>
								<xsl:value-of
									select="normalize-space(/DTE/Documento/Encabezado/Receptor/DocRecep/NroDocRecep)"
								/>
							</xsl:element>
							<xsl:if test="/DTE/Documento/Encabezado/Receptor/CdgSucursal != ''">
								<xsl:element name="cac:CorporateRegistrationScheme">
									<xsl:element name="cbc:Name">
										<xsl:value-of
											select="/DTE/Documento/Encabezado/Receptor/CdgSucursal"/>
									</xsl:element>
								</xsl:element>
							</xsl:if>
						</xsl:element>
					<!--</xsl:if>-->
					<!-- Contact of the receiver -->
					<xsl:if test="/DTE/Documento/Encabezado/Receptor/ContactoReceptor/eMail">
						<xsl:element name="cac:Contact">
							<xsl:if
								test="/DTE/Documento/Encabezado/Receptor/ContactoReceptor/Nombre">
								<xsl:element name="cbc:Name">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Receptor/ContactoReceptor/Nombre"
									/>
								</xsl:element>
							</xsl:if>
							<xsl:if
								test="/DTE/Documento/Encabezado/Receptor/ContactoReceptor/Telefono">
								<xsl:element name="cbc:Telephone">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Receptor/ContactoReceptor/Telefono"
									/>
								</xsl:element>
							</xsl:if>
							<xsl:if test="/DTE/Documento/Encabezado/Receptor/ContactoReceptor/Fax">
								<xsl:element name="cbc:Telefax">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Receptor/ContactoReceptor/Fax"
									/>
								</xsl:element>
							</xsl:if>
							<xsl:if test="/DTE/Documento/Encabezado/Receptor/ContactoReceptor/eMail">
								<xsl:element name="cbc:ElectronicMail">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Receptor/ContactoReceptor/eMail"
									/>
								</xsl:element>
							</xsl:if>
							<xsl:if
								test="/DTE/Documento/Encabezado/Receptor/ContactoReceptor/Descripcion">
								<xsl:element name="cbc:Note">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Receptor/ContactoReceptor/Descripcion"
									/>
								</xsl:element>
							</xsl:if>
							<xsl:if
								test="/DTE/Documento/Encabezado/Receptor/ContactoReceptor[Tipo = 'Distrib']/eMail">
								<xsl:element name="cac:OtherCommunication">
									<xsl:element name="cbc:Channel">
										<xsl:text>email</xsl:text>
									</xsl:element>
									<xsl:element name="cbc:Value">
										<xsl:value-of
											select="/DTE/Documento/Encabezado/Receptor/ContactoReceptor[Tipo = 'Distrib']/eMail"
										/>
									</xsl:element>
								</xsl:element>
							</xsl:if>
						</xsl:element>
					</xsl:if>
					<xsl:if test="/DTE/Documento/Encabezado/Receptor/TipoContribuyenteR = '2'">
						<xsl:element name="cac:Person">
							<xsl:element name="cbc:FirstName">
								<xsl:value-of
									select="/DTE/Documento/Encabezado/Receptor/NombreRecep/PrimerNombre"
								/>
							</xsl:element>
							<xsl:if
								test="/DTE/Documento/Encabezado/Receptor/NombreRecep/PrimerApellido">
								<xsl:element name="cbc:FamilyName">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Receptor/NombreRecep/PrimerApellido"
									/>
								</xsl:element>
							</xsl:if>
							<xsl:if
								test="/DTE/Documento/Encabezado/Receptor/NombreRecep/OtrosNombres">
								<xsl:element name="cbc:MiddleName">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Receptor/NombreRecep/OtrosNombres"
									/>
								</xsl:element>
							</xsl:if>
						</xsl:element>
					</xsl:if>
				</xsl:element>
			</xsl:element>
			<!--Persona autorizada para la descarga FALTA MAPEAR VALORES EN DTE-->
			<xsl:if test="//CodigoEmisor/TpoCdgIntEmisor = 'DescargaNIT'">
				<xsl:element name="cac:TaxRepresentativeParty">
					<xsl:element name="cac:PartyIdentification">
						<xsl:element name="cbc:ID">
							<xsl:attribute name="schemeAgencyID">
								<xsl:text>195</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="schemeAgencyName">
								<xsl:text>CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="schemeName">
								<xsl:value-of select="//CodigoEmisor[TpoCdgIntEmisor = 'DescargaType']/CdgIntEmisor"/>
							</xsl:attribute>
							<xsl:choose>
								<xsl:when test="//CodigoEmisor[TpoCdgIntEmisor = 'DescargaType']/CdgIntEmisor = '31'">
									<xsl:attribute name="schemeID">
										<xsl:call-template name="calculNIT-dv">
											<xsl:with-param name="NIT"
												select="normalize-space(//CodigoEmisor[TpoCdgIntEmisor = 'DescargaNIT']/CdgIntEmisor)"
											/>
										</xsl:call-template>
									</xsl:attribute>
								</xsl:when>
								<xsl:otherwise/>
							</xsl:choose>
							<xsl:value-of select="normalize-space(//CodigoEmisor[TpoCdgIntEmisor = 'DescargaNIT']/CdgIntEmisor)"/>
						</xsl:element>
					</xsl:element>
					<xsl:if test="//CodigoEmisor/TpoCdgIntEmisor = 'DescargaName'">
						<xsl:element name="cac:PartyName">
							<xsl:element name="cbc:Name">
								<xsl:value-of select="''"/>
							</xsl:element>
						</xsl:element>
					</xsl:if>
				</xsl:element>
			</xsl:if>
			<!--Pais Delivery en letras-->
			<xsl:variable name="PaisLugarRecep">
				<xsl:call-template name="countryName">
					<xsl:with-param name="Pais"
						select="normalize-space(/DTE/Documento/Encabezado/Receptor/LugarRecep/Pais)"
					/>
				</xsl:call-template>
			</xsl:variable>
			<!-- Allowance Charges -->
			<xsl:for-each select="/DTE/Documento/DscRcgGlobal">
				<xsl:element name="cac:AllowanceCharge">
					<xsl:element name="cbc:ID">
						<xsl:value-of select="position()"/>
					</xsl:element>
					<xsl:element name="cbc:ChargeIndicator">
						<xsl:if test="TpoMov = 'D'">
							<xsl:value-of select="'false'"/>
						</xsl:if>
						<xsl:if test="TpoMov = 'R'">
							<xsl:value-of select="'true'"/>
						</xsl:if>
					</xsl:element>
					<xsl:if test="TpoMov = 'D'">
						<xsl:element name="cbc:AllowanceChargeReasonCode">
							<xsl:choose>
								<xsl:when test="CodigoDR">
									<xsl:value-of select="CodigoDR"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="'11'"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:element>
					</xsl:if>
					<xsl:if test="GlosaDR != '' and not(//IdDoc/Tipo = '02')">
						<xsl:element name="cbc:AllowanceChargeReason">
							<xsl:value-of select="GlosaDR"/>
						</xsl:element>
					</xsl:if>
					<xsl:if test="not(GlosaDR) or Glosa = '' and not(//IdDoc/Tipo = '02')">
						<xsl:element name="cbc:AllowanceChargeReason">
							<xsl:call-template name="CodigoDescuento">
								<xsl:with-param name="CodDesc">
									<xsl:value-of select="CodigoDR"/>
								</xsl:with-param>
							</xsl:call-template>
						</xsl:element>
					</xsl:if>
					<xsl:if test="GlosaDR != '' and //IdDoc/Tipo = '02'">
						<xsl:element name="cbc:AllowanceChargeReason">
							<xsl:value-of select="GlosaDR"/>
						</xsl:element>
					</xsl:if>
					<xsl:element name="cbc:MultiplierFactorNumeric">
						<xsl:value-of select="format-number(PctDR, '#0.00')"/>
					</xsl:element>
					<xsl:element name="cbc:Amount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="format-number(ValorDR, '#0.00')"/>
					</xsl:element>
					<xsl:element name="cbc:BaseAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="format-number(ValorDR div (PctDR div 100), '#0.00')"/>
					</xsl:element>
				</xsl:element>
			</xsl:for-each>
			<!-- Delivery -->
			<xsl:if test="DTE/Documento/Encabezado/Receptor/LugarRecep">
				<xsl:element name="cac:Delivery">
					<xsl:choose>
						<xsl:when test="/DTE/Documento/Encabezado/IdDoc/FechaCancel != ''">
							<xsl:element name="cbc:ActualDeliveryDate">
								<xsl:value-of select="substring(/DTE/Documento/Encabezado/IdDoc/FechaCancel, 1, 10)"/>
							</xsl:element>
							<!--<xsl:element name="cbc:ActualDeliveryTime">
							<xsl:value-of select="substring(/DTE/Documento/Encabezado/Traslado/PeriodoDesde, 12, 8)"/>
							</xsl:element>-->
						</xsl:when>
						<xsl:otherwise>
							<xsl:element name="cbc:ActualDeliveryDate">
								<xsl:value-of
									select="substring(/DTE/Documento/Encabezado/IdDoc/FechaEmis, 1, 10)"/>
							</xsl:element>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:element name="cac:DeliveryAddress">
						<xsl:element name="cbc:ID">
							<xsl:value-of
								select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Ciudad"
							/>
						</xsl:element>
						<xsl:element name="cbc:CityName">
							<xsl:call-template name="cityName">
								<xsl:with-param name="Municipio"
									select="normalize-space(/DTE/Documento/Encabezado/Receptor/LugarRecep/Ciudad)"
								/>
							</xsl:call-template>
						</xsl:element>
						<xsl:if test="/DTE/Documento/Encabezado/Receptor/LugarRecep/CodigoPostal != ''">
							<xsl:element name="cbc:PostalZone">
								<xsl:value-of select="/DTE/Documento/Encabezado/Receptor/LugarRecep/CodigoPostal"/>
							</xsl:element>
						</xsl:if>
						<xsl:element name="cbc:CountrySubentity">
							<xsl:call-template name="cityName">
								<xsl:with-param name="Municipio"
									select="normalize-space(/DTE/Documento/Encabezado/Receptor/LugarRecep/Ciudad)"
								/>
							</xsl:call-template>
							<xsl:value-of
								select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Departamento"
							/>
						</xsl:element>
						<xsl:element name="cbc:CountrySubentityCode">
							<xsl:value-of
								select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Departamento"
							/>
						</xsl:element>
						<xsl:element name="cac:AddressLine">
							<xsl:element name="cbc:Line">
								<xsl:value-of
									select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Calle"/>
							</xsl:element>
						</xsl:element>
						<xsl:element name="cac:Country">
							<xsl:element name="cbc:IdentificationCode">
								<xsl:value-of
									select="/DTE/Documento/Encabezado/Receptor/LugarRecep/Pais"/>
							</xsl:element>
							<xsl:element name="cbc:Name">
								<xsl:attribute name="languageID">
									<xsl:text>es</xsl:text>
								</xsl:attribute>
								<xsl:value-of
									select="concat(substring($PaisLugarRecep, 1, 1), lower-case(substring($PaisLugarRecep, 2, 100)))"
								/>
							</xsl:element>
						</xsl:element>
					</xsl:element>
					<xsl:if test="/DTE/Documento/Encabezado/Transporte/NmbTransp">
						<xsl:element name="cac:DeliveryParty">
							<xsl:element name="cac:PartyName">
								<xsl:element name="cbc:Name">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Transporte/NmbTransp"/>
								</xsl:element>
							</xsl:element>
							<xsl:element name="cac:PhysicalLocation">
								<xsl:element name="cac:Address">
									<xsl:element name="cbc:ID">
										<xsl:value-of
											select="/DTE/Documento/Encabezado/Transporte/DomFiscalTransp/Ciudad"
										/>
									</xsl:element>
									<xsl:element name="cbc:CityName">
										<xsl:call-template name="cityName">
											<xsl:with-param name="Municipio"
												select="normalize-space(/DTE/Documento/Encabezado/Transporte/DomFiscalTransp/Ciudad)"
											/>
										</xsl:call-template>
									</xsl:element>
									<xsl:if test="/DTE/Documento/Encabezado/Transporte/DomFiscalTransp/CodigoPostal != ''">
										<xsl:element name="cbc:PostalZone">
											<xsl:value-of select="/DTE/Documento/Encabezado/Transporte/DomFiscalTransp/CodigoPostal"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cbc:CountrySubentity">
										<xsl:call-template name="countrySubentityName">
											<xsl:with-param name="Departamento"
												select="normalize-space(/DTE/Documento/Encabezado/Transporte/DomFiscalTransp/Departamento)"
											/>
										</xsl:call-template>
									</xsl:element>
									<xsl:element name="cbc:CountrySubentityCode">
										<xsl:value-of
											select="/DTE/Documento/Encabezado/Transporte/DomFiscalTransp/Departamento"
										/>
									</xsl:element>
									<xsl:element name="cac:AddressLine">
										<xsl:element name="cbc:Line">
											<xsl:value-of
												select="/DTE/Documento/Encabezado/Transporte/DomFiscalTransp/Calle"
											/>
										</xsl:element>
									</xsl:element>
									<xsl:element name="cac:Country">
										<xsl:element name="cbc:IdentificationCode">
											<xsl:value-of
												select="/DTE/Documento/Encabezado/Transporte/DomFiscalTransp/Pais"
											/>
										</xsl:element>
										<xsl:element name="cbc:Name">
											<xsl:attribute name="languageID">
												<xsl:text>es</xsl:text>
											</xsl:attribute>
											<xsl:value-of
												select="concat(substring($PaisLugarRecep, 1, 1), lower-case(substring($PaisLugarRecep, 2, 100)))"
											/>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:element>
							<xsl:element name="cac:PartyTaxScheme">
								<xsl:element name="cbc:RegistrationName">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Transporte/NmbTransp"/>
								</xsl:element>
								<xsl:element name="cbc:CompanyID">
									<xsl:attribute name="schemeID">
										<xsl:call-template name="calculNIT-dv">
											<xsl:with-param name="NIT"
												select="normalize-space(/DTE/Documento/Encabezado/Transporte/DocTransp/NroDocTransp)"
											/>
										</xsl:call-template>
									</xsl:attribute>
									<xsl:attribute name="schemeName">
										<xsl:value-of
											select="/DTE/Documento/Encabezado/Transporte/DocTransp/TipoDocTransp"
										/>
									</xsl:attribute>
									<xsl:attribute name="schemeAgencyName">
										<xsl:text>CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)</xsl:text>
									</xsl:attribute>
									<xsl:attribute name="schemeAgencyID">
										<xsl:text>195</xsl:text>
									</xsl:attribute>
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Transporte/DocTransp/NroDocTransp"
									/>
								</xsl:element>
								<xsl:element name="cbc:TaxLevelCode">
									<xsl:attribute name="listName">
										<xsl:value-of
											select="/DTE/Documento/Encabezado/Transporte/CodigoTransp[TpoCdgIntTransp = 'TpoReg']/CdgIntTransp/text()"
										/>
									</xsl:attribute>
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Transporte/CodigoTransp[TpoCdgIntTransp = 'TpoObl']/CdgIntTransp/text()"
									/>
								</xsl:element>
								<xsl:element name="cac:TaxScheme">
									<xsl:element name="cbc:ID">
										<xsl:text>01</xsl:text>
									</xsl:element>
									<xsl:element name="cbc:Name">
										<xsl:text>IVA</xsl:text>
									</xsl:element>
								</xsl:element>
							</xsl:element>
							<xsl:element name="cac:PartyLegalEntity">
								<xsl:element name="cbc:RegistrationName">
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Transporte/NmbTransp"/>
								</xsl:element>
								<xsl:element name="cbc:CompanyID">
									<xsl:attribute name="schemeID">
										<xsl:call-template name="calculNIT-dv">
											<xsl:with-param name="NIT"
												select="normalize-space(/DTE/Documento/Encabezado/Transporte/DocTransp/NroDocTransp)"
											/>
										</xsl:call-template>
									</xsl:attribute>
									<xsl:attribute name="schemeName">
										<xsl:value-of
											select="/DTE/Documento/Encabezado/Transporte/DocTransp/TipoDocTransp"
										/>
									</xsl:attribute>
									<xsl:attribute name="schemeAgencyName">
										<xsl:text>CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)</xsl:text>
									</xsl:attribute>
									<xsl:attribute name="schemeAgencyID">
										<xsl:text>195</xsl:text>
									</xsl:attribute>
									<xsl:value-of
										select="/DTE/Documento/Encabezado/Transporte/DocTransp/NroDocTransp"
									/>
								</xsl:element>
								<xsl:element name="cac:CorporateRegistrationScheme">
									<xsl:element name="cbc:Name">
										<xsl:value-of
											select="/DTE/Documento/Encabezado/Transporte/CodigoTransp[TpoCdgIntTransp = 'MatMerc']/CdgIntTransp/text()"
										/>
									</xsl:element>
								</xsl:element>
							</xsl:element>
							<!-- Contact of the transportista -->
							<xsl:if test="/DTE/Documento/Encabezado/Transporte/ContactoTransp">
								<xsl:element name="cac:Contact">
									<xsl:if
										test="/DTE/Documento/Encabezado/Transporte/ContactoTransp/Nombre">
										<xsl:element name="cbc:Name">
											<xsl:value-of
												select="/DTE/Documento/Encabezado/Transporte/ContactoTransp/Nombre"
											/>
										</xsl:element>
									</xsl:if>
									<xsl:if
										test="/DTE/Documento/Encabezado/Transporte/ContactoTransp/Telefono">
										<xsl:element name="cbc:Telephone">
											<xsl:value-of
												select="/DTE/Documento/Encabezado/Transporte/ContactoTransp/Telefono"
											/>
										</xsl:element>
									</xsl:if>
									<xsl:if
										test="/DTE/Documento/Encabezado/Transporte/ContactoTransp/Fax">
										<xsl:element name="cbc:Telefax">
											<xsl:value-of
												select="/DTE/Documento/Encabezado/Transporte/ContactoTransp/Fax"
											/>
										</xsl:element>
									</xsl:if>
									<xsl:if
										test="/DTE/Documento/Encabezado/Transporte/ContactoTransp/eMail">
										<xsl:element name="cbc:ElectronicMail">
											<xsl:value-of
												select="/DTE/Documento/Encabezado/Transporte/ContactoTransp/eMail"
											/>
										</xsl:element>
									</xsl:if>
									<xsl:if
										test="/DTE/Documento/Encabezado/Transporte/ContactoTransp/Descripcion">
										<xsl:element name="cbc:Note">
											<xsl:value-of
												select="/DTE/Documento/Encabezado/Transporte/ContactoTransp/Descripcion"
											/>
										</xsl:element>
									</xsl:if>
									<xsl:if
										test="/DTE/Documento/Encabezado/Transporte/ContactoTransp[Tipo = 'Distrib']/eMail">
										<xsl:element name="cac:OtherCommunication">
											<xsl:element name="cbc:Channel">
												<xsl:text>email</xsl:text>
											</xsl:element>
											<xsl:element name="cbc:Value">
												<xsl:value-of
												select="/DTE/Documento/Encabezado/Transporte/ContactoTransp[Tipo = 'Distrib']/eMail"
												/>
											</xsl:element>
										</xsl:element>
									</xsl:if>
								</xsl:element>
							</xsl:if>
						</xsl:element>
					</xsl:if>
				</xsl:element>
			</xsl:if>
			<!-- Delivery Terms -->
			<xsl:if test="DTE/Documento/Encabezado/IdDoc/Incoterms">
				<xsl:element name="cac:DeliveryTerms">
					<xsl:if test="DTE/Documento/Encabezado/IdDoc/TermPagoCdg">
						<xsl:element name="cbc:SpecialTerms">
							<xsl:value-of select="DTE/Documento/Encabezado/IdDoc/TermPagoCdg"/>
						</xsl:element>
					</xsl:if>
					<xsl:element name="cbc:LossRiskResponsibilityCode">
						<xsl:value-of select="DTE/Documento/Encabezado/IdDoc/Incoterms/CodIncoterms"
						/>
					</xsl:element>
					<xsl:element name="cbc:LossRisk">
						<xsl:value-of select="DTE/Documento/Encabezado/IdDoc/Incoterms/IncotermDs"/>
					</xsl:element>
				</xsl:element>
			</xsl:if>
			<!-- Payment Means -->
			<xsl:if test="/DTE/Documento/Encabezado/IdDoc/MedioPago">
				<xsl:element name="cac:PaymentMeans">
					<xsl:element name="cbc:ID">
						<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/TipoNegociacion"/>
					</xsl:element>
					<xsl:element name="cbc:PaymentMeansCode">
						<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/MedioPago"/>
					</xsl:element>
					<xsl:if test="/DTE/Documento/Encabezado/IdDoc/FechaVenc">
						<xsl:element name="cbc:PaymentDueDate">
							<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/FechaVenc"/>
						</xsl:element>
					</xsl:if>
					<xsl:if test="/DTE/Documento/Encabezado/IdDoc/IDPago != ''">
						<xsl:element name="cbc:PaymentID">
							<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/IDPago"/>
						</xsl:element>
					</xsl:if>
				</xsl:element>
			</xsl:if>
			<!--Terminos de Pago DIAN MYPE -->
			<!--<xsl:variable name="TipoNegociacion"
select="/DTE/Documento/Encabezado/IdDoc/TipoNegociacion"/>
<xsl:variable name="Plazo" select="/DTE/Documento/Encabezado/IdDoc/Plazo"/>
<xsl:choose>
<xsl:when test="$TipoNegociacion != '' and $Plazo != ''">
<xsl:element name="cac:PaymentTerms">
	<xsl:element name="cbc:ReferenceEventCode">
		<xsl:value-of select="$TipoNegociacion"/>
		<!-\- Codigo Medio Pago -\->
	</xsl:element>
	<xsl:element name="cac:SettlementPeriod">
		<xsl:element name="cbc:DurationMeasure">
			<xsl:attribute name="unitCode">
				<xsl:text>DAY</xsl:text>
			</xsl:attribute>
			<xsl:value-of select="$Plazo"/>
			<!-\- Plazo de Pago expresado en dias -\->
		</xsl:element>
	</xsl:element>
</xsl:element>
</xsl:when>
</xsl:choose>-->
			<!-- Prepaid Payment -->
			<!--<xsl:if test="//*[local-name() = 'PrepaidPayment']/*[local-name() = 'PaidAmount']">
<xsl:element name="cac:PrepaidPayment">
<xsl:element name="cbc:ID"/>
<xsl:element name="cbc:PaidAmount">
	<xsl:attribute name="currencyID">
		<xsl:value-of select="$MonedaC"/>
	</xsl:attribute>
	<xsl:value-of
		select="//*[local-name() = 'PrepaidPayment']/*[local-name() = 'PaidAmount']"
	/>
</xsl:element>
<xsl:if
	test="//*[local-name() = 'PrepaidPayment']/*[local-name() = 'ReceivedDate']">
	<xsl:element name="cbc:ReceivedDate">
		<xsl:value-of
			select="//*[local-name() = 'PrepaidPayment']/*[local-name() = 'ReceivedDate']"
		/>
	</xsl:element>
</xsl:if>
<xsl:if test="//*[local-name() = 'PrepaidPayment']/*[local-name() = 'PaidDate']">
	<xsl:element name="cbc:PaidDate">
		<xsl:value-of
			select="//*[local-name() = 'PrepaidPayment']/*[local-name() = 'PaidDate']"
		/>
	</xsl:element>
</xsl:if>
<xsl:if test="//*[local-name() = 'PrepaidPayment']/*[local-name() = 'PaidTime']">
	<xsl:element name="cbc:PaidTime">
		<xsl:value-of
			select="//*[local-name() = 'PrepaidPayment']/*[local-name() = 'PaidTime']"
		/>
	</xsl:element>
</xsl:if>
<xsl:if
	test="//*[local-name() = 'PrepaidPayment']/*[local-name() = 'InstructionID']">
	<xsl:element name="cbc:InstructionID">
		<xsl:value-of
			select="//*[local-name() = 'PrepaidPayment']/*[local-name() = 'InstructionID']"
		/>
	</xsl:element>
</xsl:if>
</xsl:element>
</xsl:if>-->
			<!-- Payment Exchange Rate -->
			<xsl:if test="$MonedaC != 'COP'">
				<xsl:element name="cac:PaymentExchangeRate">
					<xsl:element name="cbc:SourceCurrencyCode">
						<xsl:value-of select="$MonedaC"/>
					</xsl:element>
					<xsl:element name="cbc:SourceCurrencyBaseRate">
						<xsl:value-of select="'1.00'"/>
					</xsl:element>
					<xsl:element name="cbc:TargetCurrencyCode">
						<xsl:value-of select="'COP'"/>
					</xsl:element>
					<xsl:element name="cbc:TargetCurrencyBaseRate">
						<xsl:value-of select="'1.00'"/>
					</xsl:element>
					<xsl:element name="cbc:CalculationRate">
						<xsl:value-of select="/DTE/Documento/Encabezado/Totales/FctConv"/>
					</xsl:element>
					<xsl:element name="cbc:Date">
						<xsl:value-of
							select="substring-before(/DTE/Documento/Encabezado/IdDoc/FechaEmis, 'T')"
						/>
					</xsl:element>
				</xsl:element>
			</xsl:if>
			<!-- Impuestos a nivel global -->
			<xsl:variable name="SumImp01">
				<xsl:value-of select="sum(/DTE/Documento/Encabezado/Impuestos[TipoImp = '01']/MontoImp)"/>
			</xsl:variable>
			<xsl:variable name="SumImpBase01">
				<xsl:value-of select="(sum((/DTE/Documento/Encabezado/Impuestos[TipoImp = '01'][1]/MontoBAseImp[1]*((/DTE/Documento/Encabezado/Impuestos[TipoImp = '01'][1]/TasaImp[1]) div 100))-/DTE/Documento/Encabezado/Impuestos[TipoImp = '01'][1]/MontoImp[1])) + (sum((/DTE/Documento/Encabezado/Impuestos[TipoImp = '01'][2]/MontoBAseImp[2]*((/DTE/Documento/Encabezado/Impuestos[TipoImp = '01'][2]/TasaImp[2]) div 100))-/DTE/Documento/Encabezado/Impuestos[TipoImp = '01'][2]/MontoImp[2])) + (sum((/DTE/Documento/Encabezado/Impuestos[TipoImp = '01'][3]/MontoBAseImp[3]*((/DTE/Documento/Encabezado/Impuestos[TipoImp = '01'][3]/TasaImp[3]) div 100))-/DTE/Documento/Encabezado/Impuestos[TipoImp = '01'][3]/MontoImp[3]))"/>
			</xsl:variable>
			<xsl:variable name="SumImp02">
				<xsl:value-of select="sum(/DTE/Documento/Encabezado/Impuestos[TipoImp = '02']/MontoImp)"/>
			</xsl:variable>
			<xsl:variable name="SumImpBase02">
				<xsl:value-of select="(sum((/DTE/Documento/Encabezado/Impuestos[TipoImp = '02'][1]/MontoBAseImp[1]*((/DTE/Documento/Encabezado/Impuestos[TipoImp = '02'][1]/TasaImp[1]) div 100))-/DTE/Documento/Encabezado/Impuestos[TipoImp = '02'][1]/MontoImp[1])) + (sum((/DTE/Documento/Encabezado/Impuestos[TipoImp = '02'][2]/MontoBAseImp[2]*((/DTE/Documento/Encabezado/Impuestos[TipoImp = '02'][2]/TasaImp[2]) div 100))-/DTE/Documento/Encabezado/Impuestos[TipoImp = '02'][2]/MontoImp[2])) + (sum((/DTE/Documento/Encabezado/Impuestos[TipoImp = '02'][3]/MontoBAseImp[3]*((/DTE/Documento/Encabezado/Impuestos[TipoImp = '02'][3]/TasaImp[3]) div 100))-/DTE/Documento/Encabezado/Impuestos[TipoImp = '02'][3]/MontoImp[3]))"/>
			</xsl:variable>
			<xsl:variable name="SumImp03">
				<xsl:value-of select="sum(/DTE/Documento/Encabezado/Impuestos[TipoImp = '03']/MontoImp)"/>
			</xsl:variable>
			<xsl:variable name="SumImpBase03">
				<xsl:value-of select="(sum((/DTE/Documento/Encabezado/Impuestos[TipoImp = '03'][1]/MontoBAseImp[1]*((/DTE/Documento/Encabezado/Impuestos[TipoImp = '03'][1]/TasaImp[1]) div 100))-/DTE/Documento/Encabezado/Impuestos[TipoImp = '03'][1]/MontoImp[1])) + (sum((/DTE/Documento/Encabezado/Impuestos[TipoImp = '03'][2]/MontoBAseImp[2]*((/DTE/Documento/Encabezado/Impuestos[TipoImp = '03'][2]/TasaImp[2]) div 100))-/DTE/Documento/Encabezado/Impuestos[TipoImp = '03'][2]/MontoImp[2])) + (sum((/DTE/Documento/Encabezado/Impuestos[TipoImp = '03'][3]/MontoBAseImp[3]*((/DTE/Documento/Encabezado/Impuestos[TipoImp = '03'][3]/TasaImp[3]) div 100))-/DTE/Documento/Encabezado/Impuestos[TipoImp = '03'][3]/MontoImp[3]))"/>
			</xsl:variable>
			<xsl:variable name="SumImp04">
				<xsl:value-of select="sum(/DTE/Documento/Encabezado/Impuestos[TipoImp = '04']/MontoImp)"/>
			</xsl:variable>
			<xsl:variable name="SumImpBase04">
				<xsl:value-of select="(sum((/DTE/Documento/Encabezado/Impuestos[TipoImp = '04'][1]/MontoBAseImp[1]*((/DTE/Documento/Encabezado/Impuestos[TipoImp = '04'][1]/TasaImp[1]) div 100))-/DTE/Documento/Encabezado/Impuestos[TipoImp = '04'][1]/MontoImp[1])) + (sum((/DTE/Documento/Encabezado/Impuestos[TipoImp = '04'][2]/MontoBAseImp[2]*((/DTE/Documento/Encabezado/Impuestos[TipoImp = '04'][2]/TasaImp[2]) div 100))-/DTE/Documento/Encabezado/Impuestos[TipoImp = '04'][2]/MontoImp[2])) + (sum((/DTE/Documento/Encabezado/Impuestos[TipoImp = '04'][3]/MontoBAseImp[3]*((/DTE/Documento/Encabezado/Impuestos[TipoImp = '04'][3]/TasaImp[3]) div 100))-/DTE/Documento/Encabezado/Impuestos[TipoImp = '04'][3]/MontoImp[3]))"/>
			</xsl:variable>
			<xsl:variable name="SumImp20">
				<xsl:value-of select="sum(/DTE/Documento/Encabezado/Impuestos[TipoImp = '20']/MontoImp)"/>
			</xsl:variable>
			<xsl:variable name="SumImp21">
				<xsl:value-of select="sum(/DTE/Documento/Encabezado/Impuestos[TipoImp = '21']/MontoImp)"/>
			</xsl:variable>
			<xsl:variable name="SumImp22">
				<xsl:value-of select="sum(/DTE/Documento/Encabezado/Impuestos[TipoImp = '22']/MontoImp)"/>
			</xsl:variable>
			<xsl:variable name="SumImp23">
				<xsl:value-of select="sum(/DTE/Documento/Encabezado/Impuestos[TipoImp = '23']/MontoImp)"/>
			</xsl:variable>
			<xsl:variable name="SumImp24">
				<xsl:value-of select="sum(/DTE/Documento/Encabezado/Impuestos[TipoImp = '24']/MontoImp)"/>
			</xsl:variable>
			<xsl:variable name="SumImp25">
				<xsl:value-of select="sum(/DTE/Documento/Encabezado/Impuestos[TipoImp = '25']/MontoImp)"/>
			</xsl:variable>
			<xsl:variable name="SumImp26">
				<xsl:value-of select="sum(/DTE/Documento/Encabezado/Impuestos[TipoImp = '26']/MontoImp)"/>
			</xsl:variable>
			<xsl:for-each select="/DTE/Documento/Encabezado/Impuestos[TipoImp = '01'][1]">
				<xsl:element name="cac:TaxTotal">
					<xsl:element name="cbc:TaxAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="format-number($SumImp01, '#0.00')"/>
					</xsl:element>
					<xsl:element name="cbc:RoundingAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="format-number($SumImpBase01, '#0.00')"/>
					</xsl:element>
					<xsl:for-each select="../Impuestos[TipoImp = '01']">
						<xsl:element name="cac:TaxSubtotal">
							<xsl:if test="not(PrecioPorUnidad)">
								<xsl:element name="cbc:TaxableAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of
										select="normalize-space(format-number(MontoBAseImp, '#0.00'))"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
							</xsl:element>
							<xsl:if test="UnidadMedida">
								<xsl:element name="cbc:BaseUnitMeasure">
									<xsl:attribute name="unitCode">
										<xsl:value-of select="UnidadMedida"/>
									</xsl:attribute>
									<xsl:value-of select="'1.000000'"/>
								</xsl:element>
							</xsl:if>
							<xsl:if test="PrecioPorUnidad">
								<xsl:element name="cbc:PerUnitAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cac:TaxCategory">
								<xsl:if test="not(PrecioPorUnidad)">
									<xsl:choose>
										<xsl:when test="TipoImp = '03'">
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
											</xsl:element>
										</xsl:when>
										<xsl:otherwise>
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
											</xsl:element>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:element name="cac:TaxScheme">
									<xsl:element name="cbc:ID">
										<xsl:value-of select="TipoImp"/>
									</xsl:element>
									<xsl:element name="cbc:Name">
										<xsl:call-template name="TipoImpuesto">
											<xsl:with-param name="TpoImp">
												<xsl:value-of select="TipoImp"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="/DTE/Documento/Encabezado/Impuestos[TipoImp = '02'][1]">
				<xsl:element name="cac:TaxTotal">
					<xsl:element name="cbc:TaxAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:if test="TipoImp = '02'">
							<xsl:value-of select="format-number($SumImp02, '#0.00')"/>
						</xsl:if>
					</xsl:element>
					<xsl:element name="cbc:RoundingAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="format-number($SumImpBase02, '#0.00')"/>
					</xsl:element>
					<xsl:for-each select="../Impuestos[TipoImp = '02']">
						<xsl:element name="cac:TaxSubtotal">
							<xsl:if test="not(PrecioPorUnidad)">
								<xsl:element name="cbc:TaxableAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of
										select="normalize-space(format-number(MontoBAseImp, '#0.00'))"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
							</xsl:element>
							<xsl:if test="UnidadMedida">
								<xsl:element name="cbc:BaseUnitMeasure">
									<xsl:attribute name="unitCode">
										<xsl:value-of select="UnidadMedida"/>
									</xsl:attribute>
									<xsl:value-of select="'1.000000'"/>
								</xsl:element>
							</xsl:if>
							<xsl:if test="PrecioPorUnidad">
								<xsl:element name="cbc:PerUnitAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cac:TaxCategory">
								<xsl:if test="not(PrecioPorUnidad)">
									<xsl:choose>
										<xsl:when test="TipoImp = '03'">
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
											</xsl:element>
										</xsl:when>
										<xsl:otherwise>
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
											</xsl:element>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:element name="cac:TaxScheme">
									<xsl:element name="cbc:ID">
										<xsl:value-of select="TipoImp"/>
									</xsl:element>
									<xsl:element name="cbc:Name">
										<xsl:call-template name="TipoImpuesto">
											<xsl:with-param name="TpoImp">
												<xsl:value-of select="TipoImp"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="/DTE/Documento/Encabezado/Impuestos[TipoImp = '03'][1]">
				<xsl:element name="cac:TaxTotal">
					<xsl:element name="cbc:TaxAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:if test="TipoImp = '03'">
							<xsl:value-of select="format-number($SumImp03, '#0.00')"/>
						</xsl:if>
					</xsl:element>
					<xsl:element name="cbc:RoundingAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="format-number($SumImpBase03, '#0.00')"/>
					</xsl:element>
					<xsl:for-each select="../Impuestos[TipoImp = '03']">
						<xsl:element name="cac:TaxSubtotal">
							<xsl:if test="not(PrecioPorUnidad)">
								<xsl:element name="cbc:TaxableAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of
										select="normalize-space(format-number(MontoBAseImp, '#0.00'))"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
							</xsl:element>
							<xsl:if test="UnidadMedida">
								<xsl:element name="cbc:BaseUnitMeasure">
									<xsl:attribute name="unitCode">
										<xsl:value-of select="UnidadMedida"/>
									</xsl:attribute>
									<xsl:value-of select="'1.000000'"/>
								</xsl:element>
							</xsl:if>
							<xsl:if test="PrecioPorUnidad">
								<xsl:element name="cbc:PerUnitAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cac:TaxCategory">
								<xsl:if test="not(PrecioPorUnidad)">
									<xsl:choose>
										<xsl:when test="TipoImp = '03'">
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
											</xsl:element>
										</xsl:when>
										<xsl:otherwise>
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
											</xsl:element>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:element name="cac:TaxScheme">
									<xsl:element name="cbc:ID">
										<xsl:value-of select="TipoImp"/>
									</xsl:element>
									<xsl:element name="cbc:Name">
										<xsl:call-template name="TipoImpuesto">
											<xsl:with-param name="TpoImp">
												<xsl:value-of select="TipoImp"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="/DTE/Documento/Encabezado/Impuestos[TipoImp = '04'][1]">
				<xsl:element name="cac:TaxTotal">
					<xsl:element name="cbc:TaxAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:if test="TipoImp = '04'">
							<xsl:value-of select="format-number($SumImp04, '#0.00')"/>
						</xsl:if>
					</xsl:element>
					<xsl:element name="cbc:RoundingAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="format-number($SumImpBase04, '#0.00')"/>
					</xsl:element>
					<xsl:for-each select="../Impuestos[TipoImp = '04']">
						<xsl:element name="cac:TaxSubtotal">
							<xsl:if test="not(PrecioPorUnidad)">
								<xsl:element name="cbc:TaxableAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of
										select="normalize-space(format-number(MontoBAseImp, '#0.00'))"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
							</xsl:element>
							<xsl:if test="UnidadMedida">
								<xsl:element name="cbc:BaseUnitMeasure">
									<xsl:attribute name="unitCode">
										<xsl:value-of select="UnidadMedida"/>
									</xsl:attribute>
									<xsl:value-of select="'1.000000'"/>
								</xsl:element>
							</xsl:if>
							<xsl:if test="PrecioPorUnidad">
								<xsl:element name="cbc:PerUnitAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cac:TaxCategory">
								<xsl:if test="not(PrecioPorUnidad)">
									<xsl:choose>
										<xsl:when test="TipoImp = '03'">
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
											</xsl:element>
										</xsl:when>
										<xsl:otherwise>
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
											</xsl:element>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:element name="cac:TaxScheme">
									<xsl:element name="cbc:ID">
										<xsl:value-of select="TipoImp"/>
									</xsl:element>
									<xsl:element name="cbc:Name">
										<xsl:call-template name="TipoImpuesto">
											<xsl:with-param name="TpoImp">
												<xsl:value-of select="TipoImp"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="/DTE/Documento/Encabezado/Impuestos[TipoImp = '20'][1]">
				<xsl:element name="cac:TaxTotal">
					<xsl:element name="cbc:TaxAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:if test="TipoImp = '20'">
							<xsl:value-of select="format-number($SumImp20, '#0.00')"/>
						</xsl:if>
					</xsl:element>
					<xsl:for-each select="../Impuestos[TipoImp = '20']">
						<xsl:element name="cac:TaxSubtotal">
							<xsl:if test="not(PrecioPorUnidad)">
								<xsl:element name="cbc:TaxableAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of
										select="normalize-space(format-number(MontoBAseImp, '#0.00'))"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
							</xsl:element>
							<xsl:if test="UnidadMedida">
								<xsl:element name="cbc:BaseUnitMeasure">
									<xsl:attribute name="unitCode">
										<xsl:value-of select="UnidadMedida"/>
									</xsl:attribute>
									<xsl:value-of select="'1.000000'"/>
								</xsl:element>
							</xsl:if>
							<xsl:if test="PrecioPorUnidad">
								<xsl:element name="cbc:PerUnitAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cac:TaxCategory">
								<xsl:if test="not(PrecioPorUnidad)">
									<xsl:choose>
										<xsl:when test="TipoImp = '03'">
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
											</xsl:element>
										</xsl:when>
										<xsl:otherwise>
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
											</xsl:element>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:element name="cac:TaxScheme">
									<xsl:element name="cbc:ID">
										<xsl:value-of select="TipoImp"/>
									</xsl:element>
									<xsl:element name="cbc:Name">
										<xsl:call-template name="TipoImpuesto">
											<xsl:with-param name="TpoImp">
												<xsl:value-of select="TipoImp"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="/DTE/Documento/Encabezado/Impuestos[TipoImp = '21'][1]">
				<xsl:element name="cac:TaxTotal">
					<xsl:element name="cbc:TaxAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:if test="TipoImp = '21'">
							<xsl:value-of select="format-number($SumImp21, '#0.00')"/>
						</xsl:if>
					</xsl:element>
					<xsl:for-each select="../Impuestos[TipoImp = '21']">
						<xsl:element name="cac:TaxSubtotal">
							<xsl:if test="not(PrecioPorUnidad)">
								<xsl:element name="cbc:TaxableAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of
										select="normalize-space(format-number(MontoBAseImp, '#0.00'))"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
							</xsl:element>
							<xsl:if test="UnidadMedida">
								<xsl:element name="cbc:BaseUnitMeasure">
									<xsl:attribute name="unitCode">
										<xsl:value-of select="UnidadMedida"/>
									</xsl:attribute>
									<xsl:value-of select="'1.000000'"/>
								</xsl:element>
							</xsl:if>
							<xsl:if test="PrecioPorUnidad">
								<xsl:element name="cbc:PerUnitAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cac:TaxCategory">
								<xsl:if test="not(PrecioPorUnidad)">
									<xsl:choose>
										<xsl:when test="TipoImp = '03'">
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
											</xsl:element>
										</xsl:when>
										<xsl:otherwise>
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
											</xsl:element>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:element name="cac:TaxScheme">
									<xsl:element name="cbc:ID">
										<xsl:value-of select="TipoImp"/>
									</xsl:element>
									<xsl:element name="cbc:Name">
										<xsl:call-template name="TipoImpuesto">
											<xsl:with-param name="TpoImp">
												<xsl:value-of select="TipoImp"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="/DTE/Documento/Encabezado/Impuestos[TipoImp = '22'][1]">
				<xsl:element name="cac:TaxTotal">
					<xsl:element name="cbc:TaxAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:if test="TipoImp = '22'">
							<xsl:value-of select="format-number($SumImp22, '#0.00')"/>
						</xsl:if>
					</xsl:element>
					<xsl:for-each select="../Impuestos[TipoImp = '22']">
						<xsl:element name="cac:TaxSubtotal">
							<xsl:if test="not(PrecioPorUnidad)">
								<xsl:element name="cbc:TaxableAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of
										select="normalize-space(format-number(MontoBAseImp, '#0.00'))"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
							</xsl:element>
							<xsl:if test="UnidadMedida">
								<xsl:element name="cbc:BaseUnitMeasure">
									<xsl:attribute name="unitCode">
										<xsl:value-of select="UnidadMedida"/>
									</xsl:attribute>
									<xsl:value-of select="'1.000000'"/>
								</xsl:element>
							</xsl:if>
							<xsl:if test="PrecioPorUnidad">
								<xsl:element name="cbc:PerUnitAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cac:TaxCategory">
								<xsl:if test="not(PrecioPorUnidad)">
									<xsl:choose>
										<xsl:when test="TipoImp = '03'">
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
											</xsl:element>
										</xsl:when>
										<xsl:otherwise>
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
											</xsl:element>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:element name="cac:TaxScheme">
									<xsl:element name="cbc:ID">
										<xsl:value-of select="TipoImp"/>
									</xsl:element>
									<xsl:element name="cbc:Name">
										<xsl:call-template name="TipoImpuesto">
											<xsl:with-param name="TpoImp">
												<xsl:value-of select="TipoImp"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="/DTE/Documento/Encabezado/Impuestos[TipoImp = '23'][1]">
				<xsl:element name="cac:TaxTotal">
					<xsl:element name="cbc:TaxAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:if test="TipoImp = '23'">
							<xsl:value-of select="format-number($SumImp23, '#0.00')"/>
						</xsl:if>
					</xsl:element>
					<xsl:for-each select="../Impuestos[TipoImp = '23']">
						<xsl:element name="cac:TaxSubtotal">
							<xsl:if test="not(PrecioPorUnidad)">
								<xsl:element name="cbc:TaxableAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of
										select="normalize-space(format-number(MontoBAseImp, '#0.00'))"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
							</xsl:element>
							<xsl:if test="UnidadMedida">
								<xsl:element name="cbc:BaseUnitMeasure">
									<xsl:attribute name="unitCode">
										<xsl:value-of select="UnidadMedida"/>
									</xsl:attribute>
									<xsl:value-of select="'1.000000'"/>
								</xsl:element>
							</xsl:if>
							<xsl:if test="PrecioPorUnidad">
								<xsl:element name="cbc:PerUnitAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cac:TaxCategory">
								<xsl:if test="not(PrecioPorUnidad)">
									<xsl:choose>
										<xsl:when test="TipoImp = '03'">
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
											</xsl:element>
										</xsl:when>
										<xsl:otherwise>
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
											</xsl:element>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:element name="cac:TaxScheme">
									<xsl:element name="cbc:ID">
										<xsl:value-of select="TipoImp"/>
									</xsl:element>
									<xsl:element name="cbc:Name">
										<xsl:call-template name="TipoImpuesto">
											<xsl:with-param name="TpoImp">
												<xsl:value-of select="TipoImp"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="/DTE/Documento/Encabezado/Impuestos[TipoImp = '24'][1]">
				<xsl:element name="cac:TaxTotal">
					<xsl:element name="cbc:TaxAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:if test="TipoImp = '24'">
							<xsl:value-of select="format-number($SumImp24, '#0.00')"/>
						</xsl:if>
					</xsl:element>
					<xsl:for-each select="../Impuestos[TipoImp = '24']">
						<xsl:element name="cac:TaxSubtotal">
							<xsl:if test="not(PrecioPorUnidad)">
								<xsl:element name="cbc:TaxableAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of
										select="normalize-space(format-number(MontoBAseImp, '#0.00'))"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
							</xsl:element>
							<xsl:if test="UnidadMedida">
								<xsl:element name="cbc:BaseUnitMeasure">
									<xsl:attribute name="unitCode">
										<xsl:value-of select="UnidadMedida"/>
									</xsl:attribute>
									<xsl:value-of select="'1.000000'"/>
								</xsl:element>
							</xsl:if>
							<xsl:if test="PrecioPorUnidad">
								<xsl:element name="cbc:PerUnitAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cac:TaxCategory">
								<xsl:if test="not(PrecioPorUnidad)">
									<xsl:choose>
										<xsl:when test="TipoImp = '03'">
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
											</xsl:element>
										</xsl:when>
										<xsl:otherwise>
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
											</xsl:element>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:element name="cac:TaxScheme">
									<xsl:element name="cbc:ID">
										<xsl:value-of select="TipoImp"/>
									</xsl:element>
									<xsl:element name="cbc:Name">
										<xsl:call-template name="TipoImpuesto">
											<xsl:with-param name="TpoImp">
												<xsl:value-of select="TipoImp"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="/DTE/Documento/Encabezado/Impuestos[TipoImp = '25'][1]">
				<xsl:element name="cac:TaxTotal">
					<xsl:element name="cbc:TaxAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:if test="TipoImp = '25'">
							<xsl:value-of select="format-number($SumImp25, '#0.00')"/>
						</xsl:if>
					</xsl:element>
					<xsl:for-each select="../Impuestos[TipoImp = '25']">
						<xsl:element name="cac:TaxSubtotal">
							<xsl:if test="not(PrecioPorUnidad)">
								<xsl:element name="cbc:TaxableAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of
										select="normalize-space(format-number(MontoBAseImp, '#0.00'))"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
							</xsl:element>
							<xsl:if test="UnidadMedida">
								<xsl:element name="cbc:BaseUnitMeasure">
									<xsl:attribute name="unitCode">
										<xsl:value-of select="UnidadMedida"/>
									</xsl:attribute>
									<xsl:value-of select="'1.000000'"/>
								</xsl:element>
							</xsl:if>
							<xsl:if test="PrecioPorUnidad">
								<xsl:element name="cbc:PerUnitAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cac:TaxCategory">
								<xsl:if test="not(PrecioPorUnidad)">
									<xsl:choose>
										<xsl:when test="TipoImp = '03'">
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
											</xsl:element>
										</xsl:when>
										<xsl:otherwise>
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
											</xsl:element>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:element name="cac:TaxScheme">
									<xsl:element name="cbc:ID">
										<xsl:value-of select="TipoImp"/>
									</xsl:element>
									<xsl:element name="cbc:Name">
										<xsl:call-template name="TipoImpuesto">
											<xsl:with-param name="TpoImp">
												<xsl:value-of select="TipoImp"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="/DTE/Documento/Encabezado/Impuestos[TipoImp = '26'][1]">
				<xsl:element name="cac:TaxTotal">
					<xsl:element name="cbc:TaxAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:if test="TipoImp = '26'">
							<xsl:value-of select="format-number($SumImp26, '#0.00')"/>
						</xsl:if>
					</xsl:element>
					<xsl:for-each select="../Impuestos[TipoImp = '26']">
						<xsl:element name="cac:TaxSubtotal">
							<xsl:if test="not(PrecioPorUnidad)">
								<xsl:element name="cbc:TaxableAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of
										select="normalize-space(format-number(MontoBAseImp, '#0.00'))"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
							</xsl:element>
							<xsl:if test="UnidadMedida">
								<xsl:element name="cbc:BaseUnitMeasure">
									<xsl:attribute name="unitCode">
										<xsl:value-of select="UnidadMedida"/>
									</xsl:attribute>
									<xsl:value-of select="'1.000000'"/>
								</xsl:element>
							</xsl:if>
							<xsl:if test="PrecioPorUnidad">
								<xsl:element name="cbc:PerUnitAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="cac:TaxCategory">
								<xsl:if test="not(PrecioPorUnidad)">
									<xsl:choose>
										<xsl:when test="TipoImp = '03'">
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
											</xsl:element>
										</xsl:when>
										<xsl:otherwise>
											<xsl:element name="cbc:Percent">
												<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
											</xsl:element>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:element name="cac:TaxScheme">
									<xsl:element name="cbc:ID">
										<xsl:value-of select="TipoImp"/>
									</xsl:element>
									<xsl:element name="cbc:Name">
										<xsl:call-template name="TipoImpuesto">
											<xsl:with-param name="TpoImp">
												<xsl:value-of select="TipoImp"/>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
			<!-- TOTALS OF THE INVOICE -->
			<xsl:variable name="HLEAmount"
				select="normalize-space(format-number(/DTE/Documento/Encabezado/Totales/SubTotal, '#0.00'))"/>
			<xsl:variable name="TEAmount"
				select="normalize-space(format-number(/DTE/Documento/Encabezado/Totales/MntBase, '#0.00'))"/>
			<xsl:variable name="TIAmount"
				select="normalize-space(format-number(/DTE/Documento/Encabezado/Totales/SubTotal + /DTE/Documento/Encabezado/Totales/MntImp, '#0.00'))"/>
			<xsl:variable name="PAmount"
				select="normalize-space(format-number(/DTE/Documento/Encabezado/Totales/VlrPagar, '#0.00'))"/>
			<xsl:variable name="DescuentoGlobal"
				select="
					if (exists(/DTE/Documento/Encabezado/Totales/MntDcto)) then
						normalize-space(format-number(/DTE/Documento/Encabezado/Totales/MntDcto, '#0.00'))
					else
						'0.00'"/>
			<xsl:variable name="OtrosCargos"
				select="
					if (exists(/DTE/Documento/Encabezado/Totales/MntRcgo)) then
						normalize-space(format-number(/DTE/Documento/Encabezado/Totales/MntRcgo, '#0.00'))
					else
						'0.00'"/>
			<xsl:variable name="Redondeo"
				select="
				if (exists(/DTE/Documento/Encabezado/Totales/SaldoAnterior)) then
				normalize-space(format-number(/DTE/Documento/Encabezado/Totales/SaldoAnterior, '#0.00'))
				else
				'0.00'"/>
			<xsl:element name="cac:RequestedMonetaryTotal">
				<xsl:if test="$HLEAmount != ''">
					<xsl:element name="cbc:LineExtensionAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="$HLEAmount"/>
					</xsl:element>
				</xsl:if>
				<xsl:if test="$TEAmount != ''">
					<xsl:element name="cbc:TaxExclusiveAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="$TEAmount"/>
					</xsl:element>
				</xsl:if>
				<xsl:if test="$TIAmount != '' and $TIAmount != 'NaN'">
					<xsl:element name="cbc:TaxInclusiveAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="$TIAmount"/>
					</xsl:element>
				</xsl:if>
				<!-- Global Discount -->
				<xsl:if test="$DescuentoGlobal != 'NaN' and number($DescuentoGlobal) != 0.00">
					<xsl:element name="cbc:AllowanceTotalAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="$DescuentoGlobal"/>
					</xsl:element>
				</xsl:if>
				<!--Other charges-->
				<xsl:if test="number($OtrosCargos) != 0.00 and $OtrosCargos != 'NaN'">
					<xsl:element name="cbc:ChargeTotalAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="$OtrosCargos"/>
					</xsl:element>
				</xsl:if>
				<!--Payable Rounding Amount of Invoice-->
				<xsl:if test="number($Redondeo) != 0.00 and $Redondeo != 'NaN'">
					<xsl:element name="cbc:PayableRoundingAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="$Redondeo"/>
					</xsl:element>
				</xsl:if>
				<!--Payable Amount of Invoice -->
				<xsl:element name="cbc:PayableAmount">
					<xsl:attribute name="currencyID">
						<xsl:value-of select="$MonedaC"/>
					</xsl:attribute>
					<xsl:value-of select="$PAmount"/>
				</xsl:element>
			</xsl:element>
			<!--DETAIL SECTION -->
			<xsl:for-each select="/DTE/Documento/Detalle">
				<xsl:element name="cac:DebitNoteLine">
					<!--Invoice Line ID-->
					<xsl:element name="cbc:ID">
						<xsl:value-of select="position()"/>
					</xsl:element>
					<xsl:if test="DscLang != ''">
						<xsl:element name="cbc:Note">
							<xsl:value-of select="DscLang"/>
						</xsl:element>
					</xsl:if>
					<xsl:element name="cbc:DebitedQuantity">
						<!--Unit of Measure -->
						<xsl:attribute name="unitCode">
							<xsl:value-of select="UnmdItem"/>
						</xsl:attribute>
						<xsl:value-of select="format-number(QtyItem, '#0.000000')"/>
					</xsl:element>
					<xsl:variable name="LineExtentionAmount">
						<xsl:value-of select="format-number(MontoTotalItem, '#0.00')"/>
					</xsl:variable>
					<xsl:element name="cbc:LineExtensionAmount">
						<xsl:attribute name="currencyID">
							<xsl:value-of select="$MonedaC"/>
						</xsl:attribute>
						<xsl:value-of select="format-number($LineExtentionAmount, '#0.00')"/>
					</xsl:element>
					<!--Precio referencia en caso de ser Item gratuito -->
					<xsl:if test="MontoTotalItem = 0 and SubMonto[Tipo = 'FREE']/MontoConcepto">
						<xsl:element name="cac:PricingReference">
							<xsl:element name="cac:AlternativeConditionPrice">
								<xsl:element name="cbc:PriceAmount">
									<xsl:attribute name="currencyID">
										<xsl:value-of select="$MonedaC"/>
									</xsl:attribute>
									<xsl:value-of select="SubMonto[Tipo = 'FREE']/MontoConcepto"/>
								</xsl:element>
								<xsl:element name="cbc:PriceTypeCode">
									<xsl:value-of select="SubMonto[Tipo = 'FREE']/CodTipoMonto"/>
								</xsl:element>
								<xsl:element name="cbc:PriceType">
									<xsl:call-template name="CodigoPrecioRef">
										<xsl:with-param name="CodRef">
											<xsl:value-of
												select="SubMonto[Tipo = 'FREE']/CodTipoMonto"/>
										</xsl:with-param>
									</xsl:call-template>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:if>
					<!--Item' taxes-->
					<xsl:variable name="SumImpDet01">
						<xsl:value-of select="sum(ImpuestosDet[TipoImp = '01']/MontoImp)"/>
					</xsl:variable>
					<xsl:variable name="SumBaseImpDet01">
						<xsl:value-of select="(sum((ImpuestosDet[TipoImp = '01'][1]/MontoBaseImp[1]*((ImpuestosDet[TipoImp = '01'][1]/TasaImp[1]) div 100))-ImpuestosDet[TipoImp = '01'][1]/MontoImp[1])) + sum((ImpuestosDet[TipoImp = '01'][2]/MontoBaseImp[2]*((ImpuestosDet[TipoImp = '01'][2]/TasaImp[2]) div 100))-ImpuestosDet[TipoImp = '01'][2]/MontoImp[2]) + sum((ImpuestosDet[TipoImp = '01'][3]/MontoBaseImp[3]*((ImpuestosDet[TipoImp = '01'][3]/TasaImp[3]) div 100))-ImpuestosDet[TipoImp = '01'][3]/MontoImp[3])"/>
					</xsl:variable>
					<xsl:variable name="SumImpDet02">
						<xsl:value-of select="sum(ImpuestosDet[TipoImp = '02']/MontoImp)"/>
					</xsl:variable>
					<xsl:variable name="SumBaseImpDet02">
						<xsl:value-of select="(sum((ImpuestosDet[TipoImp = '02'][1]/MontoBaseImp[1]*((ImpuestosDet[TipoImp = '02'][1]/TasaImp[1]) div 100))-ImpuestosDet[TipoImp = '02'][1]/MontoImp[1])) + sum((ImpuestosDet[TipoImp = '02'][2]/MontoBaseImp[2]*((ImpuestosDet[TipoImp = '02'][2]/TasaImp[2]) div 100))-ImpuestosDet[TipoImp = '02'][2]/MontoImp[2]) + sum((ImpuestosDet[TipoImp = '02'][3]/MontoBaseImp[3]*((ImpuestosDet[TipoImp = '02'][3]/TasaImp[3]) div 100))-ImpuestosDet[TipoImp = '02'][3]/MontoImp[3])"/>
					</xsl:variable>
					<xsl:variable name="SumImpDet03">
						<xsl:value-of select="sum(ImpuestosDet[TipoImp = '03']/MontoImp)"/>
					</xsl:variable>
					<xsl:variable name="SumBaseImpDet03">
						<xsl:value-of select="(sum((ImpuestosDet[TipoImp = '03'][1]/MontoBaseImp[1]*((ImpuestosDet[TipoImp = '03'][1]/TasaImp[1]) div 100))-ImpuestosDet[TipoImp = '03'][1]/MontoImp[1])) + sum((ImpuestosDet[TipoImp = '03'][2]/MontoBaseImp[2]*((ImpuestosDet[TipoImp = '03'][2]/TasaImp[2]) div 100))-ImpuestosDet[TipoImp = '03'][2]/MontoImp[2]) + sum((ImpuestosDet[TipoImp = '03'][3]/MontoBaseImp[3]*((ImpuestosDet[TipoImp = '03'][3]/TasaImp[3]) div 100))-ImpuestosDet[TipoImp = '03'][3]/MontoImp[3])"/>
					</xsl:variable>
					<xsl:variable name="SumImpDet04">
						<xsl:value-of select="sum(ImpuestosDet[TipoImp = '04']/MontoImp)"/>
					</xsl:variable>
					<xsl:variable name="SumBaseImpDet04">
						<xsl:value-of select="(sum((ImpuestosDet[TipoImp = '04'][1]/MontoBaseImp[1]*((ImpuestosDet[TipoImp = '04'][1]/TasaImp[1]) div 100))-ImpuestosDet[TipoImp = '04'][1]/MontoImp[1])) + sum((ImpuestosDet[TipoImp = '04'][2]/MontoBaseImp[2]*((ImpuestosDet[TipoImp = '04'][2]/TasaImp[2]) div 100))-ImpuestosDet[TipoImp = '04'][2]/MontoImp[2]) + sum((ImpuestosDet[TipoImp = '04'][3]/MontoBaseImp[3]*((ImpuestosDet[TipoImp = '04'][3]/TasaImp[3]) div 100))-ImpuestosDet[TipoImp = '04'][3]/MontoImp[3])"/>
					</xsl:variable>
					<xsl:variable name="SumImpDet20">
						<xsl:value-of select="sum(ImpuestosDet[TipoImp = '20']/MontoImp)"/>
					</xsl:variable>
					<xsl:variable name="SumImpDet21">
						<xsl:value-of select="sum(ImpuestosDet[TipoImp = '21']/MontoImp)"/>
					</xsl:variable>
					<xsl:variable name="SumImpDet22">
						<xsl:value-of select="sum(ImpuestosDet[TipoImp = '22']/MontoImp)"/>
					</xsl:variable>
					<xsl:variable name="SumImpDet23">
						<xsl:value-of select="sum(ImpuestosDet[TipoImp = '23']/MontoImp)"/>
					</xsl:variable>
					<xsl:variable name="SumImpDet24">
						<xsl:value-of select="sum(ImpuestosDet[TipoImp = '24']/MontoImp)"/>
					</xsl:variable>
					<xsl:variable name="SumImpDet25">
						<xsl:value-of select="sum(ImpuestosDet[TipoImp = '25']/MontoImp)"/>
					</xsl:variable>
					<xsl:variable name="SumImpDet26">
						<xsl:value-of select="sum(ImpuestosDet[TipoImp = '26']/MontoImp)"/>
					</xsl:variable>
					<xsl:for-each select="ImpuestosDet[TipoImp = '01'][1]">
						<xsl:element name="cac:TaxTotal">
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number($SumImpDet01, '#0.00')"/>
							</xsl:element>
							<xsl:element name="cbc:RoundingAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number($SumBaseImpDet01, '#0.00')"/>
							</xsl:element>
							<xsl:for-each select="../ImpuestosDet[TipoImp = '01']">
								<xsl:element name="cac:TaxSubtotal">
									<xsl:if test="not(PrecioPorUnidad)">
										<xsl:element name="cbc:TaxableAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of
												select="normalize-space(format-number(MontoBaseImp, '#0.00'))"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cbc:TaxAmount">
										<xsl:attribute name="currencyID">
											<xsl:value-of select="$MonedaC"/>
										</xsl:attribute>
										<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
									</xsl:element>
									<xsl:if test="UnidadMedida">
										<xsl:element name="cbc:BaseUnitMeasure">
											<xsl:attribute name="unitCode">
												<xsl:value-of select="UnidadMedida"/>
											</xsl:attribute>
											<xsl:value-of select="'1.000000'"/>
										</xsl:element>
									</xsl:if>
									<xsl:if test="PrecioPorUnidad">
										<xsl:element name="cbc:PerUnitAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cac:TaxCategory">
										<xsl:if test="not(PrecioPorUnidad)">
											<xsl:choose>
												<xsl:when test="TipoImp = '03'">
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
													</xsl:element>
												</xsl:when>
												<xsl:otherwise>
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
													</xsl:element>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:element name="cac:TaxScheme">
											<xsl:element name="cbc:ID">
												<xsl:value-of select="TipoImp"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:call-template name="TipoImpuesto">
													<xsl:with-param name="TpoImp">
														<xsl:value-of select="TipoImp"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:for-each>
						</xsl:element>
					</xsl:for-each>
					<xsl:for-each select="ImpuestosDet[TipoImp = '02'][1]">
						<xsl:element name="cac:TaxTotal">
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:if test="TipoImp = '02'">
									<xsl:value-of select="format-number($SumImpDet02, '#0.00')"/>
								</xsl:if>
							</xsl:element>
							<xsl:element name="cbc:RoundingAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number($SumBaseImpDet02, '#0.00')"/>
							</xsl:element>
							<xsl:for-each select="../ImpuestosDet[TipoImp = '02']">
								<xsl:element name="cac:TaxSubtotal">
									<xsl:if test="not(PrecioPorUnidad)">
										<xsl:element name="cbc:TaxableAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of
												select="normalize-space(format-number(MontoBaseImp, '#0.00'))"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cbc:TaxAmount">
										<xsl:attribute name="currencyID">
											<xsl:value-of select="$MonedaC"/>
										</xsl:attribute>
										<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
									</xsl:element>
									<xsl:if test="UnidadMedida">
										<xsl:element name="cbc:BaseUnitMeasure">
											<xsl:attribute name="unitCode">
												<xsl:value-of select="UnidadMedida"/>
											</xsl:attribute>
											<xsl:value-of select="'1.000000'"/>
										</xsl:element>
									</xsl:if>
									<xsl:if test="PrecioPorUnidad">
										<xsl:element name="cbc:PerUnitAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cac:TaxCategory">
										<xsl:if test="not(PrecioPorUnidad)">
											<xsl:choose>
												<xsl:when test="TipoImp = '03'">
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
													</xsl:element>
												</xsl:when>
												<xsl:otherwise>
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
													</xsl:element>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:element name="cac:TaxScheme">
											<xsl:element name="cbc:ID">
												<xsl:value-of select="TipoImp"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:call-template name="TipoImpuesto">
													<xsl:with-param name="TpoImp">
														<xsl:value-of select="TipoImp"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:for-each>
						</xsl:element>
					</xsl:for-each>
					<xsl:for-each select="ImpuestosDet[TipoImp = '03'][1]">
						<xsl:element name="cac:TaxTotal">
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:if test="TipoImp = '03'">
									<xsl:value-of select="format-number($SumImpDet03, '#0.00')"/>
								</xsl:if>
							</xsl:element>
							<xsl:element name="cbc:RoundingAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number($SumBaseImpDet03, '#0.00')"/>
							</xsl:element>
							<xsl:for-each select="../ImpuestosDet[TipoImp = '03']">
								<xsl:element name="cac:TaxSubtotal">
									<xsl:if test="not(PrecioPorUnidad)">
										<xsl:element name="cbc:TaxableAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of
												select="normalize-space(format-number(MontoBaseImp, '#0.00'))"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cbc:TaxAmount">
										<xsl:attribute name="currencyID">
											<xsl:value-of select="$MonedaC"/>
										</xsl:attribute>
										<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
									</xsl:element>
									<xsl:if test="UnidadMedida">
										<xsl:element name="cbc:BaseUnitMeasure">
											<xsl:attribute name="unitCode">
												<xsl:value-of select="UnidadMedida"/>
											</xsl:attribute>
											<xsl:value-of select="'1.000000'"/>
										</xsl:element>
									</xsl:if>
									<xsl:if test="PrecioPorUnidad">
										<xsl:element name="cbc:PerUnitAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cac:TaxCategory">
										<xsl:if test="not(PrecioPorUnidad)">
											<xsl:choose>
												<xsl:when test="TipoImp = '03'">
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
													</xsl:element>
												</xsl:when>
												<xsl:otherwise>
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
													</xsl:element>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:element name="cac:TaxScheme">
											<xsl:element name="cbc:ID">
												<xsl:value-of select="TipoImp"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:call-template name="TipoImpuesto">
													<xsl:with-param name="TpoImp">
														<xsl:value-of select="TipoImp"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:for-each>
						</xsl:element>
					</xsl:for-each>
					<xsl:for-each select="ImpuestosDet[TipoImp = '04'][1]">
						<xsl:element name="cac:TaxTotal">
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:if test="TipoImp = '04'">
									<xsl:value-of select="format-number($SumImpDet04, '#0.00')"/>
								</xsl:if>
							</xsl:element>
							<xsl:element name="cbc:RoundingAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number($SumBaseImpDet04, '#0.00')"/>
							</xsl:element>
							<xsl:for-each select="../ImpuestosDet[TipoImp = '04']">
								<xsl:element name="cac:TaxSubtotal">
									<xsl:if test="not(PrecioPorUnidad)">
										<xsl:element name="cbc:TaxableAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of
												select="normalize-space(format-number(MontoBaseImp, '#0.00'))"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cbc:TaxAmount">
										<xsl:attribute name="currencyID">
											<xsl:value-of select="$MonedaC"/>
										</xsl:attribute>
										<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
									</xsl:element>
									<xsl:if test="UnidadMedida">
										<xsl:element name="cbc:BaseUnitMeasure">
											<xsl:attribute name="unitCode">
												<xsl:value-of select="UnidadMedida"/>
											</xsl:attribute>
											<xsl:value-of select="'1.000000'"/>
										</xsl:element>
									</xsl:if>
									<xsl:if test="PrecioPorUnidad">
										<xsl:element name="cbc:PerUnitAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cac:TaxCategory">
										<xsl:if test="not(PrecioPorUnidad)">
											<xsl:choose>
												<xsl:when test="TipoImp = '03'">
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
													</xsl:element>
												</xsl:when>
												<xsl:otherwise>
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
													</xsl:element>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:element name="cac:TaxScheme">
											<xsl:element name="cbc:ID">
												<xsl:value-of select="TipoImp"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:call-template name="TipoImpuesto">
													<xsl:with-param name="TpoImp">
														<xsl:value-of select="TipoImp"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:for-each>
						</xsl:element>
					</xsl:for-each>
					<xsl:for-each select="ImpuestosDet[TipoImp = '20'][1]">
						<xsl:element name="cac:TaxTotal">
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:if test="TipoImp = '20'">
									<xsl:value-of select="format-number($SumImpDet20, '#0.00')"/>
								</xsl:if>
							</xsl:element>
							<xsl:for-each select="../ImpuestosDet[TipoImp = '20']">
								<xsl:element name="cac:TaxSubtotal">
									<xsl:if test="not(PrecioPorUnidad)">
										<xsl:element name="cbc:TaxableAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of
												select="normalize-space(format-number(MontoBaseImp, '#0.00'))"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cbc:TaxAmount">
										<xsl:attribute name="currencyID">
											<xsl:value-of select="$MonedaC"/>
										</xsl:attribute>
										<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
									</xsl:element>
									<xsl:if test="UnidadMedida">
										<xsl:element name="cbc:BaseUnitMeasure">
											<xsl:attribute name="unitCode">
												<xsl:value-of select="UnidadMedida"/>
											</xsl:attribute>
											<xsl:value-of select="'1.000000'"/>
										</xsl:element>
									</xsl:if>
									<xsl:if test="PrecioPorUnidad">
										<xsl:element name="cbc:PerUnitAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cac:TaxCategory">
										<xsl:if test="not(PrecioPorUnidad)">
											<xsl:choose>
												<xsl:when test="TipoImp = '03'">
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
													</xsl:element>
												</xsl:when>
												<xsl:otherwise>
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
													</xsl:element>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:element name="cac:TaxScheme">
											<xsl:element name="cbc:ID">
												<xsl:value-of select="TipoImp"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:call-template name="TipoImpuesto">
													<xsl:with-param name="TpoImp">
														<xsl:value-of select="TipoImp"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:for-each>
						</xsl:element>
					</xsl:for-each>
					<xsl:for-each select="ImpuestosDet[TipoImp = '21'][1]">
						<xsl:element name="cac:TaxTotal">
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:if test="TipoImp = '21'">
									<xsl:value-of select="format-number($SumImpDet21, '#0.00')"/>
								</xsl:if>
							</xsl:element>
							<xsl:for-each select="../ImpuestosDet[TipoImp = '21']">
								<xsl:element name="cac:TaxSubtotal">
									<xsl:if test="not(PrecioPorUnidad)">
										<xsl:element name="cbc:TaxableAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of
												select="normalize-space(format-number(MontoBaseImp, '#0.00'))"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cbc:TaxAmount">
										<xsl:attribute name="currencyID">
											<xsl:value-of select="$MonedaC"/>
										</xsl:attribute>
										<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
									</xsl:element>
									<xsl:if test="UnidadMedida">
										<xsl:element name="cbc:BaseUnitMeasure">
											<xsl:attribute name="unitCode">
												<xsl:value-of select="UnidadMedida"/>
											</xsl:attribute>
											<xsl:value-of select="'1.000000'"/>
										</xsl:element>
									</xsl:if>
									<xsl:if test="PrecioPorUnidad">
										<xsl:element name="cbc:PerUnitAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cac:TaxCategory">
										<xsl:if test="not(PrecioPorUnidad)">
											<xsl:choose>
												<xsl:when test="TipoImp = '03'">
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
													</xsl:element>
												</xsl:when>
												<xsl:otherwise>
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
													</xsl:element>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:element name="cac:TaxScheme">
											<xsl:element name="cbc:ID">
												<xsl:value-of select="TipoImp"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:call-template name="TipoImpuesto">
													<xsl:with-param name="TpoImp">
														<xsl:value-of select="TipoImp"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:for-each>
						</xsl:element>
					</xsl:for-each>
					<xsl:for-each select="ImpuestosDet[TipoImp = '22'][1]">
						<xsl:element name="cac:TaxTotal">
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:if test="TipoImp = '22'">
									<xsl:value-of select="format-number($SumImpDet22, '#0.00')"/>
								</xsl:if>
							</xsl:element>
							<xsl:for-each select="../ImpuestosDet[TipoImp = '22']">
								<xsl:element name="cac:TaxSubtotal">
									<xsl:if test="not(PrecioPorUnidad)">
										<xsl:element name="cbc:TaxableAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of
												select="normalize-space(format-number(MontoBaseImp, '#0.00'))"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cbc:TaxAmount">
										<xsl:attribute name="currencyID">
											<xsl:value-of select="$MonedaC"/>
										</xsl:attribute>
										<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
									</xsl:element>
									<xsl:if test="UnidadMedida">
										<xsl:element name="cbc:BaseUnitMeasure">
											<xsl:attribute name="unitCode">
												<xsl:value-of select="UnidadMedida"/>
											</xsl:attribute>
											<xsl:value-of select="'1.000000'"/>
										</xsl:element>
									</xsl:if>
									<xsl:if test="PrecioPorUnidad">
										<xsl:element name="cbc:PerUnitAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cac:TaxCategory">
										<xsl:if test="not(PrecioPorUnidad)">
											<xsl:choose>
												<xsl:when test="TipoImp = '03'">
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
													</xsl:element>
												</xsl:when>
												<xsl:otherwise>
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
													</xsl:element>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:element name="cac:TaxScheme">
											<xsl:element name="cbc:ID">
												<xsl:value-of select="TipoImp"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:call-template name="TipoImpuesto">
													<xsl:with-param name="TpoImp">
														<xsl:value-of select="TipoImp"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:for-each>
						</xsl:element>
					</xsl:for-each>
					<xsl:for-each select="ImpuestosDet[TipoImp = '23'][1]">
						<xsl:element name="cac:TaxTotal">
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:if test="TipoImp = '23'">
									<xsl:value-of select="format-number($SumImpDet23, '#0.00')"/>
								</xsl:if>
							</xsl:element>
							<xsl:for-each select="../ImpuestosDet[TipoImp = '23']">
								<xsl:element name="cac:TaxSubtotal">
									<xsl:if test="not(PrecioPorUnidad)">
										<xsl:element name="cbc:TaxableAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of
												select="normalize-space(format-number(MontoBaseImp, '#0.00'))"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cbc:TaxAmount">
										<xsl:attribute name="currencyID">
											<xsl:value-of select="$MonedaC"/>
										</xsl:attribute>
										<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
									</xsl:element>
									<xsl:if test="UnidadMedida">
										<xsl:element name="cbc:BaseUnitMeasure">
											<xsl:attribute name="unitCode">
												<xsl:value-of select="UnidadMedida"/>
											</xsl:attribute>
											<xsl:value-of select="'1.000000'"/>
										</xsl:element>
									</xsl:if>
									<xsl:if test="PrecioPorUnidad">
										<xsl:element name="cbc:PerUnitAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cac:TaxCategory">
										<xsl:if test="not(PrecioPorUnidad)">
											<xsl:choose>
												<xsl:when test="TipoImp = '03'">
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
													</xsl:element>
												</xsl:when>
												<xsl:otherwise>
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
													</xsl:element>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:element name="cac:TaxScheme">
											<xsl:element name="cbc:ID">
												<xsl:value-of select="TipoImp"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:call-template name="TipoImpuesto">
													<xsl:with-param name="TpoImp">
														<xsl:value-of select="TipoImp"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:for-each>
						</xsl:element>
					</xsl:for-each>
					<xsl:for-each select="ImpuestosDet[TipoImp = '24'][1]">
						<xsl:element name="cac:TaxTotal">
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:if test="TipoImp = '24'">
									<xsl:value-of select="format-number($SumImpDet24, '#0.00')"/>
								</xsl:if>
							</xsl:element>
							<xsl:for-each select="../ImpuestosDet[TipoImp = '24']">
								<xsl:element name="cac:TaxSubtotal">
									<xsl:if test="not(PrecioPorUnidad)">
										<xsl:element name="cbc:TaxableAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of
												select="normalize-space(format-number(MontoBaseImp, '#0.00'))"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cbc:TaxAmount">
										<xsl:attribute name="currencyID">
											<xsl:value-of select="$MonedaC"/>
										</xsl:attribute>
										<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
									</xsl:element>
									<xsl:if test="UnidadMedida">
										<xsl:element name="cbc:BaseUnitMeasure">
											<xsl:attribute name="unitCode">
												<xsl:value-of select="UnidadMedida"/>
											</xsl:attribute>
											<xsl:value-of select="'1.000000'"/>
										</xsl:element>
									</xsl:if>
									<xsl:if test="PrecioPorUnidad">
										<xsl:element name="cbc:PerUnitAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cac:TaxCategory">
										<xsl:if test="not(PrecioPorUnidad)">
											<xsl:choose>
												<xsl:when test="TipoImp = '03'">
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
													</xsl:element>
												</xsl:when>
												<xsl:otherwise>
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
													</xsl:element>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:element name="cac:TaxScheme">
											<xsl:element name="cbc:ID">
												<xsl:value-of select="TipoImp"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:call-template name="TipoImpuesto">
													<xsl:with-param name="TpoImp">
														<xsl:value-of select="TipoImp"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:for-each>
						</xsl:element>
					</xsl:for-each>
					<xsl:for-each select="ImpuestosDet[TipoImp = '25'][1]">
						<xsl:element name="cac:TaxTotal">
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:if test="TipoImp = '25'">
									<xsl:value-of select="format-number($SumImpDet25, '#0.00')"/>
								</xsl:if>
							</xsl:element>
							<xsl:for-each select="../ImpuestosDet[TipoImp = '25']">
								<xsl:element name="cac:TaxSubtotal">
									<xsl:if test="not(PrecioPorUnidad)">
										<xsl:element name="cbc:TaxableAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of
												select="normalize-space(format-number(MontoBaseImp, '#0.00'))"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cbc:TaxAmount">
										<xsl:attribute name="currencyID">
											<xsl:value-of select="$MonedaC"/>
										</xsl:attribute>
										<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
									</xsl:element>
									<xsl:if test="UnidadMedida">
										<xsl:element name="cbc:BaseUnitMeasure">
											<xsl:attribute name="unitCode">
												<xsl:value-of select="UnidadMedida"/>
											</xsl:attribute>
											<xsl:value-of select="'1.000000'"/>
										</xsl:element>
									</xsl:if>
									<xsl:if test="PrecioPorUnidad">
										<xsl:element name="cbc:PerUnitAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cac:TaxCategory">
										<xsl:if test="not(PrecioPorUnidad)">
											<xsl:choose>
												<xsl:when test="TipoImp = '03'">
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
													</xsl:element>
												</xsl:when>
												<xsl:otherwise>
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
													</xsl:element>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:element name="cac:TaxScheme">
											<xsl:element name="cbc:ID">
												<xsl:value-of select="TipoImp"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:call-template name="TipoImpuesto">
													<xsl:with-param name="TpoImp">
														<xsl:value-of select="TipoImp"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:for-each>
						</xsl:element>
					</xsl:for-each>
					<xsl:for-each select="ImpuestosDet[TipoImp = '26'][1]">
						<xsl:element name="cac:TaxTotal">
							<xsl:element name="cbc:TaxAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:if test="TipoImp = '26'">
									<xsl:value-of select="format-number($SumImpDet26, '#0.00')"/>
								</xsl:if>
							</xsl:element>
							<xsl:for-each select="../ImpuestosDet[TipoImp = '26']">
								<xsl:element name="cac:TaxSubtotal">
									<xsl:if test="not(PrecioPorUnidad)">
										<xsl:element name="cbc:TaxableAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of
												select="normalize-space(format-number(MontoBaseImp, '#0.00'))"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cbc:TaxAmount">
										<xsl:attribute name="currencyID">
											<xsl:value-of select="$MonedaC"/>
										</xsl:attribute>
										<xsl:value-of select="format-number(MontoImp, '#0.00')"/>
									</xsl:element>
									<xsl:if test="UnidadMedida">
										<xsl:element name="cbc:BaseUnitMeasure">
											<xsl:attribute name="unitCode">
												<xsl:value-of select="UnidadMedida"/>
											</xsl:attribute>
											<xsl:value-of select="'1.000000'"/>
										</xsl:element>
									</xsl:if>
									<xsl:if test="PrecioPorUnidad">
										<xsl:element name="cbc:PerUnitAmount">
											<xsl:attribute name="currencyID">
												<xsl:value-of select="$MonedaC"/>
											</xsl:attribute>
											<xsl:value-of select="format-number(PrecioPorUnidad, '#0.00')"/>
										</xsl:element>
									</xsl:if>
									<xsl:element name="cac:TaxCategory">
										<xsl:if test="not(PrecioPorUnidad)">
											<xsl:choose>
												<xsl:when test="TipoImp = '03'">
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.000')"/>
													</xsl:element>
												</xsl:when>
												<xsl:otherwise>
													<xsl:element name="cbc:Percent">
														<xsl:value-of select="format-number(TasaImp, '#0.00')"/>
													</xsl:element>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:element name="cac:TaxScheme">
											<xsl:element name="cbc:ID">
												<xsl:value-of select="TipoImp"/>
											</xsl:element>
											<xsl:element name="cbc:Name">
												<xsl:call-template name="TipoImpuesto">
													<xsl:with-param name="TpoImp">
														<xsl:value-of select="TipoImp"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:for-each>
						</xsl:element>
					</xsl:for-each>
					<xsl:for-each select="SubDscto">
						<xsl:element name="cac:AllowanceCharge">
							<xsl:element name="cbc:ID">
								<xsl:value-of select="position()"/>
							</xsl:element>
							<xsl:element name="cbc:ChargeIndicator">
								<xsl:value-of select="false()"/>
							</xsl:element>
							<xsl:element name="cbc:AllowanceChargeReason">
								<xsl:value-of select="GlosaDscto"/>
							</xsl:element>
							<xsl:element name="cbc:MultiplierFactorNumeric">
								<xsl:value-of select="format-number(PctDscto, '#0.00')"/>
							</xsl:element>
							<xsl:element name="cbc:Amount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number(MntDscto, '#0.00')"/>
							</xsl:element>
							<xsl:element name="cbc:BaseAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of
									select="format-number((../PrcBrutoItem * ../QtyItem), '#0.00')"
								/>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
					<!--Item' charges-->
					<xsl:for-each select="SubRecargo">
						<xsl:element name="cac:AllowanceCharge">
							<xsl:element name="cbc:ID">
								<xsl:value-of select="position()"/>
							</xsl:element>
							<xsl:element name="cbc:ChargeIndicator">
								<xsl:value-of select="true()"/>
							</xsl:element>
							<xsl:element name="cbc:AllowanceChargeReason">
								<xsl:value-of select="GlosaRecargo"/>
							</xsl:element>
							<xsl:element name="cbc:MultiplierFactorNumeric">
								<xsl:value-of select="PctRecargo"/>
							</xsl:element>
							<xsl:element name="cbc:Amount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of select="format-number(MntRecargo, '#0.00')"/>
							</xsl:element>
							<xsl:element name="cbc:BaseAmount">
								<xsl:attribute name="currencyID">
									<xsl:value-of select="$MonedaC"/>
								</xsl:attribute>
								<xsl:value-of
									select="format-number((../PrcBrutoItem * ../QtyItem), '#0.00')"
								/>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
					<xsl:element name="cac:Item">
						<!--Description of the item-->
						<xsl:element name="cbc:Description">
							<xsl:value-of select="DscItem"/>
						</xsl:element>
						<xsl:if test="CdgItem[TpoCodigo = 'INT']/VlrCodigo != ''">
							<xsl:element name="cac:SellersItemIdentification">
								<xsl:element name="cbc:ID">
									<xsl:value-of select="CdgItem[TpoCodigo = 'INT']/VlrCodigo"/>
								</xsl:element>
							</xsl:element>
						</xsl:if>
						<xsl:choose>
							<xsl:when test="CdgItem[1]/TpoCodigo != '' and CdgItem[2]/TpoCodigo != ''">
								<xsl:if test="CdgItem[TpoCodigo = '001']/VlrCodigo != ''">
									<xsl:element name="cac:StandardItemIdentification">
										<xsl:element name="cbc:ID">
											<xsl:attribute name="schemeID">
												<xsl:text>001</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeName">
												<xsl:text>UNSPSC</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeAgencyID">
												<xsl:text>10</xsl:text>
											</xsl:attribute>
											<xsl:value-of select="CdgItem[TpoCodigo = '001']/VlrCodigo"/>
										</xsl:element>
									</xsl:element>
								</xsl:if>
								<xsl:if test="CdgItem[TpoCodigo = '010']/VlrCodigo != ''">
									<xsl:element name="cac:StandardItemIdentification">
										<xsl:element name="cbc:ID">
											<xsl:attribute name="schemeID">
												<xsl:text>010</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeName">
												<xsl:text>GTIN</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeAgencyID">
												<xsl:text>9</xsl:text>
											</xsl:attribute>
											<xsl:value-of
												select="format-number(CdgItem[TpoCodigo = '010']/VlrCodigo, '#00000000000000')"
											/>
										</xsl:element>
									</xsl:element>
								</xsl:if>
								<xsl:if test="CdgItem[TpoCodigo = '020']/VlrCodigo != ''">
									<xsl:element name="cac:StandardItemIdentification">
										<xsl:element name="cbc:ID">
											<xsl:attribute name="schemeID">
												<xsl:text>020</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeName">
												<xsl:text>Partida Aranceraria</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeAgencyID">
												<xsl:text>195</xsl:text>
											</xsl:attribute>
											<xsl:value-of select="CdgItem[TpoCodigo = '020']/VlrCodigo"/>
										</xsl:element>
									</xsl:element>
								</xsl:if>
								<xsl:if test="CdgItem[TpoCodigo = 'EAN13']/VlrCodigo != ''">
									<xsl:element name="cac:StandardItemIdentification">
										<xsl:element name="cbc:ID">
											<xsl:attribute name="schemeID">
												<xsl:text>999</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeName">
												<xsl:text>EAN13</xsl:text>
											</xsl:attribute>
											<xsl:value-of select="CdgItem[TpoCodigo = 'EAN13']/VlrCodigo"/>
										</xsl:element>
									</xsl:element>
								</xsl:if>
							</xsl:when>
							<xsl:otherwise>
								<xsl:if test="CdgItem[TpoCodigo = '001']/VlrCodigo != ''">
									<xsl:element name="cac:StandardItemIdentification">
										<xsl:element name="cbc:ID">
											<xsl:attribute name="schemeID">
												<xsl:text>001</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeName">
												<xsl:text>UNSPSC</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeAgencyID">
												<xsl:text>10</xsl:text>
											</xsl:attribute>
											<xsl:value-of select="CdgItem[TpoCodigo = '001']/VlrCodigo"/>
										</xsl:element>
									</xsl:element>
								</xsl:if>
								<xsl:if test="CdgItem[TpoCodigo = '010']/VlrCodigo != ''">
									<xsl:element name="cac:StandardItemIdentification">
										<xsl:element name="cbc:ID">
											<xsl:attribute name="schemeID">
												<xsl:text>010</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeName">
												<xsl:text>GTIN</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeAgencyID">
												<xsl:text>9</xsl:text>
											</xsl:attribute>
											<xsl:value-of
												select="format-number(CdgItem[TpoCodigo = '010']/VlrCodigo, '#00000000000000')"
											/>
										</xsl:element>
									</xsl:element>
								</xsl:if>
								<xsl:if test="CdgItem[TpoCodigo = '020']/VlrCodigo != ''">
									<xsl:element name="cac:StandardItemIdentification">
										<xsl:element name="cbc:ID">
											<xsl:attribute name="schemeID">
												<xsl:text>020</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeName">
												<xsl:text>Partida Aranceraria</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeAgencyID">
												<xsl:text>195</xsl:text>
											</xsl:attribute>
											<xsl:value-of select="CdgItem[TpoCodigo = '020']/VlrCodigo"/>
										</xsl:element>
									</xsl:element>
								</xsl:if>
								<xsl:if test="CdgItem[TpoCodigo = '999']/VlrCodigo != ''">
									<xsl:element name="cac:StandardItemIdentification">
										<xsl:element name="cbc:ID">
											<xsl:attribute name="schemeID">
												<xsl:text>999</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeName">
												<xsl:text>EAN13</xsl:text>
											</xsl:attribute>
											<xsl:value-of select="CdgItem[TpoCodigo = '999']/VlrCodigo"/>
										</xsl:element>
									</xsl:element>
								</xsl:if>
								<xsl:if test="CdgItem[TpoCodigo = 'EAN13']/VlrCodigo != ''">
									<xsl:element name="cac:StandardItemIdentification">
										<xsl:element name="cbc:ID">
											<xsl:attribute name="schemeID">
												<xsl:text>999</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="schemeName">
												<xsl:text>EAN13</xsl:text>
											</xsl:attribute>
											<xsl:value-of select="CdgItem[TpoCodigo = 'EAN13']/VlrCodigo"/>
										</xsl:element>
									</xsl:element>
								</xsl:if>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:if test="CdgItem[TpoCodigo = '999']/VlrCodigo != ''">
							<xsl:element name="cac:AdditionalItemIdentification">
								<xsl:element name="cbc:ID">
									<xsl:attribute name="schemeID">
										<xsl:text>999</xsl:text>
									</xsl:attribute>
									<xsl:attribute name="schemeName">
										<xsl:text>EAN13</xsl:text>
									</xsl:attribute>
									<xsl:value-of select="CdgItem[TpoCodigo = '999']/VlrCodigo"/>
								</xsl:element>
							</xsl:element>
						</xsl:if>
						
						<!--Informacion transportista-->
						
						<xsl:if test="(//IdDoc/TipoServicio = '12') and ServicioItem[position()]/Numero !=''">
							<xsl:element name="cac:AdditionalItemProperty">
								<xsl:element name="cbc:Name">
									<xsl:text>01</xsl:text>
								</xsl:element>
								<xsl:element name="cbc:Value">
									<xsl:value-of select="ServicioItem/Numero"/>
								</xsl:element>
							</xsl:element>
							<xsl:element name="cac:AdditionalItemProperty">
								<xsl:element name="cbc:Name">
									<xsl:text>02</xsl:text>
								</xsl:element>
								<xsl:element name="cbc:Value">
									<xsl:value-of select="ServicioItem/NroExp"/>
								</xsl:element>
							</xsl:element>
							<xsl:element name="cac:AdditionalItemProperty">
								<xsl:element name="cbc:Name">
									<xsl:text>03</xsl:text>
								</xsl:element>
								<xsl:element name="cbc:Value">
									<xsl:value-of select="ServicioItem/RazonServ"/>
								</xsl:element>
								<xsl:element name="cbc:ValueQuantity">
									<xsl:attribute name="unitCode">
										<xsl:value-of select="UnmdItem"/>
									</xsl:attribute>
									<xsl:value-of select="ServicioItem/Ejecutor"/>
								</xsl:element>
							</xsl:element>
						</xsl:if>
						
						<!--Informacion del Mandante-->
						<xsl:if
							test="(//IdDoc/TipoServicio = '11' or //IdDoc/TipoServicio = '12' or //IdDoc/TipoServicio = '30' or //IdDoc/TipoServicio = '32' or //IdDoc/TipoServicio = '33') and ServicioItem/Mandante!=''">
							<xsl:element name="cac:InformationContentProviderParty">
								<xsl:element name="cac:PowerOfAttorney">
									<xsl:element name="cac:AgentParty">
										<xsl:element name="cac:PartyIdentification">
											<xsl:element name="cbc:ID">
												<xsl:attribute name="schemeID">
												<xsl:call-template name="calculNIT-dv">
												<xsl:with-param name="NIT">
												<xsl:value-of select="ServicioItem/Mandante"/>
												</xsl:with-param>
												</xsl:call-template>
												</xsl:attribute>
												<xsl:attribute name="schemeName">
												<xsl:text>31</xsl:text>
												</xsl:attribute>
												<xsl:attribute name="schemeAgencyID">
												<xsl:text>195</xsl:text>
												</xsl:attribute>
												<xsl:value-of select="ServicioItem/Mandante"/>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:if>
					</xsl:element>
					<!--Unit Price-->
					<xsl:element name="cac:Price">
						<xsl:element name="cbc:PriceAmount">
							<xsl:attribute name="currencyID">
								<xsl:value-of select="$MonedaC"/>
							</xsl:attribute>
							<xsl:value-of
								select="normalize-space(format-number(PrcBrutoItem, '#0.00'))"/>
						</xsl:element>
						<xsl:element name="cbc:BaseQuantity">
							<!--Unit of Measure -->
							<xsl:attribute name="unitCode">
								<xsl:value-of select="UnmdItem"/>
							</xsl:attribute>
							<xsl:value-of select="format-number(QtyItem, '#0.000000')"/>
						</xsl:element>
					</xsl:element>
				</xsl:element>
			</xsl:for-each>
			<xsl:element name="Personalizados">
				<xsl:element name="DocPersonalizado">
					<xsl:attribute name="dteID">
						<xsl:value-of select="/DTE/Personalizados/DocPersonalizado/@dteID"/>
					</xsl:attribute>
					<xsl:element name="campoString">
						<xsl:attribute name="name">
							<xsl:text>QRCode</xsl:text>
						</xsl:attribute>
						<xsl:variable name="CUFE">
							<!--<xsl:value-of select="crypto:hash($CUFEString, 'SHA-384')"/>-->
							<xsl:value-of select="$CUFEString"/>
						</xsl:variable>
						<xsl:value-of select="concat('NumFac:=',concat(/DTE/Documento/Encabezado/IdDoc/Serie, /DTE/Documento/Encabezado/IdDoc/Numero))"/>
						<xsl:text>
								</xsl:text>
						<xsl:value-of select="concat('FecFac:',substring(/DTE/Documento/Encabezado/IdDoc/FechaEmis, 1, 10))"/>
						<xsl:text>
								</xsl:text>
						<xsl:value-of select="concat('HorFac:',substring(/DTE/Documento/Encabezado/IdDoc/FechaEmis, 12, 8),'-05:00')"/>
						<xsl:text>
								</xsl:text>
						<xsl:value-of select="concat('NitFac:',normalize-space(/DTE/Documento/Encabezado/Emisor/IDEmisor))"/>
						<xsl:text>
								</xsl:text>
						<xsl:value-of select="concat('DocAdq:',normalize-space(/DTE/Documento/Encabezado/Receptor/DocRecep/NroDocRecep))"/>
						<xsl:text>
								</xsl:text>
						<xsl:value-of select="concat('ValFac:',format-number(/DTE/Documento/Encabezado/Totales/SubTotal,'#0.00'))"/>
						<xsl:text>
								</xsl:text>
						<xsl:value-of select="concat('ValIva:',format-number(/DTE/Documento/Encabezado/Totales/MntImp,'#0.00'))"/>
						<xsl:text>
								</xsl:text>
						<xsl:choose>
							<xsl:when test="/DTE/Documento/Encabezado/Totales/MntRet !=''">
								<xsl:value-of select="concat('ValOtroIm:',format-number(/DTE/Documento/Encabezado/Totales/VlrPagar,'#0.00'))"/>
								<xsl:text>
								</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="'ValOtroIm:'"/>
								<xsl:text>
								</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:value-of select="concat('ValTolFac:',format-number(/DTE/Documento/Encabezado/Totales/VlrPagar,'#0.00'))"/>
						<xsl:text>
								</xsl:text>
						<xsl:value-of select="concat('CUFE:',$CUFE)"/>
						<xsl:text>
								</xsl:text>
						<xsl:choose>
							<xsl:when test="/DTE/Documento/Encabezado/IdDoc/Ambiente = 2 and not(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo')">
								<xsl:value-of select="concat('QRCode:','https://catalogo-vpfe-hab.dian.gov.co/document/searchqr?documentkey=',$CUFE)"/>
							</xsl:when>
							<xsl:when test="/DTE/Documento/Encabezado/IdDoc/Ambiente = 1 and not(/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo')">
								<xsl:value-of select="concat('QRCode:','https://catalogo-vpfe.dian.gov.co/document/searchqr?documentkey=',$CUFE)"/>
							</xsl:when>
							<xsl:when test="/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo'">
								<xsl:value-of select="concat('QRCode:','https://catalogo-vpfe.dian.gov.co/document/searchqr?documentkey=',$CUFE)"/>
							</xsl:when>
						</xsl:choose>
					</xsl:element>
					<xsl:element name="campoString">
						<xsl:attribute name="name">
							<xsl:text>SERIE</xsl:text>
						</xsl:attribute>
						<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/Serie"/>
					</xsl:element>
					<xsl:element name="campoString">
						<xsl:attribute name="name">
							<xsl:text>FOLIO</xsl:text>
						</xsl:attribute>
						<xsl:value-of select="/DTE/Documento/Encabezado/IdDoc/Numero"/>
					</xsl:element>
					<xsl:element name="campoString">
						<xsl:attribute name="name">
							<xsl:text>FechaGeneracion</xsl:text>
						</xsl:attribute>
						<xsl:value-of select="substring(string(current-dateTime()), 1, 10)"/>
					</xsl:element>
					<xsl:element name="campoString">
						<xsl:attribute name="name">
							<xsl:text>HoraGeneracion</xsl:text>
						</xsl:attribute>
						<xsl:value-of select="substring(string(current-dateTime()), 12, 8)"/>
					</xsl:element>					
					<xsl:copy-of select="/DTE/Personalizados/DocPersonalizado/*"/>
					<xsl:for-each select="/DTE/Documento/Referencia[TpoDocRef = '90']">
						<xsl:element name="ImpresionReferencia">
							<xsl:element name="PersonNroLinRef">
								<xsl:value-of select="NroLinRef"/>
							</xsl:element>
							<xsl:element name="ECB02">
								<xsl:value-of select="ECB02"/>
							</xsl:element>
							<xsl:element name="ECB03">
								<xsl:value-of select="ECB03"/>
							</xsl:element>
							<xsl:element name="ECB04">
								<xsl:value-of select="ECB04"/>
							</xsl:element>
							<xsl:element name="ECB05">
								<xsl:value-of select="ECB05"/>
							</xsl:element>
							<xsl:element name="ECB06">
								<xsl:value-of select="ECB06"/>
							</xsl:element>
							<xsl:element name="ECB07">
								<xsl:value-of select="ECB07"/>
							</xsl:element>
							<xsl:element name="ECB08">
								<xsl:value-of select="ECB08"/>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
				</xsl:element>
		</DebitNote>
	</xsl:template>
	<xsl:template name="NominaIndividual">
		<!--Gosocket DTE v1.2 CO to UBL 2.1 OASIS Oficial-->
		<NominaIndividual xmlns="dian:gov:co:facturaelectronica:NominaIndividual"
			xmlns:xs="http://www.w3.org/2001/XMLSchema-instance"
			xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
			xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
			xmlns:xades="http://uri.etsi.org/01903/v1.3.2#"
			xmlns:xades141="http://uri.etsi.org/01903/v1.4.1#"
			xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
			SchemaLocation=""
			xsi:schemaLocation="dian:gov:co:facturaelectronica:NominaIndividual NominaIndividualElectronicaXSD.xsd">
			
			<!--var CurrencyType-->
			<xsl:variable name="MonedaC" select="normalize-space(//Moneda)"/>
			<!-- var CUFE -->
			<xsl:variable name="CUFE">
				<xsl:value-of
					select="
						concat(/DTE/Documentos/Nomina/Resumen/Serie, /DTE/Documentos/Nomina/Resumen/Numero, substring(/DTE/Documentos/Nomina/Resumen/FechaEmis, 1, 10), if (string-length(substring-after(/DTE/Documentos/Nomina/Resumen/FechaEmis, 'T')) != 9) then
						concat(substring-after(/DTE/Documentos/Nomina/Resumen/FechaEmis, 'T'), '-05:00')
						else
						concat(substring(/DTE/Documentos/Nomina/Resumen/FechaEmis, 12, 8), '-05:00'), format-number(/DTE/Documentos/Nomina/Pagos/Devengados, '#0.00'), format-number(/DTE/Documentos/Nomina/Pagos/Deducciones, '#0.00'),format-number(/DTE/Documentos/Nomina/Pagos/VlrPagar, '#0.00'), /DTE/Documentos/Nomina/NominaEmisor/IDEmisor, /DTE/Documentos/Nomina/NominaReceptor/DocRecep/NroDocRecep, /DTE/Documentos/Nomina/Resumen/TipoNomina, '20191', /DTE/Documentos/Nomina/Resumen/Ambiente)"
				/>
			</xsl:variable>
			<xsl:variable name="CodigoSoftware">
						<xsl:text>81f27ff2-453d-411c-9e9f-a6b59b00c4a0</xsl:text>
			</xsl:variable>
			<!--EXTENSIONES DEFINIDAS POR DIAN Para la Firma electronica-->
			<xsl:element name="ext:UBLExtensions"/>
			<xsl:if test="/DTE/Documentos/Nomina/Resumen/Novedad/TipoNota !=''">
				<xsl:element name="Novedad">
					<xsl:attribute name="CUNENov">
						<xsl:value-of select="CUNE"/>
					</xsl:attribute>
					<xsl:text>true</xsl:text>
				</xsl:element>
			</xsl:if>	
			
			<!--Periodo-->
			<xsl:element name="Periodo">
				<xsl:attribute name="FechaIngreso">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaReceptor/FechaIngreso"/>
				</xsl:attribute>
				<xsl:if test="/DTE/Documentos/Nomina/NominaReceptor/FechaRetiro !=''">
					<xsl:attribute name="FechaRetiro">
						<xsl:value-of select="/DTE/Documentos/Nomina/NominaReceptor/FechaRetiro"/>
					</xsl:attribute>					
				</xsl:if>				
				<xsl:attribute name="FechaLiquidacionInicio">
					<xsl:value-of select="/DTE/Documentos/Nomina/Resumen/FechaInicialPago"/>
				</xsl:attribute>
				<xsl:attribute name="FechaLiquidacionFin">
					<xsl:value-of select="/DTE/Documentos/Nomina/Resumen/FechaFinalPago"/>
				</xsl:attribute>
				<xsl:attribute name="TiempoLaborado">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaReceptor/TiempoLaborado"/>
				</xsl:attribute>
				<xsl:attribute name="FechaGen">
					<xsl:value-of select="substring(/DTE/Documentos/Nomina/Resumen/FechaEmis,1,10)"/>
				</xsl:attribute>
			</xsl:element>
			<!-- ID del documento-->
			<xsl:element name="NumeroSecuenciaXML">
				<xsl:if test="/DTE/Documentos/Nomina/NominaReceptor/CodigoTrabajador">
					<xsl:attribute name="CodigoTrabajador">
						<xsl:value-of select="/DTE/Documentos/Nomina/NominaReceptor/CodigoTrabajador"/>
					</xsl:attribute>					
				</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/Resumen/Serie">
					<xsl:attribute name="Prefijo">
						<xsl:value-of select="/DTE/Documentos/Nomina/Resumen/Serie"/>
					</xsl:attribute>					
				</xsl:if>				
				<xsl:attribute name="Consecutivo">
					<xsl:value-of select="/DTE/Documentos/Nomina/Resumen/Numero"/>
				</xsl:attribute>
				<xsl:attribute name="Numero">
					<xsl:value-of select="concat(/DTE/Documentos/Nomina/Resumen/Serie,/DTE/Documentos/Nomina/Resumen/Numero)"/>
				</xsl:attribute>
			</xsl:element>
			
			<!--LugarGeneracionXML-->
			<xsl:element name="LugarGeneracionXML">
				<xsl:attribute name="Pais">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaEmisor/LugarExped/Pais"/>
				</xsl:attribute>
				<xsl:attribute name="DepartamentoEstado">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaEmisor/LugarExped/Departamento"/>
				</xsl:attribute>
				<xsl:attribute name="MunicipioCiudad">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaEmisor/LugarExped/Ciudad"/>
				</xsl:attribute>
				<xsl:attribute name="Idioma">
					<xsl:text>es</xsl:text>
				</xsl:attribute>
			</xsl:element>
			
			<!--Proveedor Tecnologico -->
			<xsl:element name="ProveedorXML">
				<xsl:attribute name="RazonSocial">
					<xsl:text>SIGNATURE SOUTH CONSULTING COLOMBIA SAS</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="NIT">
					<xsl:text>900508908</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="DV">
					<xsl:text>9</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="SoftwareID">
					<xsl:value-of select="$CodigoSoftware"/>
				</xsl:attribute>
				<xsl:attribute name="SoftwareSC">
				<xsl:choose>
					<xsl:when test="/DTE/Documentos/Nomina/Resumen/Ambiente = 2">
						<!-- Si es ambiente de pruebas -->
						<xsl:variable name="CodigoSeguridad">
							<xsl:value-of select="concat($CodigoSoftware, '20191', /DTE/Documentos/Nomina/Resumen/Serie, /DTE/Documentos/Nomina/Resumen/Numero)" />
						</xsl:variable>
						<xsl:value-of select="$CodigoSeguridad"/>
					</xsl:when>
					<xsl:otherwise>
						<!-- Si es ambiente de producción -->
						<xsl:variable name="CodigoSeguridad">
							<xsl:value-of select="concat($CodigoSoftware, '20191', /DTE/Documentos/Nomina/Resumen/Serie, /DTE/Documentos/Nomina/Resumen/Numero)" />
						</xsl:variable>
						<xsl:value-of select="$CodigoSeguridad"/>
					</xsl:otherwise>
				</xsl:choose>
				</xsl:attribute>
			</xsl:element>
			
			<!--QRcode-->
			<xsl:element name="CodigoQR">
				<xsl:choose>
					<xsl:when test="/DTE/Documentos/Nomina/Resumen/Ambiente = 2">
						<xsl:value-of select="concat('https://catalogo-vpfe-hab.dian.gov.co/document/searchqr?documentkey=',$CUFE)"/>
					</xsl:when>
					<xsl:when test="/DTE/Documentos/Nomina/Resumen/Ambiente = 1">
						<xsl:value-of select="concat('https://catalogo-vpfe.dian.gov.co/document/searchqr?documentkey=',$CUFE)"/>
					</xsl:when>					
				</xsl:choose>
			</xsl:element>
			
			
			<!--Informacion General del DTE-->
			
			<xsl:element name="InformacionGeneral">			
				<xsl:attribute name="Version">
					<xsl:text>V1.0: Documento Soporte de Pago de Nómina Electrónica</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="Ambiente">
					<xsl:value-of select="/DTE/Documentos/Nomina/Resumen/Ambiente"/>
				</xsl:attribute>
				<xsl:attribute name="TipoXML">
					<xsl:value-of select="/DTE/Documentos/Nomina/Resumen/TipoNomina"/>
				</xsl:attribute>
				<xsl:attribute name="CUNE">
					<xsl:value-of select="$CUFE"/>
				</xsl:attribute>
				<xsl:attribute name="EncripCUNE">
					<xsl:value-of select="'CUNE-SHA384'"/>
				</xsl:attribute>
				<xsl:attribute name="FechaGen">
					<xsl:value-of select="substring(/DTE/Documentos/Nomina/Resumen/FechaEmis, 1, 10)"/>
				</xsl:attribute>
				<xsl:attribute name="HoraGen">
					<xsl:value-of select="concat(substring(/DTE/Documentos/Nomina/Resumen/FechaEmis, 12, 8), '-05:00')"/>
				</xsl:attribute>
				<xsl:attribute name="PeriodoNomina">
					<xsl:value-of select="/DTE/Documentos/Nomina/Resumen/PeriodoNomina"/>
				</xsl:attribute>
				<xsl:attribute name="TipoMoneda">
					<xsl:value-of select="$MonedaC"/>
				</xsl:attribute>
				<xsl:if test="$MonedaC != 'COP'">
				<xsl:attribute name="TRM">
					<xsl:value-of select="/DTE/Documentos/Nomina/Pagos/FctConv"/>
				</xsl:attribute>
				</xsl:if>
			</xsl:element>
			
			<!--Notas adicionales del documento-->
			<xsl:for-each select="/DTE/Documentos/Nomina/Resumen/Notas">
				<xsl:element name="Notas">
					<xsl:value-of select="."/>
				</xsl:element>
			</xsl:for-each>
			
			<!--Informacion del Empleador-->
			<xsl:element name="Empleador">			
				<xsl:attribute name="RazonSocial">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaEmisor/NmbEmisor"/>
				</xsl:attribute>
				<xsl:attribute name="NIT">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaEmisor/IDEmisor"/>
				</xsl:attribute>
				<xsl:attribute name="DV">
					<xsl:call-template name="calculNIT-dv">
						<xsl:with-param name="NIT"
							select="normalize-space(/DTE/Documentos/Nomina/NominaEmisor/IDEmisor)"/>
					</xsl:call-template>
				</xsl:attribute>
				<xsl:attribute name="Pais">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaEmisor/DomFiscal/Pais"/>
				</xsl:attribute>
				<xsl:attribute name="DepartamentoEstado">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaEmisor/DomFiscal/Departamento"/>
				</xsl:attribute>
				<xsl:attribute name="MunicipioCiudad">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaEmisor/DomFiscal/Ciudad"/>
				</xsl:attribute>
				<xsl:attribute name="Direccion">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaEmisor/DomFiscal/Calle"/>
				</xsl:attribute>
			</xsl:element>
			
			
			<!--Informacion del Trabajador-->
			<xsl:element name="Trabajador">			
				<xsl:attribute name="TipoTrabajador">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaReceptor/TipoTrabajador"/>
				</xsl:attribute>
				<xsl:attribute name="SubTipoTrabajador">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaReceptor/SubTipoTrabajador"/>
				</xsl:attribute>
				<xsl:attribute name="AltoRiesgoPension">
					<xsl:value-of select="lower-case(/DTE/Documentos/Nomina/NominaReceptor/AltoRiesgoPension)"/>
				</xsl:attribute>
				<xsl:attribute name="TipoDocumento">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaReceptor/DocRecep/TipoDocRecep"/>
				</xsl:attribute>
				<xsl:attribute name="NumeroDocumento">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaReceptor/DocRecep/NroDocRecep"/>
				</xsl:attribute>
				<xsl:attribute name="PrimerApellido">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaReceptor/NombreRecep/PrimerApellido"/>
				</xsl:attribute>
				<xsl:attribute name="SegundoApellido">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaReceptor/NombreRecep/SegundoApellido"/>
				</xsl:attribute>
				<xsl:attribute name="PrimerNombre">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaReceptor/NombreRecep/PrimerNombre"/>
				</xsl:attribute>
				<xsl:if test="/DTE/Documentos/Nomina/NominaReceptor/NombreRecep/OtrosNombres">
				<xsl:attribute name="OtrosNombres">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaReceptor/NombreRecep/OtrosNombres"/>
				</xsl:attribute>
				</xsl:if>
				<xsl:attribute name="LugarTrabajoPais">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaReceptor/DomFiscal/Pais"/>
				</xsl:attribute>
				<xsl:attribute name="LugarTrabajoDepartamentoEstado">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaReceptor/DomFiscal/Departamento"/>
				</xsl:attribute>
				<xsl:attribute name="LugarTrabajoMunicipioCiudad">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaReceptor/DomFiscal/Ciudad"/>
				</xsl:attribute>
				<xsl:attribute name="LugarTrabajoDireccion">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaReceptor/DomFiscal/Calle"/>
				</xsl:attribute>
				<xsl:attribute name="SalarioIntegral">
					<xsl:value-of select="if (/DTE/Documentos/Nomina/NominaReceptor/SalarioIntegral ='' or /DTE/Documentos/Nomina/NominaReceptor/SalarioIntegral ='False') then 'false' else 'true'"/>
				</xsl:attribute>
				<xsl:attribute name="TipoContrato">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaReceptor/TipoContrato"/>
				</xsl:attribute>
				<xsl:attribute name="Sueldo">
					<xsl:value-of select="if (/DTE/Documentos/Nomina/NominaReceptor/SalarioIntegral ='' or /DTE/Documentos/Nomina/NominaReceptor/SalarioIntegral ='False') then /DTE/Documentos/Nomina/NominaReceptor/SalarioBase else if(/DTE/Documentos/Nomina/NominaReceptor/SalarioIntegral= 'True') then /DTE/Documentos/Nomina/NominaReceptor/SalarioBase else /DTE/Documentos/Nomina/NominaReceptor/SalarioIntegral "/>
				</xsl:attribute>
				
				<xsl:if test="/DTE/Documentos/Nomina/NominaReceptor/CodigoTrabajador">
					<xsl:attribute name="CodigoTrabajador">
						<xsl:value-of select="/DTE/Documentos/Nomina/NominaReceptor/CodigoTrabajador"/>
					</xsl:attribute>					
				</xsl:if>
			</xsl:element>
			
			<!--Informacion de la forma de pago-->
			<xsl:element name="Pago">
				<xsl:attribute name="Forma">
					<xsl:value-of select="/DTE/Documentos/Nomina/Resumen/FormaPago"/>
				</xsl:attribute>
				<xsl:attribute name="Metodo">
					<xsl:value-of select="/DTE/Documentos/Nomina/Resumen/MedioPago"/>
				</xsl:attribute>
				<xsl:if test="/DTE/Documentos/Nomina/NominaReceptor/Banco">
				<xsl:attribute name="Banco">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaReceptor/Banco"/>
				</xsl:attribute>
				</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/NominaReceptor/TipoCuenta">
					<xsl:attribute name="TipoCuenta">
						<xsl:value-of select="/DTE/Documentos/Nomina/NominaReceptor/TipoCuenta"/>
					</xsl:attribute>
				</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/NominaReceptor/NumeroCuenta">
					<xsl:attribute name="NumeroCuenta">
						<xsl:value-of select="/DTE/Documentos/Nomina/NominaReceptor/NumeroCuenta"/>
					</xsl:attribute>
				</xsl:if>
			</xsl:element>
			
			<!--Informacion de la fecha de pago-->
			<xsl:element name="FechasPagos">
				<xsl:for-each select="/DTE/Documentos/Nomina/Resumen/FechaPago">
					<xsl:element name="FechaPago">
						<xsl:value-of select="."/>
					</xsl:element>
				</xsl:for-each>
			</xsl:element>
			
			<!--Informacion Devengados Aplicados del DTE-->
			<xsl:element name="Devengados">
				<xsl:element name="Basico">
					<xsl:attribute name="DiasTrabajados">
						<xsl:value-of select="/DTE/Documentos/Nomina/Devengados/DiasTrabajados"/>
					</xsl:attribute>
					<xsl:attribute name="SueldoTrabajado">
						<xsl:value-of select="/DTE/Documentos/Nomina/Devengados/SueldoTrabajado"/>
					</xsl:attribute>
				</xsl:element>
				
				<!--Trasnporte-->
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/Transporte != ''">
				<xsl:element name="Transporte">
					<xsl:if test="/DTE/Documentos/Nomina/Devengados/Transporte/AuxilioTransporte !=''">
					<xsl:attribute name="AuxilioTransporte">
						<xsl:value-of select="/DTE/Documentos/Nomina/Devengados/Transporte/AuxilioTransporte"/>
					</xsl:attribute>
					</xsl:if>
					<xsl:if test="/DTE/Documentos/Nomina/Devengados/Transporte/Viatico !=''">
						<xsl:attribute name="ViaticoManuAlojS">
							<xsl:value-of select="/DTE/Documentos/Nomina/Devengados/Transporte/Viatico"/>
						</xsl:attribute>
					</xsl:if>
					<xsl:if test="/DTE/Documentos/Nomina/Devengados/Transporte/ViaticoNoSalarial !=''">
						<xsl:attribute name="ViaticoManuAlojNS">
							<xsl:value-of select="/DTE/Documentos/Nomina/Devengados/Transporte/ViaticoNoSalarial"/>
						</xsl:attribute>
					</xsl:if>
				</xsl:element>
				</xsl:if>
				
				<!--Horas extras-->
				
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/HorasExtra/Tipo='HED'">
					<xsl:element name="HEDs">
						<xsl:for-each select="/DTE/Documentos/Nomina/Devengados/HorasExtra[Tipo='HED']">
							
								<xsl:element name="HED">
									<xsl:if test="HoraInicio">
										<xsl:attribute name="HoraInicio">
											<xsl:value-of select="HoraInicio"/>
										</xsl:attribute>
									</xsl:if>
									<xsl:if test="HoraFin">
										<xsl:attribute name="HoraFin">
											<xsl:value-of select="HoraFin"/>
										</xsl:attribute>
									</xsl:if>
									<xsl:attribute name="Cantidad">
										<xsl:value-of select="Cantidad"/>
									</xsl:attribute>
									<xsl:attribute name="Porcentaje">
										<xsl:value-of select="Porcentaje"/>
									</xsl:attribute>
									<xsl:attribute name="Pago">
										<xsl:value-of select="Pago"/>
									</xsl:attribute>
								</xsl:element>
						</xsl:for-each>
					</xsl:element>
					</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/HorasExtra/Tipo='HEN'">
						<xsl:element name="HENs">
							<xsl:for-each select="/DTE/Documentos/Nomina/Devengados/HorasExtra[Tipo='HEN']">
								
										<xsl:element name="HEN">
											<xsl:if test="HoraInicio">
												<xsl:attribute name="HoraInicio">
													<xsl:value-of select="HoraInicio"/>
												</xsl:attribute>
											</xsl:if>
											<xsl:if test="HoraFin">
												<xsl:attribute name="HoraFin">
													<xsl:value-of select="HoraFin"/>
												</xsl:attribute>
											</xsl:if>
											<xsl:attribute name="Cantidad">
												<xsl:value-of select="Cantidad"/>
											</xsl:attribute>
											<xsl:attribute name="Porcentaje">
												<xsl:value-of select="Porcentaje"/>
											</xsl:attribute>
											<xsl:attribute name="Pago">
												<xsl:value-of select="Pago"/>
											</xsl:attribute>
										</xsl:element>
							</xsl:for-each>
						</xsl:element>
					</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/HorasExtra/Tipo='HRN'">
					<xsl:element name="HRNs">
						<xsl:for-each select="/DTE/Documentos/Nomina/Devengados/HorasExtra[Tipo='HRN']">
							
							<xsl:element name="HRN">
								<xsl:if test="HoraInicio">
									<xsl:attribute name="HoraInicio">
										<xsl:value-of select="HoraInicio"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:if test="HoraFin">
									<xsl:attribute name="HoraFin">
										<xsl:value-of select="HoraFin"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:attribute name="Cantidad">
									<xsl:value-of select="Cantidad"/>
								</xsl:attribute>
								<xsl:attribute name="Porcentaje">
									<xsl:value-of select="Porcentaje"/>
								</xsl:attribute>
								<xsl:attribute name="Pago">
									<xsl:value-of select="Pago"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/HorasExtra/Tipo='HEDDF'">
					<xsl:element name="HEDDFs">
						<xsl:for-each select="/DTE/Documentos/Nomina/Devengados/HorasExtra[Tipo='HEDDF']">
							
							<xsl:element name="HEDDF">
								<xsl:if test="HoraInicio">
									<xsl:attribute name="HoraInicio">
										<xsl:value-of select="HoraInicio"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:if test="HoraFin">
									<xsl:attribute name="HoraFin">
										<xsl:value-of select="HoraFin"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:attribute name="Cantidad">
									<xsl:value-of select="Cantidad"/>
								</xsl:attribute>
								<xsl:attribute name="Porcentaje">
									<xsl:value-of select="Porcentaje"/>
								</xsl:attribute>
								<xsl:attribute name="Pago">
									<xsl:value-of select="Pago"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/HorasExtra/Tipo='HRDDF'">
					<xsl:element name="HRDDFs">
						<xsl:for-each select="/DTE/Documentos/Nomina/Devengados/HorasExtra[Tipo='HRDDF']">
							
							<xsl:element name="HRDDF">
								<xsl:if test="HoraInicio">
									<xsl:attribute name="HoraInicio">
										<xsl:value-of select="HoraInicio"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:if test="HoraFin">
									<xsl:attribute name="HoraFin">
										<xsl:value-of select="HoraFin"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:attribute name="Cantidad">
									<xsl:value-of select="Cantidad"/>
								</xsl:attribute>
								<xsl:attribute name="Porcentaje">
									<xsl:value-of select="Porcentaje"/>
								</xsl:attribute>
								<xsl:attribute name="Pago">
									<xsl:value-of select="Pago"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/HorasExtra/Tipo='HENDF'">
					<xsl:element name="HENDFs">
						<xsl:for-each select="/DTE/Documentos/Nomina/Devengados/HorasExtra[Tipo='HENDF']">
							
							<xsl:element name="HENDF">
								<xsl:if test="HoraInicio">
									<xsl:attribute name="HoraInicio">
										<xsl:value-of select="HoraInicio"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:if test="HoraFin">
									<xsl:attribute name="HoraFin">
										<xsl:value-of select="HoraFin"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:attribute name="Cantidad">
									<xsl:value-of select="Cantidad"/>
								</xsl:attribute>
								<xsl:attribute name="Porcentaje">
									<xsl:value-of select="Porcentaje"/>
								</xsl:attribute>
								<xsl:attribute name="Pago">
									<xsl:value-of select="Pago"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/HorasExtra/Tipo='HRNDF'">
					<xsl:element name="HRNDFs">
						<xsl:for-each select="/DTE/Documentos/Nomina/Devengados/HorasExtra[Tipo='HRNDF']">
							
							<xsl:element name="HRNDF">
								<xsl:if test="HoraInicio">
									<xsl:attribute name="HoraInicio">
										<xsl:value-of select="HoraInicio"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:if test="HoraFin">
									<xsl:attribute name="HoraFin">
										<xsl:value-of select="HoraFin"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:attribute name="Cantidad">
									<xsl:value-of select="Cantidad"/>
								</xsl:attribute>
								<xsl:attribute name="Porcentaje">
									<xsl:value-of select="Porcentaje"/>
								</xsl:attribute>
								<xsl:attribute name="Pago">
									<xsl:value-of select="Pago"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
				
				<!--Vacaciones-->
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/Vacaciones[VacacionesComunes/Cantidad != ''] or /DTE/Documentos/Nomina/Devengados/Vacaciones[VacacionesCompensadas/Cantidad != '']">
				<xsl:element name="Vacaciones">
					<xsl:for-each select="/DTE/Documentos/Nomina/Devengados/Vacaciones/VacacionesComunes[Cantidad !='']">
					<xsl:element name="VacacionesComunes">
						<xsl:if test="FechaInicio !=''">
							<xsl:attribute name="FechaInicio">
								<xsl:value-of select="FechaInicio"/>
							</xsl:attribute>
						</xsl:if>
						<xsl:if test="FechaFin !=''">
							<xsl:attribute name="FechaFin">
								<xsl:value-of select="FechaFin"/>
							</xsl:attribute>
						</xsl:if>
						<xsl:attribute name="Cantidad">
							<xsl:value-of select="Cantidad"/>
						</xsl:attribute>
						<xsl:attribute name="Pago">
							<xsl:value-of select="Pago"/>
						</xsl:attribute>
					</xsl:element>
					</xsl:for-each>
					<xsl:for-each select="/DTE/Documentos/Nomina/Devengados/Vacaciones/VacacionesCompensadas[Cantidad !='']">
						<xsl:element name="VacacionesCompensadas">
							<xsl:attribute name="Cantidad">
								<xsl:value-of select="Cantidad"/>
							</xsl:attribute>
							<xsl:attribute name="Pago">
								<xsl:value-of select="Pago"/>
							</xsl:attribute>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
				</xsl:if>
			
				<!--Primas-->
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/Primas[Pago != '']">
					<xsl:element name="Primas">
							<xsl:attribute name="Cantidad">
								<xsl:value-of select="/DTE/Documentos/Nomina/Devengados/Primas/Cantidad"/>
							</xsl:attribute>
							<xsl:attribute name="Pago">
								<xsl:value-of select="/DTE/Documentos/Nomina/Devengados/Primas/Pago"/>
							</xsl:attribute>
							<xsl:if test="/DTE/Documentos/Nomina/Devengados/Primas/PagoNS">
							<xsl:attribute name="PagoNS">
								<xsl:value-of select="/DTE/Documentos/Nomina/Devengados/Primas/PagoNS"/>
							</xsl:attribute>
							</xsl:if>
					</xsl:element>
				</xsl:if>
			
				<!--Cesantias-->
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/Cesantias [Pago != '']">
					<xsl:element name="Cesantias">
						<xsl:attribute name="Pago">
							<xsl:value-of select="/DTE/Documentos/Nomina/Devengados/Cesantias/Pago"/>
						</xsl:attribute>
						<xsl:attribute name="Porcentaje">
							<xsl:value-of select="/DTE/Documentos/Nomina/Devengados/Cesantias/Porcentaje"/>
						</xsl:attribute>
						<xsl:attribute name="PagoIntereses">
							<xsl:value-of select="/DTE/Documentos/Nomina/Devengados/Cesantias/PagoIntereses"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:if>
				
				<!--Incapacidades-->
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/Incapacidades[Tipo !='']">
					<xsl:element name="Incapacidades">
						<xsl:for-each select="/DTE/Documentos/Nomina/Devengados/Incapacidades">
							
							<xsl:element name="Incapacidad">
								<xsl:if test="FechaInicio">
									<xsl:attribute name="FechaInicio">
										<xsl:value-of select="FechaInicio"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:if test="FechaFin">
									<xsl:attribute name="FechaFin">
										<xsl:value-of select="FechaFin"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:attribute name="Cantidad">
									<xsl:value-of select="Cantidad"/>
								</xsl:attribute>
								<xsl:attribute name="Tipo">
									<xsl:value-of select="Tipo"/>
								</xsl:attribute>
								<xsl:attribute name="Pago">
									<xsl:value-of select="Pago"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
			
				<!--Licencias-->
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/Licencias[Tipo != '']">
					<xsl:element name="Licencias">
						<xsl:for-each select="/DTE/Documentos/Nomina/Devengados/Licencias[Tipo='LMP']">
							<xsl:element name="LicenciaMP">
								<xsl:if test="FechaInicio">
									<xsl:attribute name="FechaInicio">
										<xsl:value-of select="FechaInicio"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:if test="FechaFin">
									<xsl:attribute name="FechaFin">
										<xsl:value-of select="FechaFin"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:attribute name="Cantidad">
									<xsl:value-of select="Cantidad"/>
								</xsl:attribute>
								<xsl:attribute name="Pago">
									<xsl:value-of select="Pago"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:for-each>
						<xsl:for-each select="/DTE/Documentos/Nomina/Devengados/Licencias[Tipo='LR']">
							<xsl:element name="LicenciaR">
								<xsl:if test="FechaInicio">
									<xsl:attribute name="FechaInicio">
										<xsl:value-of select="FechaInicio"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:if test="FechaFin">
									<xsl:attribute name="FechaFin">
										<xsl:value-of select="FechaFin"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:attribute name="Cantidad">
									<xsl:value-of select="Cantidad"/>
								</xsl:attribute>
								<xsl:attribute name="Pago">
									<xsl:value-of select="Pago"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:for-each>
						<xsl:for-each select="/DTE/Documentos/Nomina/Devengados/Licencias[Tipo='LNR']">
							<xsl:element name="LicenciaNR">
								<xsl:if test="FechaInicio">
									<xsl:attribute name="FechaInicio">
										<xsl:value-of select="FechaInicio"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:if test="FechaFin">
									<xsl:attribute name="FechaFin">
										<xsl:value-of select="FechaFin"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:attribute name="Cantidad">
									<xsl:value-of select="Cantidad"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
				
				<!--Bonificaciones-->
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/Bonificaciones[Pago != ''] or /DTE/Documentos/Nomina/Devengados/Bonificaciones[PagoNoSalarial != '']">
					<xsl:element name="Bonificaciones">
						<xsl:for-each select="/DTE/Documentos/Nomina/Devengados/Bonificaciones">
							<xsl:element name="Bonificacion">
								<xsl:if test="Pago">
									<xsl:attribute name="BonificacionS">
										<xsl:value-of select="Pago"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:if test="PagoNoSalarial">
									<xsl:attribute name="BonificacionNS">
										<xsl:value-of select="PagoNoSalarial"/>
									</xsl:attribute>
								</xsl:if>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
				
				<!--Auxilios-->
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/Auxilios[Pago !=''] or /DTE/Documentos/Nomina/Devengados/Auxilios[PagoNoSalarial !='']">
					<xsl:element name="Auxilios">
						<xsl:for-each select="/DTE/Documentos/Nomina/Devengados/Auxilios">
							<xsl:element name="Auxilio">
								<xsl:if test="Pago !=''">
									<xsl:attribute name="AuxilioS">
										<xsl:value-of select="Pago"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:if test="PagoNoSalarial !=''">
									<xsl:attribute name="AuxilioNS">
										<xsl:value-of select="PagoNoSalarial"/>
									</xsl:attribute>
								</xsl:if>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
				
				
				<!--Huelgas Legales-->
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/HuelgaLegal[Cantidad != '']">
					<xsl:element name="HuelgasLegales">
						<xsl:for-each select="/DTE/Documentos/Nomina/Devengados/HuelgaLegal">
							<xsl:element name="HuelgaLegal">
								<xsl:if test="FechaInicio">
									<xsl:attribute name="FechaInicio">
										<xsl:value-of select="FechaInicio"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:if test="FechaFin">
									<xsl:attribute name="FechaFin">
										<xsl:value-of select="FechaFin"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:attribute name="Cantidad">
									<xsl:value-of select="Cantidad"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
				
				<!--OtrosConceptos-->
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/OtrosConceptos[OtrosConceptos != '']">
					<xsl:element name="OtrosConceptos">
						<xsl:for-each select="/DTE/Documentos/Nomina/Devengados/OtrosConceptos">
							<xsl:element name="OtroConcepto">
								<xsl:attribute name="DescripcionConcepto">
									<xsl:value-of select="OtrosConceptos"/>
								</xsl:attribute>
								<xsl:if test="Pago">
									<xsl:attribute name="ConceptoS">
										<xsl:value-of select="Pago"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:if test="PagoNoSalarial">
									<xsl:attribute name="ConceptoNS">
										<xsl:value-of select="PagoNoSalarial"/>
									</xsl:attribute>
								</xsl:if>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
								
				<!--Compensaciones-->
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/Compensaciones[Pago != '']">
					<xsl:element name="Compensaciones">
						<xsl:for-each select="/DTE/Documentos/Nomina/Devengados/Compensaciones">
							<xsl:element name="Compensacion">
								<xsl:attribute name="CompensacionO">
										<xsl:value-of select="Pago"/>
								</xsl:attribute>
								<xsl:attribute name="CompensacionE">
									<xsl:value-of select="PagoExtraordinario"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
				
				<!--Utilizado para Todos los Elementos de Bonos Electronicos o de Papel de Servicio, Cheques, Tarjetas, Vales, etc de Devengos del Documento-->
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/Bono[PagoS != ''] or /DTE/Documentos/Nomina/Devengados/Bono[PagoNS != ''] or /DTE/Documentos/Nomina/Devengados/Bono[PagoAlimentacionS != ''] or /DTE/Documentos/Nomina/Devengados/Bono[PagoAlimentacionNS != '']">
					<xsl:element name="BonoEPCTVs">
						<xsl:for-each select="/DTE/Documentos/Nomina/Devengados/Bono">
							<xsl:element name="BonoEPCTV">
								<xsl:if test="PagoS != ''">
									<xsl:attribute name="PagoS">
										<xsl:value-of select="PagoS"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:if test="PagoNS != ''">
									<xsl:attribute name="PagoNS">
										<xsl:value-of select="PagoNS"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:if test="PagoAlimentacionS != ''">
									<xsl:attribute name="PagoAlimentacionS">
										<xsl:value-of select="PagoAlimentacionS"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:if test="PagoAlimentacionNS != ''">
									<xsl:attribute name="PagoAlimentacionNS">
										<xsl:value-of select="PagoAlimentacionNS"/>
									</xsl:attribute>
								</xsl:if>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
				
				<!--Comisiones-->
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/Comisiones != ''">
					<xsl:element name="Comisiones">
						<xsl:for-each select="/DTE/Documentos/Nomina/Devengados/Comisiones">
							<xsl:element name="Comision">
									<xsl:value-of select="."/>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
				
				<!--Valor Pagado por Pago Tercero-->
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/PagosTerceros != ''">
					<xsl:element name="PagosTerceros">
						<xsl:for-each select="/DTE/Documentos/Nomina/Devengados/PagosTerceros">
							<xsl:element name="PagoTercero">
								<xsl:value-of select="."/>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
				
				<!--Valor Pagado por Anticios-->
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/Anticipos != ''">
					<xsl:element name="Anticipos">
						<xsl:for-each select="/DTE/Documentos/Nomina/Devengados/Anticipos">
							<xsl:element name="Anticipo">
								<xsl:value-of select="."/>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
				
				
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/Dotacion != ''">
					<xsl:element name="Dotacion">
						<xsl:value-of select="/DTE/Documentos/Nomina/Devengados/Dotacion"/>
					</xsl:element>
				</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/ApoyoSost != ''">
					<xsl:element name="ApoyoSost">
						<xsl:value-of select="/DTE/Documentos/Nomina/Devengados/ApoyoSost"/>
					</xsl:element>
				</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/Teletrabajo != ''">
					<xsl:element name="Teletrabajo">
						<xsl:value-of select="/DTE/Documentos/Nomina/Devengados/Teletrabajo"/>
					</xsl:element>
				</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/BonifRetiro != ''">
					<xsl:element name="BonifRetiro">
						<xsl:value-of select="/DTE/Documentos/Nomina/Devengados/BonifRetiro"/>
					</xsl:element>
				</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/Indemnizacion != ''">
					<xsl:element name="Indemnizacion">
						<xsl:value-of select="/DTE/Documentos/Nomina/Devengados/Indemnizacion"/>
					</xsl:element>
				</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/Reintegro != ''">
					<xsl:element name="Reintegro">
						<xsl:value-of select="/DTE/Documentos/Nomina/Devengados/Reintegro"/>
					</xsl:element>
				</xsl:if>
			</xsl:element>
			
			<!--Informacion de Todas las Deducciones del Documento-->
			<xsl:element name="Deducciones">
				<xsl:element name="Salud">
					<xsl:attribute name="Porcentaje">
						<xsl:value-of select="/DTE/Documentos/Nomina/Deducciones/Salud/Porcentaje"/>
					</xsl:attribute>
					<xsl:attribute name="Deduccion">
						<xsl:value-of select="/DTE/Documentos/Nomina/Deducciones/Salud/Deduccion"/>
					</xsl:attribute>
				</xsl:element>
				<xsl:element name="FondoPension">
					<xsl:attribute name="Porcentaje">
						<xsl:value-of select="/DTE/Documentos/Nomina/Deducciones/FondoPension/Porcentaje"/>
					</xsl:attribute>
					<xsl:attribute name="Deduccion">
						<xsl:value-of select="/DTE/Documentos/Nomina/Deducciones/FondoPension/Deduccion"/>
					</xsl:attribute>
				</xsl:element>
				
				<xsl:if test="(/DTE/Documentos/Nomina/Deducciones/FondoSP[Porcentaje!= ''] or /DTE/Documentos/Nomina/Deducciones/FondoSP[Deduccion!= ''] or /DTE/Documentos/Nomina/Deducciones/FondoSP[PorcentajeSub!= ''] or /DTE/Documentos/Nomina/Deducciones/FondoSP[DeduccionSub!= ''])">
				<xsl:element name="FondoSP">
					<xsl:if test="/DTE/Documentos/Nomina/Deducciones/FondoSP/Porcentaje!= ''">
						<xsl:attribute name="Porcentaje">
							<xsl:value-of select="/DTE/Documentos/Nomina/Deducciones/FondoSP/Porcentaje"/>
						</xsl:attribute>
					</xsl:if>
					<xsl:if test="/DTE/Documentos/Nomina/Deducciones/FondoSP/Deduccion!= ''">
						<xsl:attribute name="Deduccion">
							<xsl:value-of select="/DTE/Documentos/Nomina/Deducciones/FondoSP/Deduccion"/>
						</xsl:attribute>
					</xsl:if>
					<xsl:if test="/DTE/Documentos/Nomina/Deducciones/FondoSP/PorcentajeSub!= ''">
						<xsl:attribute name="PorcentajeSub">
							<xsl:value-of select="/DTE/Documentos/Nomina/Deducciones/FondoSP/PorcentajeSub"/>
						</xsl:attribute>
					</xsl:if>
					<xsl:if test="/DTE/Documentos/Nomina/Deducciones/FondoSP/DeduccionSub!= ''">
						<xsl:attribute name="DeduccionSub">
							<xsl:value-of select="/DTE/Documentos/Nomina/Deducciones/FondoSP/DeduccionSub"/>
						</xsl:attribute>
					</xsl:if>
				</xsl:element>
				</xsl:if>
				
				<!--Sindicatos-->
				<xsl:if test="/DTE/Documentos/Nomina/Deducciones/Sindicato[Deduccion != '']">
					<xsl:element name="Sindicatos">
						<xsl:for-each select="/DTE/Documentos/Nomina/Deducciones/Sindicato">
							<xsl:element name="Sindicato">
								<xsl:attribute name="Porcentaje">
									<xsl:value-of select="Porcentaje"/>
								</xsl:attribute>
								<xsl:attribute name="Deduccion">
									<xsl:value-of select="Deduccion"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
				
				<!--Sanciones-->
				<xsl:if test="/DTE/Documentos/Nomina/Deducciones/Sanciones[SancionPublic != ''] or /DTE/Documentos/Nomina/Deducciones/Sanciones[SancionPriv != '']">
					<xsl:element name="Sanciones">
						<xsl:for-each select="/DTE/Documentos/Nomina/Deducciones/Sanciones">
							<xsl:element name="Sancion">
								<xsl:attribute name="SancionPublic">
									<xsl:value-of select="SancionPublic"/>
								</xsl:attribute>
								<xsl:attribute name="SancionPriv">
									<xsl:value-of select="SancionPriv"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
				
				<!--Libranza-->
				<xsl:if test="/DTE/Documentos/Nomina/Deducciones/Libranza[Deduccion != '']">
					<xsl:element name="Libranzas">
						<xsl:for-each select="/DTE/Documentos/Nomina/Deducciones/Libranza">
							<xsl:element name="Libranza">
								<xsl:attribute name="Descripcion">
									<xsl:value-of select="Descripcion"/>
								</xsl:attribute>
								<xsl:attribute name="Deduccion">
									<xsl:value-of select="Deduccion"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
				
				<!--Valor Pagado por Pago Tercero-->
				<xsl:if test="/DTE/Documentos/Nomina/Deducciones/PagosTerceros != ''">
					<xsl:element name="PagosTerceros">
						<xsl:for-each select="/DTE/Documentos/Nomina/Deducciones/PagosTerceros">
							<xsl:element name="PagoTercero">
								<xsl:value-of select="."/>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
				
				<!--Valor Pagado por Anticios-->
				<xsl:if test="/DTE/Documentos/Nomina/Deducciones/Anticipos != ''">
					<xsl:element name="Anticipos">
						<xsl:for-each select="/DTE/Documentos/Nomina/Deducciones/Anticipos">
							<xsl:element name="Anticipo">
								<xsl:value-of select="."/>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
				
				<!--Valor Pagado por OtrasDeducciones-->
				<xsl:if test="/DTE/Documentos/Nomina/Deducciones/OtrasDeducciones != ''">
					<xsl:element name="OtrasDeducciones">
						<xsl:for-each select="/DTE/Documentos/Nomina/Deducciones/OtrasDeducciones">
							<xsl:element name="OtraDeduccion">
								<xsl:value-of select="."/>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
				
				<xsl:if test="/DTE/Documentos/Nomina/Deducciones/PensionVoluntaria != ''">
					<xsl:element name="PensionVoluntaria">
						<xsl:value-of select="/DTE/Documentos/Nomina/Deducciones/PensionVoluntaria"/>
					</xsl:element>
				</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/Deducciones/RetencionFuente != ''">
					<xsl:element name="RetencionFuente">
						<xsl:value-of select="/DTE/Documentos/Nomina/Deducciones/RetencionFuente"/>
					</xsl:element>
				</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/Deducciones/AFC != ''">
					<xsl:element name="AFC">
						<xsl:value-of select="/DTE/Documentos/Nomina/Deducciones/AFC"/>
					</xsl:element>
				</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/Deducciones/Cooperativa != ''">
					<xsl:element name="Cooperativa">
						<xsl:value-of select="/DTE/Documentos/Nomina/Deducciones/Cooperativa"/>
					</xsl:element>
				</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/Deducciones/EmbargoFiscal != ''">
					<xsl:element name="EmbargoFiscal">
						<xsl:value-of select="/DTE/Documentos/Nomina/Deducciones/EmbargoFiscal"/>
					</xsl:element>
				</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/Deducciones/PlanComplement != ''">
					<xsl:element name="PlanComplementarios">
						<xsl:value-of select="/DTE/Documentos/Nomina/Deducciones/PlanComplement"/>
					</xsl:element>
				</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/Deducciones/Educacion != ''">
					<xsl:element name="Educacion">
						<xsl:value-of select="/DTE/Documentos/Nomina/Deducciones/Educacion"/>
					</xsl:element>
				</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/Deducciones/Reintegro != ''">
					<xsl:element name="Reintegro">
						<xsl:value-of select="/DTE/Documentos/Nomina/Deducciones/Reintegro"/>
					</xsl:element>
				</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/Deducciones/Deuda != ''">
					<xsl:element name="Deuda">
						<xsl:value-of select="/DTE/Documentos/Nomina/Deducciones/Deuda"/>
					</xsl:element>
				</xsl:if>
			</xsl:element>
			
			<!--Totales de documento Nomina-->
			<xsl:if test="/DTE/Documentos/Nomina/Pagos/Redondeo != ''">
				<xsl:element name="Redondeo">
					<xsl:value-of select="/DTE/Documentos/Nomina/Pagos/Redondeo"/>
				</xsl:element>
			</xsl:if>
			<xsl:element name="DevengadosTotal">
				<xsl:value-of select="/DTE/Documentos/Nomina/Pagos/Devengados"/>
			</xsl:element>
			<xsl:element name="DeduccionesTotal">
				<xsl:value-of select="/DTE/Documentos/Nomina/Pagos/Deducciones"/>
			</xsl:element>
			<xsl:element name="ComprobanteTotal">
				<xsl:value-of select="/DTE/Documentos/Nomina/Pagos/VlrPagar"/>
			</xsl:element>
			
			
			<xsl:element name="Personalizados">
				<xsl:element name="DocPersonalizado">
					<xsl:attribute name="dteID">
						<xsl:value-of select="/DTE/Personalizados/DocPersonalizado/@dteID"/>
					</xsl:attribute>
					<xsl:element name="campoString">
						<xsl:attribute name="name">
							<xsl:text>QRCode</xsl:text>
						</xsl:attribute>
						<xsl:variable name="CUFE">
							
							<!--<xsl:value-of select="crypto:hash($CUFE, 'SHA-384')"/>-->
							<xsl:value-of select="$CUFE"/>
						</xsl:variable>
						<xsl:value-of select="concat('NumNIE:=',concat(/DTE/Documentos/Nomina/Resumen/Serie, /DTE/Documentos/Nomina/Resumen/Numero))"/>
						<xsl:text>
								</xsl:text>
						<xsl:value-of select="concat('FecNIE:',substring(/DTE/Documentos/Nomina/Resumen/FechaEmis, 1, 10))"/>
						<xsl:text>
								</xsl:text>
						<xsl:value-of select="concat('HorNIE:',substring(/DTE/Documentos/Nomina/Resumen/FechaEmis, 12, 8),'-05:00')"/>
						<xsl:text>
								</xsl:text>
						<xsl:value-of select="concat('NitNIE:',normalize-space(/DTE/Documentos/Nomina/NominaEmisor/IDEmisor))"/>
						<xsl:text>
								</xsl:text>
						<xsl:value-of select="concat('DocEmp:',normalize-space(/DTE/Documentos/Nomina/NominaReceptor/DocRecep/NroDocRecep))"/>
						<xsl:text>
								</xsl:text>
						<xsl:value-of select="concat('ValDev:',format-number(/DTE/Documentos/Nomina/Pagos/Devengados,'#0.00'))"/>
						<xsl:text>
								</xsl:text>
						<xsl:value-of select="concat('ValDed:',format-number(/DTE/Documentos/Nomina/Pagos/Deducciones,'#0.00'))"/>
						<xsl:text>
								</xsl:text>
						<xsl:value-of select="concat('ValTol:',format-number(/DTE/Documentos/Nomina/Pagos/VlrPagar,'#0.00'))"/>
						<xsl:text>
								</xsl:text>
						<xsl:value-of select="concat('CUFE:',$CUFE)"/>
						<xsl:text>
								</xsl:text>
						<xsl:choose>
							<xsl:when test="/DTE/Documentos/Nomina/Resumen/Ambiente = 2">
								<xsl:value-of select="concat('https://catalogo-vpfe-hab.dian.gov.co/document/searchqr?documentkey=',$CUFE)"/>
							</xsl:when>
							<xsl:when test="/DTE/Documentos/Nomina/Resumen/Ambiente = 2">
								<xsl:value-of select="concat('https://catalogo-vpfe.dian.gov.co/document/searchqr?documentkey=',$CUFE)"/>
							</xsl:when>					
						</xsl:choose>
					</xsl:element>
					<xsl:element name="campoString">
						<xsl:attribute name="name">
							<xsl:text>SERIE</xsl:text>
						</xsl:attribute>
						<xsl:value-of select="/DTE/Documentos/Nomina/Resumen/Serie"/>
					</xsl:element>
					<xsl:element name="campoString">
						<xsl:attribute name="name">
							<xsl:text>FOLIO</xsl:text>
						</xsl:attribute>
						<xsl:value-of select="/DTE/Documentos/Nomina/Resumen/Numero"/>
					</xsl:element>
					<xsl:element name="campoString">
						<xsl:attribute name="name">
							<xsl:text>FechaGeneracion</xsl:text>
						</xsl:attribute>
						<xsl:value-of select="substring(string(current-dateTime()), 1, 10)"/>
					</xsl:element>
					<xsl:element name="campoString">
						<xsl:attribute name="name">
							<xsl:text>HoraGeneracion</xsl:text>
						</xsl:attribute>
						<xsl:value-of select="substring(string(current-dateTime()), 12, 8)"/>
					</xsl:element>					
					<xsl:copy-of select="/DTE/Personalizados/DocPersonalizado/*"/>
					<xsl:for-each select="/DTE/Documento/Referencia[TpoDocRef = '90']">
						<xsl:element name="ImpresionReferencia">
							<xsl:element name="PersonNroLinRef">
								<xsl:value-of select="NroLinRef"/>
							</xsl:element>
							<xsl:element name="ECB02">
								<xsl:value-of select="ECB02"/>
							</xsl:element>
							<xsl:element name="ECB03">
								<xsl:value-of select="ECB03"/>
							</xsl:element>
							<xsl:element name="ECB04">
								<xsl:value-of select="ECB04"/>
							</xsl:element>
							<xsl:element name="ECB05">
								<xsl:value-of select="ECB05"/>
							</xsl:element>
							<xsl:element name="ECB06">
								<xsl:value-of select="ECB06"/>
							</xsl:element>
							<xsl:element name="ECB07">
								<xsl:value-of select="ECB07"/>
							</xsl:element>
							<xsl:element name="ECB08">
								<xsl:value-of select="ECB08"/>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:element>			
		</NominaIndividual>
	</xsl:template>
	<xsl:template name="NominaIndividualDeAjuste">
		<!--Gosocket DTE v1.2 CO to UBL 2.1 OASIS Oficial-->
		<NominaIndividualDeAjuste xmlns="dian:gov:co:facturaelectronica:NominaIndividualDeAjuste"
			xmlns:xs="http://www.w3.org/2001/XMLSchema-instance"
			xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
			xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
			xmlns:xades="http://uri.etsi.org/01903/v1.3.2#"
			xmlns:xades141="http://uri.etsi.org/01903/v1.4.1#"
			xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
			SchemaLocation=""
			xsi:schemaLocation="dian:gov:co:facturaelectronica:NominaIndividualDeAjuste NominaIndividualDeAjusteElectronicaXSD.xsd">
			
			<!--var CurrencyType-->
			<xsl:variable name="MonedaC" select="normalize-space(//Moneda)"/>
			<!-- var CUFE -->
			<xsl:variable name="CUFE">
				<xsl:value-of
					select="
						concat(/DTE/Documentos/Nomina/Resumen/Serie, /DTE/Documentos/Nomina/Resumen/Numero, substring(/DTE/Documentos/Nomina/Resumen/FechaEmis, 1, 10), if (string-length(substring-after(/DTE/Documentos/Nomina/Resumen/FechaEmis, 'T')) != 9) then
						concat(substring-after(/DTE/Documentos/Nomina/Resumen/FechaEmis, 'T'), '-05:00')
						else
						concat(substring(/DTE/Documentos/Nomina/Resumen/FechaEmis, 12, 8), '-05:00'), if(/DTE/Documentos/Nomina/Resumen/Novedad/TipoNota= 1) then format-number(/DTE/Documentos/Nomina/Pagos/Devengados, '#0.00') else '0.00', if(/DTE/Documentos/Nomina/Resumen/Novedad/TipoNota= 1) then format-number(/DTE/Documentos/Nomina/Pagos/Deducciones, '#0.00') else '0.00', if(/DTE/Documentos/Nomina/Resumen/Novedad/TipoNota= 1) then format-number(/DTE/Documentos/Nomina/Pagos/VlrPagar, '#0.00') else '0.00', /DTE/Documentos/Nomina/NominaEmisor/IDEmisor, if(/DTE/Documentos/Nomina/Resumen/Novedad/TipoNota= 1) then /DTE/Documentos/Nomina/NominaReceptor/DocRecep/NroDocRecep else 0, /DTE/Documentos/Nomina/Resumen/TipoNomina, '20191', /DTE/Documentos/Nomina/Resumen/Ambiente)"
				/>
			</xsl:variable>
			<xsl:variable name="CodigoSoftware">
						<xsl:text>81f27ff2-453d-411c-9e9f-a6b59b00c4a0</xsl:text>
			</xsl:variable>
			<!--EXTENSIONES DEFINIDAS POR DIAN Para la Firma electronica-->
			<xsl:element name="ext:UBLExtensions"/>
			
			<xsl:element name="TipoNota">
					<xsl:value-of select="/DTE/Documentos/Nomina/Resumen/Novedad/TipoNota"/>
			</xsl:element>
				
			<!--Utilizado para todo el contenido correspondiente al evento de Reemplazar Documento-->
			<xsl:if test="/DTE/Documentos/Nomina/Resumen/Novedad/TipoNota= '1'">
				<xsl:element name="Reemplazar">
			
					<!--Utilizado para Atributos de Documento Predecesor a Reemplazar-->
					<xsl:element name="ReemplazandoPredecesor">
						<xsl:attribute name="NumeroPred">
							<xsl:value-of select="/DTE/Documentos/Nomina/Resumen/Novedad/Numero"/>
						</xsl:attribute>
						<xsl:attribute name="CUNEPred">
							<xsl:value-of select="/DTE/Documentos/Nomina/Resumen/Novedad/CUNE"/>
						</xsl:attribute>
						<xsl:attribute name="FechaGenPred">
							<xsl:value-of select="substring(/DTE/Documentos/Nomina/Resumen/Novedad/Fecha,1,10)"/>
						</xsl:attribute>
					</xsl:element>
						
			<!--Periodo-->
			<xsl:element name="Periodo">
				<xsl:attribute name="FechaIngreso">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaReceptor/FechaIngreso"/>
				</xsl:attribute>
				<xsl:if test="/DTE/Documentos/Nomina/NominaReceptor/FechaRetiro !=''">
					<xsl:attribute name="FechaRetiro">
						<xsl:value-of select="/DTE/Documentos/Nomina/NominaReceptor/FechaRetiro"/>
					</xsl:attribute>					
				</xsl:if>				
				<xsl:attribute name="FechaLiquidacionInicio">
					<xsl:value-of select="/DTE/Documentos/Nomina/Resumen/FechaInicialPago"/>
				</xsl:attribute>
				<xsl:attribute name="FechaLiquidacionFin">
					<xsl:value-of select="/DTE/Documentos/Nomina/Resumen/FechaFinalPago"/>
				</xsl:attribute>
				<xsl:attribute name="TiempoLaborado">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaReceptor/TiempoLaborado"/>
				</xsl:attribute>
				<xsl:attribute name="FechaGen">
					<xsl:value-of select="substring(/DTE/Documentos/Nomina/Resumen/FechaEmis,1,10)"/>
				</xsl:attribute>
			</xsl:element>
			<!-- ID del documento-->
			<xsl:element name="NumeroSecuenciaXML">
				<xsl:if test="/DTE/Documentos/Nomina/NominaReceptor/CodigoTrabajador">
					<xsl:attribute name="CodigoTrabajador">
						<xsl:value-of select="/DTE/Documentos/Nomina/NominaReceptor/CodigoTrabajador"/>
					</xsl:attribute>					
				</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/Resumen/Serie">
					<xsl:attribute name="Prefijo">
						<xsl:value-of select="/DTE/Documentos/Nomina/Resumen/Serie"/>
					</xsl:attribute>					
				</xsl:if>				
				<xsl:attribute name="Consecutivo">
					<xsl:value-of select="/DTE/Documentos/Nomina/Resumen/Numero"/>
				</xsl:attribute>
				<xsl:attribute name="Numero">
					<xsl:value-of select="concat(/DTE/Documentos/Nomina/Resumen/Serie,/DTE/Documentos/Nomina/Resumen/Numero)"/>
				</xsl:attribute>
			</xsl:element>
			
			<!--LugarGeneracionXML-->
			<xsl:element name="LugarGeneracionXML">
				<xsl:attribute name="Pais">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaEmisor/LugarExped/Pais"/>
				</xsl:attribute>
				<xsl:attribute name="DepartamentoEstado">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaEmisor/LugarExped/Departamento"/>
				</xsl:attribute>
				<xsl:attribute name="MunicipioCiudad">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaEmisor/LugarExped/Ciudad"/>
				</xsl:attribute>
				<xsl:attribute name="Idioma">
					<xsl:text>es</xsl:text>
				</xsl:attribute>
			</xsl:element>
			
			<!--Proveedor Tecnologico -->
			<xsl:element name="ProveedorXML">
				<xsl:attribute name="RazonSocial">
					<xsl:text>SIGNATURE SOUTH CONSULTING COLOMBIA SAS</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="NIT">
					<xsl:text>900508908</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="DV">
					<xsl:text>9</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="SoftwareID">
					<xsl:value-of select="$CodigoSoftware"/>
				</xsl:attribute>
				<xsl:attribute name="SoftwareSC">
				<xsl:choose>
					<xsl:when test="/DTE/Documentos/Nomina/Resumen/Ambiente = 2">
						<!-- Si es ambiente de pruebas -->
						<xsl:variable name="CodigoSeguridad">
							<xsl:value-of select="concat($CodigoSoftware, '20191', /DTE/Documentos/Nomina/Resumen/Serie, /DTE/Documentos/Nomina/Resumen/Numero)" />
						</xsl:variable>
						<xsl:value-of select="$CodigoSeguridad"/>
					</xsl:when>
					<xsl:otherwise>
						<!-- Si es ambiente de producción -->
						<xsl:variable name="CodigoSeguridad">
							<xsl:value-of select="concat($CodigoSoftware, '20191', /DTE/Documentos/Nomina/Resumen/Serie, /DTE/Documentos/Nomina/Resumen/Numero)" />
						</xsl:variable>
						<xsl:value-of select="$CodigoSeguridad"/>
					</xsl:otherwise>
				</xsl:choose>
				</xsl:attribute>
			</xsl:element>
			
			<!--QRcode-->
			<xsl:element name="CodigoQR">
				<xsl:choose>
					<xsl:when test="/DTE/Documentos/Nomina/Resumen/Ambiente = 2">
						<xsl:value-of select="concat('https://catalogo-vpfe-hab.dian.gov.co/document/searchqr?documentkey=',$CUFE)"/>
					</xsl:when>
					<xsl:when test="/DTE/Documentos/Nomina/Resumen/Ambiente = 1">
						<xsl:value-of select="concat('https://catalogo-vpfe.dian.gov.co/document/searchqr?documentkey=',$CUFE)"/>
					</xsl:when>					
				</xsl:choose>
			</xsl:element>
			
			
			<!--Informacion General del DTE-->
			
			<xsl:element name="InformacionGeneral">			
				<xsl:attribute name="Version">
					<xsl:text>V1.0: Nota de Ajuste de Documento Soporte de Pago de Nómina Electrónica</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="Ambiente">
					<xsl:value-of select="/DTE/Documentos/Nomina/Resumen/Ambiente"/>
				</xsl:attribute>
				<xsl:attribute name="TipoXML">
					<xsl:value-of select="/DTE/Documentos/Nomina/Resumen/TipoNomina"/>
				</xsl:attribute>
				<xsl:attribute name="CUNE">
					<xsl:value-of select="$CUFE"/>
				</xsl:attribute>
				<xsl:attribute name="EncripCUNE">
					<xsl:value-of select="'CUNE-SHA384'"/>
				</xsl:attribute>
				<xsl:attribute name="FechaGen">
					<xsl:value-of select="substring(/DTE/Documentos/Nomina/Resumen/FechaEmis, 1, 10)"/>
				</xsl:attribute>
				<xsl:attribute name="HoraGen">
					<xsl:value-of select="concat(substring(/DTE/Documentos/Nomina/Resumen/FechaEmis, 12, 8), '-05:00')"/>
				</xsl:attribute>
				<xsl:attribute name="PeriodoNomina">
					<xsl:value-of select="/DTE/Documentos/Nomina/Resumen/PeriodoNomina"/>
				</xsl:attribute>
				<xsl:attribute name="TipoMoneda">
					<xsl:value-of select="$MonedaC"/>
				</xsl:attribute>
				<xsl:if test="$MonedaC != 'COP'">
				<xsl:attribute name="TRM">
					<xsl:value-of select="/DTE/Documentos/Nomina/Pagos/FctConv"/>
				</xsl:attribute>
				</xsl:if>
			</xsl:element>
			
			<!--Notas adicionales del documento-->
			<xsl:for-each select="/DTE/Documentos/Nomina/Resumen/Notas">
				<xsl:element name="Notas">
					<xsl:value-of select="."/>
				</xsl:element>
			</xsl:for-each>
			
			<!--Informacion del Empleador-->
			<xsl:element name="Empleador">			
				<xsl:attribute name="RazonSocial">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaEmisor/NmbEmisor"/>
				</xsl:attribute>
				<xsl:attribute name="NIT">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaEmisor/IDEmisor"/>
				</xsl:attribute>
				<xsl:attribute name="DV">
					<xsl:call-template name="calculNIT-dv">
						<xsl:with-param name="NIT"
							select="normalize-space(/DTE/Documentos/Nomina/NominaEmisor/IDEmisor)"/>
					</xsl:call-template>
				</xsl:attribute>
				<xsl:attribute name="Pais">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaEmisor/DomFiscal/Pais"/>
				</xsl:attribute>
				<xsl:attribute name="DepartamentoEstado">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaEmisor/DomFiscal/Departamento"/>
				</xsl:attribute>
				<xsl:attribute name="MunicipioCiudad">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaEmisor/DomFiscal/Ciudad"/>
				</xsl:attribute>
				<xsl:attribute name="Direccion">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaEmisor/DomFiscal/Calle"/>
				</xsl:attribute>
			</xsl:element>
			
			
			<!--Informacion del Trabajador-->
			<xsl:element name="Trabajador">			
				<xsl:attribute name="TipoTrabajador">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaReceptor/TipoTrabajador"/>
				</xsl:attribute>
				<xsl:attribute name="SubTipoTrabajador">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaReceptor/SubTipoTrabajador"/>
				</xsl:attribute>
				<xsl:attribute name="AltoRiesgoPension">
					<xsl:value-of select="lower-case(/DTE/Documentos/Nomina/NominaReceptor/AltoRiesgoPension)"/>
				</xsl:attribute>
				<xsl:attribute name="TipoDocumento">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaReceptor/DocRecep/TipoDocRecep"/>
				</xsl:attribute>
				<xsl:attribute name="NumeroDocumento">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaReceptor/DocRecep/NroDocRecep"/>
				</xsl:attribute>
				<xsl:attribute name="PrimerApellido">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaReceptor/NombreRecep/PrimerApellido"/>
				</xsl:attribute>
				<xsl:attribute name="SegundoApellido">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaReceptor/NombreRecep/SegundoApellido"/>
				</xsl:attribute>
				<xsl:attribute name="PrimerNombre">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaReceptor/NombreRecep/PrimerNombre"/>
				</xsl:attribute>
				<xsl:if test="/DTE/Documentos/Nomina/NominaReceptor/NombreRecep/OtrosNombres">
				<xsl:attribute name="OtrosNombres">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaReceptor/NombreRecep/OtrosNombres"/>
				</xsl:attribute>
				</xsl:if>
				<xsl:attribute name="LugarTrabajoPais">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaReceptor/DomFiscal/Pais"/>
				</xsl:attribute>
				<xsl:attribute name="LugarTrabajoDepartamentoEstado">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaReceptor/DomFiscal/Departamento"/>
				</xsl:attribute>
				<xsl:attribute name="LugarTrabajoMunicipioCiudad">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaReceptor/DomFiscal/Ciudad"/>
				</xsl:attribute>
				<xsl:attribute name="LugarTrabajoDireccion">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaReceptor/DomFiscal/Calle"/>
				</xsl:attribute>
				<xsl:if test="/DTE/Documentos/Nomina/NominaReceptor/SalarioIntegral">
				<xsl:attribute name="SalarioIntegral">
					<xsl:value-of select="'true'"/>
				</xsl:attribute>
				</xsl:if>
				<xsl:attribute name="TipoContrato">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaReceptor/TipoContrato"/>
				</xsl:attribute>
				<xsl:if test="/DTE/Documentos/Nomina/NominaReceptor/SalarioBase != ''">
					<xsl:attribute name="Sueldo">
						<xsl:value-of select="/DTE/Documentos/Nomina/NominaReceptor/SalarioBase"/>
					</xsl:attribute>
				</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/NominaReceptor/SalarioIntegral != ''">
				<xsl:attribute name="Sueldo">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaReceptor/SalarioIntegral"/>
				</xsl:attribute>
				</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/NominaReceptor/CodigoTrabajador">
					<xsl:attribute name="CodigoTrabajador">
						<xsl:value-of select="/DTE/Documentos/Nomina/NominaReceptor/CodigoTrabajador"/>
					</xsl:attribute>					
				</xsl:if>
			</xsl:element>
			
			<!--Informacion de la forma de pago-->
			<xsl:element name="Pago">
				<xsl:attribute name="Forma">
					<xsl:value-of select="/DTE/Documentos/Nomina/Resumen/FormaPago"/>
				</xsl:attribute>
				<xsl:attribute name="Metodo">
					<xsl:value-of select="/DTE/Documentos/Nomina/Resumen/MedioPago"/>
				</xsl:attribute>
				<xsl:if test="/DTE/Documentos/Nomina/NominaReceptor/Banco">
				<xsl:attribute name="Banco">
					<xsl:value-of select="/DTE/Documentos/Nomina/NominaReceptor/Banco"/>
				</xsl:attribute>
				</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/NominaReceptor/TipoCuenta">
					<xsl:attribute name="TipoCuenta">
						<xsl:value-of select="/DTE/Documentos/Nomina/NominaReceptor/TipoCuenta"/>
					</xsl:attribute>
				</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/NominaReceptor/NumeroCuenta">
					<xsl:attribute name="NumeroCuenta">
						<xsl:value-of select="/DTE/Documentos/Nomina/NominaReceptor/NumeroCuenta"/>
					</xsl:attribute>
				</xsl:if>
			</xsl:element>
			
			<!--Informacion de la fecha de pago-->
			<xsl:element name="FechasPagos">
				<xsl:for-each select="/DTE/Documentos/Nomina/Resumen/FechaPago">
					<xsl:element name="FechaPago">
						<xsl:value-of select="."/>
					</xsl:element>
				</xsl:for-each>
			</xsl:element>
			
			<!--Informacion Devengados Aplicados del DTE-->
			<xsl:element name="Devengados">
				<xsl:element name="Basico">
					<xsl:attribute name="DiasTrabajados">
						<xsl:value-of select="/DTE/Documentos/Nomina/Devengados/DiasTrabajados"/>
					</xsl:attribute>
					<xsl:attribute name="SueldoTrabajado">
						<xsl:value-of select="/DTE/Documentos/Nomina/Devengados/SueldoTrabajado"/>
					</xsl:attribute>
				</xsl:element>
				
				<!--Trasnporte-->
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/Transporte != ''">
				<xsl:element name="Transporte">
					<xsl:if test="/DTE/Documentos/Nomina/Devengados/Transporte/AuxilioTransporte">
					<xsl:attribute name="AuxilioTransporte">
						<xsl:value-of select="/DTE/Documentos/Nomina/Devengados/Transporte/AuxilioTransporte"/>
					</xsl:attribute>
					</xsl:if>
					<xsl:if test="/DTE/Documentos/Nomina/Devengados/Transporte/Viatico">
						<xsl:attribute name="ViaticoManuAlojS">
							<xsl:value-of select="/DTE/Documentos/Nomina/Devengados/Transporte/Viatico"/>
						</xsl:attribute>
					</xsl:if>
					<xsl:if test="/DTE/Documentos/Nomina/Devengados/Transporte/ViaticoNoSalarial">
						<xsl:attribute name="ViaticoManuAlojNS">
							<xsl:value-of select="/DTE/Documentos/Nomina/Devengados/Transporte/ViaticoNoSalarial"/>
						</xsl:attribute>
					</xsl:if>
				</xsl:element>
				</xsl:if>
				
				<!--Horas extras-->
				
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/HorasExtra/Tipo='HED'">
					<xsl:element name="HEDs">
						<xsl:for-each select="/DTE/Documentos/Nomina/Devengados/HorasExtra[Tipo='HED']">
							
								<xsl:element name="HED">
									<xsl:if test="HoraInicio">
										<xsl:attribute name="HoraInicio">
											<xsl:value-of select="HoraInicio"/>
										</xsl:attribute>
									</xsl:if>
									<xsl:if test="HoraFin">
										<xsl:attribute name="HoraFin">
											<xsl:value-of select="HoraFin"/>
										</xsl:attribute>
									</xsl:if>
									<xsl:attribute name="Cantidad">
										<xsl:value-of select="Cantidad"/>
									</xsl:attribute>
									<xsl:attribute name="Porcentaje">
										<xsl:value-of select="Porcentaje"/>
									</xsl:attribute>
									<xsl:attribute name="Pago">
										<xsl:value-of select="Pago"/>
									</xsl:attribute>
								</xsl:element>
						</xsl:for-each>
					</xsl:element>
					</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/HorasExtra/Tipo='HEN'">
						<xsl:element name="HENs">
							<xsl:for-each select="/DTE/Documentos/Nomina/Devengados/HorasExtra[Tipo='HEN']">
								
										<xsl:element name="HEN">
											<xsl:if test="HoraInicio">
												<xsl:attribute name="HoraInicio">
													<xsl:value-of select="HoraInicio"/>
												</xsl:attribute>
											</xsl:if>
											<xsl:if test="HoraFin">
												<xsl:attribute name="HoraFin">
													<xsl:value-of select="HoraFin"/>
												</xsl:attribute>
											</xsl:if>
											<xsl:attribute name="Cantidad">
												<xsl:value-of select="Cantidad"/>
											</xsl:attribute>
											<xsl:attribute name="Porcentaje">
												<xsl:value-of select="Porcentaje"/>
											</xsl:attribute>
											<xsl:attribute name="Pago">
												<xsl:value-of select="Pago"/>
											</xsl:attribute>
										</xsl:element>
							</xsl:for-each>
						</xsl:element>
					</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/HorasExtra/Tipo='HRN'">
					<xsl:element name="HRNs">
						<xsl:for-each select="/DTE/Documentos/Nomina/Devengados/HorasExtra[Tipo='HRN']">
							
							<xsl:element name="HRN">
								<xsl:if test="HoraInicio">
									<xsl:attribute name="HoraInicio">
										<xsl:value-of select="HoraInicio"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:if test="HoraFin">
									<xsl:attribute name="HoraFin">
										<xsl:value-of select="HoraFin"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:attribute name="Cantidad">
									<xsl:value-of select="Cantidad"/>
								</xsl:attribute>
								<xsl:attribute name="Porcentaje">
									<xsl:value-of select="Porcentaje"/>
								</xsl:attribute>
								<xsl:attribute name="Pago">
									<xsl:value-of select="Pago"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/HorasExtra/Tipo='HEDDF'">
					<xsl:element name="HEDDFs">
						<xsl:for-each select="/DTE/Documentos/Nomina/Devengados/HorasExtra[Tipo='HEDDF']">
							
							<xsl:element name="HEDDF">
								<xsl:if test="HoraInicio">
									<xsl:attribute name="HoraInicio">
										<xsl:value-of select="HoraInicio"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:if test="HoraFin">
									<xsl:attribute name="HoraFin">
										<xsl:value-of select="HoraFin"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:attribute name="Cantidad">
									<xsl:value-of select="Cantidad"/>
								</xsl:attribute>
								<xsl:attribute name="Porcentaje">
									<xsl:value-of select="Porcentaje"/>
								</xsl:attribute>
								<xsl:attribute name="Pago">
									<xsl:value-of select="Pago"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/HorasExtra/Tipo='HRDDF'">
					<xsl:element name="HRDDFs">
						<xsl:for-each select="/DTE/Documentos/Nomina/Devengados/HorasExtra[Tipo='HRDDF']">
							
							<xsl:element name="HRDDF">
								<xsl:if test="HoraInicio">
									<xsl:attribute name="HoraInicio">
										<xsl:value-of select="HoraInicio"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:if test="HoraFin">
									<xsl:attribute name="HoraFin">
										<xsl:value-of select="HoraFin"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:attribute name="Cantidad">
									<xsl:value-of select="Cantidad"/>
								</xsl:attribute>
								<xsl:attribute name="Porcentaje">
									<xsl:value-of select="Porcentaje"/>
								</xsl:attribute>
								<xsl:attribute name="Pago">
									<xsl:value-of select="Pago"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/HorasExtra/Tipo='HENDF'">
					<xsl:element name="HENDFs">
						<xsl:for-each select="/DTE/Documentos/Nomina/Devengados/HorasExtra[Tipo='HENDF']">
							
							<xsl:element name="HENDF">
								<xsl:if test="HoraInicio">
									<xsl:attribute name="HoraInicio">
										<xsl:value-of select="HoraInicio"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:if test="HoraFin">
									<xsl:attribute name="HoraFin">
										<xsl:value-of select="HoraFin"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:attribute name="Cantidad">
									<xsl:value-of select="Cantidad"/>
								</xsl:attribute>
								<xsl:attribute name="Porcentaje">
									<xsl:value-of select="Porcentaje"/>
								</xsl:attribute>
								<xsl:attribute name="Pago">
									<xsl:value-of select="Pago"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/HorasExtra/Tipo='HRNDF'">
					<xsl:element name="HRNDFs">
						<xsl:for-each select="/DTE/Documentos/Nomina/Devengados/HorasExtra[Tipo='HRNDF']">
							
							<xsl:element name="HRNDF">
								<xsl:if test="HoraInicio">
									<xsl:attribute name="HoraInicio">
										<xsl:value-of select="HoraInicio"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:if test="HoraFin">
									<xsl:attribute name="HoraFin">
										<xsl:value-of select="HoraFin"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:attribute name="Cantidad">
									<xsl:value-of select="Cantidad"/>
								</xsl:attribute>
								<xsl:attribute name="Porcentaje">
									<xsl:value-of select="Porcentaje"/>
								</xsl:attribute>
								<xsl:attribute name="Pago">
									<xsl:value-of select="Pago"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
				
				<!--Vacaciones-->
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/Vacaciones != ''">
				<xsl:element name="Vacaciones">
					<xsl:for-each select="/DTE/Documentos/Nomina/Devengados/Vacaciones/VacacionesComunes">
					<xsl:element name="VacacionesComunes">
						<xsl:if test="FechaInicio">
							<xsl:attribute name="FechaInicio">
								<xsl:value-of select="FechaInicio"/>
							</xsl:attribute>
						</xsl:if>
						<xsl:if test="FechaFin">
							<xsl:attribute name="FechaFin">
								<xsl:value-of select="FechaFin"/>
							</xsl:attribute>
						</xsl:if>
						<xsl:attribute name="Cantidad">
							<xsl:value-of select="Cantidad"/>
						</xsl:attribute>
						<xsl:attribute name="Pago">
							<xsl:value-of select="Pago"/>
						</xsl:attribute>
					</xsl:element>
					</xsl:for-each>
					<xsl:for-each select="/DTE/Documentos/Nomina/Devengados/Vacaciones/VacacionesCompensadas">
						<xsl:element name="VacacionesCompensadas">
							<xsl:attribute name="Cantidad">
								<xsl:value-of select="Cantidad"/>
							</xsl:attribute>
							<xsl:attribute name="Pago">
								<xsl:value-of select="Pago"/>
							</xsl:attribute>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
				</xsl:if>
			
				<!--Primas-->
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/Primas[Pago != '']">
					<xsl:element name="Primas">
						<xsl:attribute name="Cantidad">
							<xsl:value-of select="/DTE/Documentos/Nomina/Devengados/Primas/Cantidad"/>
						</xsl:attribute>
						<xsl:attribute name="Pago">
							<xsl:value-of select="/DTE/Documentos/Nomina/Devengados/Primas/Pago"/>
						</xsl:attribute>
						<xsl:if test="/DTE/Documentos/Nomina/Devengados/Primas/PagoNS">
							<xsl:attribute name="PagoNS">
								<xsl:value-of select="/DTE/Documentos/Nomina/Devengados/Primas/PagoNS"/>
							</xsl:attribute>
						</xsl:if>
					</xsl:element>
				</xsl:if>
			
				<!--Cesantias-->
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/Cesantias != ''">
					<xsl:element name="Cesantias">
						<xsl:attribute name="Pago">
							<xsl:value-of select="/DTE/Documentos/Nomina/Devengados/Cesantias/Pago"/>
						</xsl:attribute>
						<xsl:attribute name="Porcentaje">
							<xsl:value-of select="/DTE/Documentos/Nomina/Devengados/Cesantias/Porcentaje"/>
						</xsl:attribute>
						<xsl:attribute name="PagoIntereses">
							<xsl:value-of select="/DTE/Documentos/Nomina/Devengados/Cesantias/PagoIntereses"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:if>
				
				<!--Incapacidades-->
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/Incapacidades != ''">
					<xsl:element name="Incapacidades">
						<xsl:for-each select="/DTE/Documentos/Nomina/Devengados/Incapacidades">
							
							<xsl:element name="Incapacidad">
								<xsl:if test="FechaInicio">
									<xsl:attribute name="FechaInicio">
										<xsl:value-of select="FechaInicio"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:if test="FechaFin">
									<xsl:attribute name="FechaFin">
										<xsl:value-of select="FechaFin"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:attribute name="Cantidad">
									<xsl:value-of select="Cantidad"/>
								</xsl:attribute>
								<xsl:attribute name="Tipo">
									<xsl:value-of select="Tipo"/>
								</xsl:attribute>
								<xsl:attribute name="Pago">
									<xsl:value-of select="Pago"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
			
				<!--Licencias-->
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/Licencias != ''">
					<xsl:element name="Licencias">
						<xsl:for-each select="/DTE/Documentos/Nomina/Devengados/Licencias[Tipo='LMP']">
							<xsl:element name="LicenciaMP">
								<xsl:if test="FechaInicio">
									<xsl:attribute name="FechaInicio">
										<xsl:value-of select="FechaInicio"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:if test="FechaFin">
									<xsl:attribute name="FechaFin">
										<xsl:value-of select="FechaFin"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:attribute name="Cantidad">
									<xsl:value-of select="Cantidad"/>
								</xsl:attribute>
								<xsl:attribute name="Pago">
									<xsl:value-of select="Pago"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:for-each>
						<xsl:for-each select="/DTE/Documentos/Nomina/Devengados/Licencias[Tipo='LR']">
							<xsl:element name="LicenciaR">
								<xsl:if test="FechaInicio">
									<xsl:attribute name="FechaInicio">
										<xsl:value-of select="FechaInicio"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:if test="FechaFin">
									<xsl:attribute name="FechaFin">
										<xsl:value-of select="FechaFin"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:attribute name="Cantidad">
									<xsl:value-of select="Cantidad"/>
								</xsl:attribute>
								<xsl:attribute name="Pago">
									<xsl:value-of select="Pago"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:for-each>
						<xsl:for-each select="/DTE/Documentos/Nomina/Devengados/Licencias[Tipo='LNR']">
							<xsl:element name="LicenciaNR">
								<xsl:if test="FechaInicio">
									<xsl:attribute name="FechaInicio">
										<xsl:value-of select="FechaInicio"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:if test="FechaFin">
									<xsl:attribute name="FechaFin">
										<xsl:value-of select="FechaFin"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:attribute name="Cantidad">
									<xsl:value-of select="Cantidad"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
				
				<!--Bonificaciones-->
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/Bonificaciones != ''">
					<xsl:element name="Bonificaciones">
						<xsl:for-each select="/DTE/Documentos/Nomina/Devengados/Bonificaciones">
							<xsl:element name="Bonificacion">
								<xsl:if test="Pago">
									<xsl:attribute name="BonificacionS">
										<xsl:value-of select="Pago"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:if test="PagoNoSalarial">
									<xsl:attribute name="BonificacionNS">
										<xsl:value-of select="PagoNoSalarial"/>
									</xsl:attribute>
								</xsl:if>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
				
				<!--Auxilios-->
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/Auxilios != ''">
					<xsl:element name="Auxilios">
						<xsl:for-each select="/DTE/Documentos/Nomina/Devengados/Auxilios">
							<xsl:element name="Auxilio">
								<xsl:if test="Pago">
									<xsl:attribute name="AuxilioS">
										<xsl:value-of select="Pago"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:if test="PagoNoSalarial">
									<xsl:attribute name="AuxilioNS">
										<xsl:value-of select="PagoNoSalarial"/>
									</xsl:attribute>
								</xsl:if>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
				
				
				<!--Huelgas Legales-->
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/HuelgaLegal != ''">
					<xsl:element name="HuelgasLegales">
						<xsl:for-each select="/DTE/Documentos/Nomina/Devengados/HuelgaLegal">
							<xsl:element name="HuelgaLegal">
								<xsl:if test="FechaInicio">
									<xsl:attribute name="FechaInicio">
										<xsl:value-of select="FechaInicio"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:if test="FechaFin">
									<xsl:attribute name="FechaFin">
										<xsl:value-of select="FechaFin"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:attribute name="Cantidad">
									<xsl:value-of select="Cantidad"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
				
				<!--OtrosConceptos-->
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/OtrosConceptos != ''">
					<xsl:element name="OtrosConceptos">
						<xsl:for-each select="/DTE/Documentos/Nomina/Devengados/OtrosConceptos">
							<xsl:element name="OtroConcepto">
								<xsl:attribute name="DescripcionConcepto">
									<xsl:value-of select="OtrosConceptos"/>
								</xsl:attribute>
								<xsl:if test="Pago">
									<xsl:attribute name="ConceptoS">
										<xsl:value-of select="Pago"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:if test="PagoNoSalarial">
									<xsl:attribute name="ConceptoNS">
										<xsl:value-of select="PagoNoSalarial"/>
									</xsl:attribute>
								</xsl:if>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
								
				<!--Compensaciones-->
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/Compensaciones != ''">
					<xsl:element name="Compensaciones">
						<xsl:for-each select="/DTE/Documentos/Nomina/Devengados/Compensaciones">
							<xsl:element name="Compensacion">
								<xsl:attribute name="CompensacionO">
										<xsl:value-of select="Pago"/>
								</xsl:attribute>
								<xsl:attribute name="CompensacionE">
									<xsl:value-of select="PagoExtraordinario"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
				
				<!--Utilizado para Todos los Elementos de Bonos Electronicos o de Papel de Servicio, Cheques, Tarjetas, Vales, etc de Devengos del Documento-->
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/Bono != ''">
					<xsl:element name="BonoEPCTVs">
						<xsl:for-each select="/DTE/Documentos/Nomina/Devengados/Bono">
							<xsl:element name="BonoEPCTV">
								<xsl:if test="PagoS">
									<xsl:attribute name="PagoS">
										<xsl:value-of select="PagoS"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:if test="PagoNS">
									<xsl:attribute name="PagoNS">
										<xsl:value-of select="PagoNS"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:if test="PagoAlimentacionS">
									<xsl:attribute name="PagoAlimentacionS">
										<xsl:value-of select="PagoAlimentacionS"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:if test="PagoAlimentacionNS">
									<xsl:attribute name="PagoAlimentacionNS">
										<xsl:value-of select="PagoAlimentacionNS"/>
									</xsl:attribute>
								</xsl:if>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
				
				<!--Comisiones-->
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/Comisiones != ''">
					<xsl:element name="Comisiones">
						<xsl:for-each select="/DTE/Documentos/Nomina/Devengados/Comisiones">
							<xsl:element name="Comision">
									<xsl:value-of select="."/>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
				
				<!--Valor Pagado por Pago Tercero-->
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/PagosTerceros != ''">
					<xsl:element name="PagosTerceros">
						<xsl:for-each select="/DTE/Documentos/Nomina/Devengados/PagosTerceros">
							<xsl:element name="PagoTercero">
								<xsl:value-of select="."/>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
				
				<!--Valor Pagado por Anticios-->
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/Anticipos != ''">
					<xsl:element name="Anticipos">
						<xsl:for-each select="/DTE/Documentos/Nomina/Devengados/Anticipos">
							<xsl:element name="Anticipo">
								<xsl:value-of select="."/>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
				
				
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/Dotacion != ''">
					<xsl:element name="Dotacion">
						<xsl:value-of select="/DTE/Documentos/Nomina/Devengados/Dotacion"/>
					</xsl:element>
				</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/ApoyoSost != ''">
					<xsl:element name="ApoyoSost">
						<xsl:value-of select="/DTE/Documentos/Nomina/Devengados/ApoyoSost"/>
					</xsl:element>
				</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/Teletrabajo != ''">
					<xsl:element name="Teletrabajo">
						<xsl:value-of select="/DTE/Documentos/Nomina/Devengados/Teletrabajo"/>
					</xsl:element>
				</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/BonifRetiro != ''">
					<xsl:element name="BonifRetiro">
						<xsl:value-of select="/DTE/Documentos/Nomina/Devengados/BonifRetiro"/>
					</xsl:element>
				</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/Indemnizacion != ''">
					<xsl:element name="Indemnizacion">
						<xsl:value-of select="/DTE/Documentos/Nomina/Devengados/Indemnizacion"/>
					</xsl:element>
				</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/Devengados/Reintegro != ''">
					<xsl:element name="Reintegro">
						<xsl:value-of select="/DTE/Documentos/Nomina/Devengados/Reintegro"/>
					</xsl:element>
				</xsl:if>
			</xsl:element>
			
			<!--Informacion de Todas las Deducciones del Documento-->
					<xsl:element name="Deducciones">
				<xsl:element name="Salud">
					<xsl:attribute name="Porcentaje">
						<xsl:value-of select="/DTE/Documentos/Nomina/Deducciones/Salud/Porcentaje"/>
					</xsl:attribute>
					<xsl:attribute name="Deduccion">
						<xsl:value-of select="/DTE/Documentos/Nomina/Deducciones/Salud/Deduccion"/>
					</xsl:attribute>
				</xsl:element>
				<xsl:element name="FondoPension">
					<xsl:attribute name="Porcentaje">
						<xsl:value-of select="/DTE/Documentos/Nomina/Deducciones/FondoPension/Porcentaje"/>
					</xsl:attribute>
					<xsl:attribute name="Deduccion">
						<xsl:value-of select="/DTE/Documentos/Nomina/Deducciones/FondoPension/Deduccion"/>
					</xsl:attribute>
				</xsl:element>
				
				<xsl:if test="(/DTE/Documentos/Nomina/Deducciones/FondoSP[Porcentaje!= ''] or /DTE/Documentos/Nomina/Deducciones/FondoSP[Deduccion!= ''] or /DTE/Documentos/Nomina/Deducciones/FondoSP[PorcentajeSub!= ''] or /DTE/Documentos/Nomina/Deducciones/FondoSP[DeduccionSub!= ''])">
				<xsl:element name="FondoSP">
					<xsl:if test="/DTE/Documentos/Nomina/Deducciones/FondoSP/Porcentaje!= ''">
						<xsl:attribute name="Porcentaje">
							<xsl:value-of select="/DTE/Documentos/Nomina/Deducciones/FondoSP/Porcentaje"/>
						</xsl:attribute>
					</xsl:if>
					<xsl:if test="/DTE/Documentos/Nomina/Deducciones/FondoSP/Deduccion!= ''">
						<xsl:attribute name="Deduccion">
							<xsl:value-of select="/DTE/Documentos/Nomina/Deducciones/FondoSP/Deduccion"/>
						</xsl:attribute>
					</xsl:if>
					<xsl:if test="/DTE/Documentos/Nomina/Deducciones/FondoSP/PorcentajeSub!= ''">
						<xsl:attribute name="PorcentajeSub">
							<xsl:value-of select="/DTE/Documentos/Nomina/Deducciones/FondoSP/PorcentajeSub"/>
						</xsl:attribute>
					</xsl:if>
					<xsl:if test="/DTE/Documentos/Nomina/Deducciones/FondoSP/DeduccionSub!= ''">
						<xsl:attribute name="DeduccionSub">
							<xsl:value-of select="/DTE/Documentos/Nomina/Deducciones/FondoSP/DeduccionSub"/>
						</xsl:attribute>
					</xsl:if>
				</xsl:element>
				</xsl:if>
				
				<!--Sindicatos-->
				<xsl:if test="/DTE/Documentos/Nomina/Deducciones/Sindicato[Deduccion != '']">
					<xsl:element name="Sindicatos">
						<xsl:for-each select="/DTE/Documentos/Nomina/Deducciones/Sindicato">
							<xsl:element name="Sindicato">
								<xsl:attribute name="Porcentaje">
									<xsl:value-of select="Porcentaje"/>
								</xsl:attribute>
								<xsl:attribute name="Deduccion">
									<xsl:value-of select="Deduccion"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
				
				<!--Sanciones-->
				<xsl:if test="/DTE/Documentos/Nomina/Deducciones/Sanciones[SancionPublic != ''] or /DTE/Documentos/Nomina/Deducciones/Sanciones[SancionPriv != '']">
					<xsl:element name="Sanciones">
						<xsl:for-each select="/DTE/Documentos/Nomina/Deducciones/Sanciones">
							<xsl:element name="Sancion">
								<xsl:attribute name="SancionPublic">
									<xsl:value-of select="SancionPublic"/>
								</xsl:attribute>
								<xsl:attribute name="SancionPriv">
									<xsl:value-of select="SancionPriv"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
				
				<!--Libranza-->
				<xsl:if test="/DTE/Documentos/Nomina/Deducciones/Libranza[Deduccion != '']">
					<xsl:element name="Libranzas">
						<xsl:for-each select="/DTE/Documentos/Nomina/Deducciones/Libranza">
							<xsl:element name="Libranza">
								<xsl:attribute name="Descripcion">
									<xsl:value-of select="Descripcion"/>
								</xsl:attribute>
								<xsl:attribute name="Deduccion">
									<xsl:value-of select="Deduccion"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
				
				<!--Valor Pagado por Pago Tercero-->
				<xsl:if test="/DTE/Documentos/Nomina/Deducciones/PagosTerceros != ''">
					<xsl:element name="PagosTerceros">
						<xsl:for-each select="/DTE/Documentos/Nomina/Deducciones/PagosTerceros">
							<xsl:element name="PagoTercero">
								<xsl:value-of select="."/>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
				
				<!--Valor Pagado por Anticios-->
				<xsl:if test="/DTE/Documentos/Nomina/Deducciones/Anticipos != ''">
					<xsl:element name="Anticipos">
						<xsl:for-each select="/DTE/Documentos/Nomina/Deducciones/Anticipos">
							<xsl:element name="Anticipo">
								<xsl:value-of select="."/>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
				
				<!--Valor Pagado por OtrasDeducciones-->
				<xsl:if test="/DTE/Documentos/Nomina/Deducciones/OtrasDeducciones != ''">
					<xsl:element name="OtrasDeducciones">
						<xsl:for-each select="/DTE/Documentos/Nomina/Deducciones/OtrasDeducciones">
							<xsl:element name="OtraDeduccion">
								<xsl:value-of select="."/>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
				
				<xsl:if test="/DTE/Documentos/Nomina/Deducciones/PensionVoluntaria != ''">
					<xsl:element name="PensionVoluntaria">
						<xsl:value-of select="/DTE/Documentos/Nomina/Deducciones/PensionVoluntaria"/>
					</xsl:element>
				</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/Deducciones/RetencionFuente != ''">
					<xsl:element name="RetencionFuente">
						<xsl:value-of select="/DTE/Documentos/Nomina/Deducciones/RetencionFuente"/>
					</xsl:element>
				</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/Deducciones/AFC != ''">
					<xsl:element name="AFC">
						<xsl:value-of select="/DTE/Documentos/Nomina/Deducciones/AFC"/>
					</xsl:element>
				</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/Deducciones/Cooperativa != ''">
					<xsl:element name="Cooperativa">
						<xsl:value-of select="/DTE/Documentos/Nomina/Deducciones/Cooperativa"/>
					</xsl:element>
				</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/Deducciones/EmbargoFiscal != ''">
					<xsl:element name="EmbargoFiscal">
						<xsl:value-of select="/DTE/Documentos/Nomina/Deducciones/EmbargoFiscal"/>
					</xsl:element>
				</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/Deducciones/PlanComplement != ''">
					<xsl:element name="PlanComplementarios">
						<xsl:value-of select="/DTE/Documentos/Nomina/Deducciones/PlanComplement"/>
					</xsl:element>
				</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/Deducciones/Educacion != ''">
					<xsl:element name="Educacion">
						<xsl:value-of select="/DTE/Documentos/Nomina/Deducciones/Educacion"/>
					</xsl:element>
				</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/Deducciones/Reintegro != ''">
					<xsl:element name="Reintegro">
						<xsl:value-of select="/DTE/Documentos/Nomina/Deducciones/Reintegro"/>
					</xsl:element>
				</xsl:if>
				<xsl:if test="/DTE/Documentos/Nomina/Deducciones/Deuda != ''">
					<xsl:element name="Deuda">
						<xsl:value-of select="/DTE/Documentos/Nomina/Deducciones/Deuda"/>
					</xsl:element>
				</xsl:if>
			</xsl:element>
			
			<!--Totales de documento Nomina-->
			<xsl:if test="/DTE/Documentos/Nomina/Pagos/Redondeo != ''">
				<xsl:element name="Redondeo">
					<xsl:value-of select="/DTE/Documentos/Nomina/Pagos/Redondeo"/>
				</xsl:element>
			</xsl:if>
			<xsl:element name="DevengadosTotal">
				<xsl:value-of select="/DTE/Documentos/Nomina/Pagos/Devengados"/>
			</xsl:element>
			<xsl:element name="DeduccionesTotal">
				<xsl:value-of select="/DTE/Documentos/Nomina/Pagos/Deducciones"/>
			</xsl:element>
			<xsl:element name="ComprobanteTotal">
				<xsl:value-of select="/DTE/Documentos/Nomina/Pagos/VlrPagar"/>
			</xsl:element>
				</xsl:element>
			</xsl:if>
			
			
			<!--Informacion Utilizado para Atributos de Documento Predecesor a Eliminar-->
			<xsl:if test="/DTE/Documentos/Nomina/Resumen/Novedad/TipoNota= '2'">
				<xsl:element name="Eliminar">
					
					<!--Utilizado para Atributos de Documento Predecesor a Reemplazar-->
					<xsl:element name="EliminandoPredecesor">
						<xsl:attribute name="NumeroPred">
							<xsl:value-of select="/DTE/Documentos/Nomina/Resumen/Novedad/Numero"/>
						</xsl:attribute>
						<xsl:attribute name="CUNEPred">
							<xsl:value-of select="/DTE/Documentos/Nomina/Resumen/Novedad/CUNE"/>
						</xsl:attribute>
						<xsl:attribute name="FechaGenPred">
							<xsl:value-of select="substring(/DTE/Documentos/Nomina/Resumen/Novedad/Fecha,1,10)"/>
						</xsl:attribute>
					</xsl:element>
			
					<!-- ID del documento-->
					<xsl:element name="NumeroSecuenciaXML">
						<xsl:if test="/DTE/Documentos/Nomina/NominaReceptor/CodigoTrabajador">
							<xsl:attribute name="CodigoTrabajador">
								<xsl:value-of select="/DTE/Documentos/Nomina/NominaReceptor/CodigoTrabajador"/>
							</xsl:attribute>					
						</xsl:if>
						<xsl:if test="/DTE/Documentos/Nomina/Resumen/Serie">
							<xsl:attribute name="Prefijo">
								<xsl:value-of select="/DTE/Documentos/Nomina/Resumen/Serie"/>
							</xsl:attribute>					
						</xsl:if>				
						<xsl:attribute name="Consecutivo">
							<xsl:value-of select="/DTE/Documentos/Nomina/Resumen/Numero"/>
						</xsl:attribute>
						<xsl:attribute name="Numero">
							<xsl:value-of select="concat(/DTE/Documentos/Nomina/Resumen/Serie,/DTE/Documentos/Nomina/Resumen/Numero)"/>
						</xsl:attribute>
					</xsl:element>
					
			
					<xsl:element name="LugarGeneracionXML">
						<xsl:attribute name="Pais">
							<xsl:value-of select="/DTE/Documentos/Nomina/NominaEmisor/LugarExped/Pais"/>
						</xsl:attribute>
						<xsl:attribute name="DepartamentoEstado">
							<xsl:value-of select="/DTE/Documentos/Nomina/NominaEmisor/LugarExped/Departamento"/>
						</xsl:attribute>
						<xsl:attribute name="MunicipioCiudad">
							<xsl:value-of select="/DTE/Documentos/Nomina/NominaEmisor/LugarExped/Ciudad"/>
						</xsl:attribute>
						<xsl:attribute name="Idioma">
							<xsl:text>es</xsl:text>
						</xsl:attribute>
					</xsl:element>
					
					<!--Proveedor Tecnologico -->
					<xsl:element name="ProveedorXML">
						<xsl:attribute name="RazonSocial">
							<xsl:text>SIGNATURE SOUTH CONSULTING COLOMBIA SAS</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="NIT">
							<xsl:text>900508908</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="DV">
							<xsl:text>9</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="SoftwareID">
							<xsl:value-of select="$CodigoSoftware"/>
						</xsl:attribute>
						<xsl:attribute name="SoftwareSC">
							<xsl:choose>
								<xsl:when test="/DTE/Documentos/Nomina/Resumen/Ambiente = 2">
									<!-- Si es ambiente de pruebas -->
									<xsl:variable name="CodigoSeguridad">
										<xsl:value-of select="concat($CodigoSoftware, '20191', /DTE/Documentos/Nomina/Resumen/Serie, /DTE/Documentos/Nomina/Resumen/Numero)" />
									</xsl:variable>
									<xsl:value-of select="$CodigoSeguridad"/>
								</xsl:when>
								<xsl:otherwise>
									<!-- Si es ambiente de producción -->
									<xsl:variable name="CodigoSeguridad">
										<xsl:value-of select="concat($CodigoSoftware, '20191', /DTE/Documentos/Nomina/Resumen/Serie, /DTE/Documentos/Nomina/Resumen/Numero)" />
									</xsl:variable>
									<xsl:value-of select="$CodigoSeguridad"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</xsl:element>
					
					<!--QRcode-->
					<xsl:element name="CodigoQR">
						<xsl:choose>
							<xsl:when test="/DTE/Documentos/Nomina/Resumen/Ambiente = 2">
								<xsl:value-of select="concat('https://catalogo-vpfe-hab.dian.gov.co/document/searchqr?documentkey=',$CUFE)"/>
							</xsl:when>
							<xsl:when test="/DTE/Documentos/Nomina/Resumen/Ambiente = 1">
								<xsl:value-of select="concat('https://catalogo-vpfe.dian.gov.co/document/searchqr?documentkey=',$CUFE)"/>
							</xsl:when>					
						</xsl:choose>
					</xsl:element>
					
					
					<!--Informacion General del DTE-->
					
					<xsl:element name="InformacionGeneral">			
						<xsl:attribute name="Version">
							<xsl:text>V1.0: Nota de Ajuste de Documento Soporte de Pago de Nómina Electrónica</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="Ambiente">
							<xsl:value-of select="/DTE/Documentos/Nomina/Resumen/Ambiente"/>
						</xsl:attribute>
						<xsl:attribute name="TipoXML">
							<xsl:value-of select="/DTE/Documentos/Nomina/Resumen/TipoNomina"/>
						</xsl:attribute>
						<xsl:attribute name="CUNE">
							<xsl:value-of select="$CUFE"/>
						</xsl:attribute>
						<xsl:attribute name="EncripCUNE">
							<xsl:value-of select="'CUNE-SHA384'"/>
						</xsl:attribute>
						<xsl:attribute name="FechaGen">
							<xsl:value-of select="substring(/DTE/Documentos/Nomina/Resumen/FechaEmis, 1, 10)"/>
						</xsl:attribute>
						<xsl:attribute name="HoraGen">
							<xsl:value-of select="concat(substring(/DTE/Documentos/Nomina/Resumen/FechaEmis, 12, 8), '-05:00')"/>
						</xsl:attribute>
					</xsl:element>
					
					<!--Notas adicionales del documento-->
					<xsl:for-each select="/DTE/Documentos/Nomina/Resumen/Notas">
						<xsl:element name="Notas">
							<xsl:value-of select="."/>
						</xsl:element>
					</xsl:for-each>
					
					<!--Informacion del Empleador-->
					<xsl:element name="Empleador">			
						<xsl:attribute name="RazonSocial">
							<xsl:value-of select="/DTE/Documentos/Nomina/NominaEmisor/NmbEmisor"/>
						</xsl:attribute>
						<xsl:attribute name="NIT">
							<xsl:value-of select="/DTE/Documentos/Nomina/NominaEmisor/IDEmisor"/>
						</xsl:attribute>
						<xsl:attribute name="DV">
							<xsl:call-template name="calculNIT-dv">
								<xsl:with-param name="NIT"
									select="normalize-space(/DTE/Documentos/Nomina/NominaEmisor/IDEmisor)"/>
							</xsl:call-template>
						</xsl:attribute>
						<xsl:attribute name="Pais">
							<xsl:value-of select="/DTE/Documentos/Nomina/NominaEmisor/DomFiscal/Pais"/>
						</xsl:attribute>
						<xsl:attribute name="DepartamentoEstado">
							<xsl:value-of select="/DTE/Documentos/Nomina/NominaEmisor/DomFiscal/Departamento"/>
						</xsl:attribute>
						<xsl:attribute name="MunicipioCiudad">
							<xsl:value-of select="/DTE/Documentos/Nomina/NominaEmisor/DomFiscal/Ciudad"/>
						</xsl:attribute>
						<xsl:attribute name="Direccion">
							<xsl:value-of select="/DTE/Documentos/Nomina/NominaEmisor/DomFiscal/Calle"/>
						</xsl:attribute>
					</xsl:element>
					
				</xsl:element>
			</xsl:if>
			
			
			<xsl:element name="Personalizados">
				<xsl:element name="DocPersonalizado">
					<xsl:attribute name="dteID">
						<xsl:value-of select="/DTE/Personalizados/DocPersonalizado/@dteID"/>
					</xsl:attribute>
					<xsl:element name="campoString">
						<xsl:attribute name="name">
							<xsl:text>QRCode</xsl:text>
						</xsl:attribute>
						<xsl:variable name="CUFE">
							
							<!--<xsl:value-of select="crypto:hash($CUFE, 'SHA-384')"/>-->
							<xsl:value-of select="$CUFE"/>
						</xsl:variable>
						<xsl:value-of select="concat('NumNIE:=',concat(/DTE/Documentos/Nomina/Resumen/Serie, /DTE/Documentos/Nomina/Resumen/Numero))"/>
						<xsl:text>
								</xsl:text>
						<xsl:value-of select="concat('FecNIE:',substring(/DTE/Documentos/Nomina/Resumen/FechaEmis, 1, 10))"/>
						<xsl:text>
								</xsl:text>
						<xsl:value-of select="concat('HorNIE:',substring(/DTE/Documentos/Nomina/Resumen/FechaEmis, 12, 8),'-05:00')"/>
						<xsl:text>
								</xsl:text>
						<xsl:value-of select="concat('NitNIE:',normalize-space(/DTE/Documentos/Nomina/NominaEmisor/IDEmisor))"/>
						<xsl:text>
								</xsl:text>
						<xsl:value-of select="concat('DocEmp:',normalize-space(/DTE/Documentos/Nomina/NominaReceptor/DocRecep/NroDocRecep))"/>
						<xsl:text>
								</xsl:text>
						<xsl:value-of select="concat('ValDev:',format-number(/DTE/Documentos/Nomina/Pagos/Devengados,'#0.00'))"/>
						<xsl:text>
								</xsl:text>
						<xsl:value-of select="concat('ValDed:',format-number(/DTE/Documentos/Nomina/Pagos/Deducciones,'#0.00'))"/>
						<xsl:text>
								</xsl:text>
						<xsl:value-of select="concat('ValTol:',format-number(/DTE/Documentos/Nomina/Pagos/VlrPagar,'#0.00'))"/>
						<xsl:text>
								</xsl:text>
						<xsl:value-of select="concat('CUFE:',$CUFE)"/>
						<xsl:text>
								</xsl:text>
						<xsl:choose>
							<xsl:when test="/DTE/Documentos/Nomina/Resumen/Ambiente = 2">
								<xsl:value-of select="concat('https://catalogo-vpfe-hab.dian.gov.co/document/searchqr?documentkey=',$CUFE)"/>
							</xsl:when>
							<xsl:when test="/DTE/Documentos/Nomina/Resumen/Ambiente = 2">
								<xsl:value-of select="concat('https://catalogo-vpfe.dian.gov.co/document/searchqr?documentkey=',$CUFE)"/>
							</xsl:when>					
						</xsl:choose>
					</xsl:element>
					<xsl:element name="campoString">
						<xsl:attribute name="name">
							<xsl:text>SERIE</xsl:text>
						</xsl:attribute>
						<xsl:value-of select="/DTE/Documentos/Nomina/Resumen/Serie"/>
					</xsl:element>
					<xsl:element name="campoString">
						<xsl:attribute name="name">
							<xsl:text>FOLIO</xsl:text>
						</xsl:attribute>
						<xsl:value-of select="/DTE/Documentos/Nomina/Resumen/Numero"/>
					</xsl:element>
					<xsl:element name="campoString">
						<xsl:attribute name="name">
							<xsl:text>FechaGeneracion</xsl:text>
						</xsl:attribute>
						<xsl:value-of select="substring(string(current-dateTime()), 1, 10)"/>
					</xsl:element>
					<xsl:element name="campoString">
						<xsl:attribute name="name">
							<xsl:text>HoraGeneracion</xsl:text>
						</xsl:attribute>
						<xsl:value-of select="substring(string(current-dateTime()), 12, 8)"/>
					</xsl:element>					
					<xsl:copy-of select="/DTE/Personalizados/DocPersonalizado/*"/>
					<xsl:for-each select="/DTE/Documento/Referencia[TpoDocRef = '90']">
						<xsl:element name="ImpresionReferencia">
							<xsl:element name="PersonNroLinRef">
								<xsl:value-of select="NroLinRef"/>
							</xsl:element>
							<xsl:element name="ECB02">
								<xsl:value-of select="ECB02"/>
							</xsl:element>
							<xsl:element name="ECB03">
								<xsl:value-of select="ECB03"/>
							</xsl:element>
							<xsl:element name="ECB04">
								<xsl:value-of select="ECB04"/>
							</xsl:element>
							<xsl:element name="ECB05">
								<xsl:value-of select="ECB05"/>
							</xsl:element>
							<xsl:element name="ECB06">
								<xsl:value-of select="ECB06"/>
							</xsl:element>
							<xsl:element name="ECB07">
								<xsl:value-of select="ECB07"/>
							</xsl:element>
							<xsl:element name="ECB08">
								<xsl:value-of select="ECB08"/>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:element>			
		</NominaIndividualDeAjuste>
	</xsl:template>
	<xsl:template name="RESPONSE">
		<!--RESPONSE-->
		<ApplicationResponse xmlns="urn:oasis:names:specification:ubl:schema:xsd:ApplicationResponse-2"
			xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
			xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
			xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
			xmlns:sts="dian:gov:co:facturaelectronica:Structures-2-1"
			xmlns:xades="http://uri.etsi.org/01903/v1.3.2#"
			xmlns:xades141="http://uri.etsi.org/01903/v1.4.1#">
			<!--xsi:schemaLocation="urn:oasis:names:specification:ubl:schema:xsd:ApplicationResponse-2 
			http://docs.oasis-open.org/ubl/os-UBL-2.1/xsd/maindoc/UBL-ApplicationResponse-2.1.xsd"-->
		<xsl:variable name="CUFEString">
				<xsl:value-of
					select="
					concat(/Response/Encabezado/NumeroInterno, substring(/Response/Encabezado/FechaEmis, 1, 10), if (string-length(substring-after(/Response/Encabezado/FechaEmis, 'T')) != 9) then
					substring-after(/Response/Encabezado/FechaEmis, 'T')
					else
					concat(substring(/Response/Encabezado/FechaEmis, 12, 8), '-05:00'), /Response/Encabezado/Emisor/IDEmisor, /Response/Encabezado/Receptor/IDReceptor, /Response/DetalleDocAnulado/CodigoResponse, /Response/DetalleDocAnulado/Serie, /Response/DetalleDocAnulado/Numero, /Response/DetalleDocAnulado/TipoDoc, /Response/Encabezado/Area/IdArea, /Response/Encabezado/Area/IdRevision)"/>
			</xsl:variable>
			<xsl:variable name="CodigoSoftware">
				<xsl:choose>
					<xsl:when test="/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo'">
						<xsl:text>fa326ca7-c1f8-40d3-a6fc-24d7c1040607</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>56f2ae4e-9812-4fad-9255-08fcfcd5ccb0</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<!--Ambiente de destino-->
			<xsl:variable name="Ambiente">
				<xsl:value-of select="/Response/Encabezado/Ambiente"/>
			</xsl:variable>
			<!--SECCION DE EXTENSIONES-->
			<!--EXTENSIONES DEFINIDAS POR DIAN-->
			<xsl:element name="ext:UBLExtensions">
				<xsl:element name="ext:UBLExtension">
					<xsl:element name="ext:ExtensionContent">
						<sts:DianExtensions>
							<xsl:element name="sts:InvoiceSource">
								<xsl:element name="cbc:IdentificationCode">
									<xsl:attribute name="listAgencyID">
										<xsl:text>6</xsl:text>
									</xsl:attribute>
									<xsl:attribute name="listAgencyName">
										<xsl:text>United Nations Economic Commission for Europe</xsl:text>
									</xsl:attribute>
									<xsl:attribute name="listSchemeURI">
										<xsl:text>urn:oasis:names:specification:ubl:codelist:gc:CountryIdentificationCode-2.1</xsl:text>
									</xsl:attribute>
									<xsl:text>CO</xsl:text>
								</xsl:element>
							</xsl:element>
							<xsl:element name="sts:SoftwareProvider">
								<xsl:element name="sts:ProviderID">
									<xsl:attribute name="schemeID">
										<xsl:choose>
											<xsl:when test="/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo'">
												<xsl:call-template name="calculNIT-dv">
													<xsl:with-param name="NIT">
														<xsl:text>800197268</xsl:text>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="calculNIT-dv">
													<xsl:with-param name="NIT">
														<xsl:text>900508908</xsl:text>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
									<xsl:attribute name="schemeName">
										<xsl:text>31</xsl:text>
									</xsl:attribute>
									<xsl:attribute name="schemeAgencyID">
										<xsl:text>195</xsl:text>
									</xsl:attribute>
									<xsl:attribute name="schemeAgencyName">
										<xsl:text>CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)</xsl:text>
									</xsl:attribute>
									<xsl:choose>
										<xsl:when test="/DTE/Personalizados/DocPersonalizado/campoString[@name = 'EmittedFrom'] = 'IoFacturo'">
											<!-- NIT DIAN como proveedor tecnologico (Facturador Gratuito) -->
											<xsl:text>800197268</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<!-- NIT Gosocket como proveedor tecnologico (Todos los productos) -->
											<xsl:text>900508908</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:element>
								<xsl:element name="sts:SoftwareID">
									<xsl:attribute name="schemeAgencyID">
										<xsl:text>195</xsl:text>
									</xsl:attribute>
									<xsl:attribute name="schemeAgencyName">
										<xsl:text>CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)</xsl:text>
									</xsl:attribute>
									<xsl:choose>
										<xsl:when
											test="/DTE/Documento/Encabezado/IdDoc/Area/IdArea != ''">
											<xsl:value-of
												select="/DTE/Documento/Encabezado/IdDoc/Area/IdArea"
											/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="$CodigoSoftware"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:element>
							</xsl:element>
							<xsl:element name="sts:SoftwareSecurityCode">
								<xsl:attribute name="schemeAgencyID">
									<xsl:text>195</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="schemeAgencyName">
									<xsl:text>CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)</xsl:text>
								</xsl:attribute>
								<xsl:choose>
									<!-- Test si existe Codigo Software y Pin software en DTE. -->
									<xsl:when test="/DTE/Documento/Encabezado/IdDoc/Area/IdArea != '' and /DTE/Documento/Encabezado/IdDoc/Area/IdRevision != ''">
										<!-- Clave seguridad del software en caso de tener la informacion en DTE. -->
										<xsl:variable name="CodigoSeguridad">
											<xsl:value-of select="concat(/DTE/Documento/Encabezado/IdDoc/Area/IdArea, /DTE/Documento/Encabezado/IdDoc/Area/IdRevision, /DTE/Documento/Encabezado/IdDoc/Serie, /DTE/Documento/Encabezado/IdDoc/Numero)" />
										</xsl:variable>
										<xsl:value-of select="$CodigoSeguridad" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:choose>
											<xsl:when test="/DTE/Documento/Encabezado/IdDoc/Ambiente = 2">
												<!-- Si es ambiente de pruebas -->
												<xsl:variable name="CodigoSeguridad">
													<xsl:value-of select="concat($CodigoSoftware, '20191', /DTE/Documento/Encabezado/IdDoc/Serie, /DTE/Documento/Encabezado/IdDoc/Numero)" />
												</xsl:variable>
												<xsl:value-of select="$CodigoSeguridad"/>
											</xsl:when>
											<xsl:otherwise>
												<!-- Si es ambiente de producción -->
												<xsl:variable name="CodigoSeguridad">
													<xsl:value-of select="concat($CodigoSoftware, '20191', /DTE/Documento/Encabezado/IdDoc/Serie, /DTE/Documento/Encabezado/IdDoc/Numero)" />
												</xsl:variable>
												<xsl:value-of select="$CodigoSeguridad"/>
												<!--<xsl:value-of
												select="crypto:hash($CodigoSeguridad, 'SHA-384')"
												/>-->
											</xsl:otherwise>
										</xsl:choose>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:element>
							<xsl:element name="sts:AuthorizationProvider">
								<xsl:element name="sts:AuthorizationProviderID">
									<xsl:attribute name="schemeID">
										<xsl:call-template name="calculNIT-dv">
											<xsl:with-param name="NIT">
												<xsl:text>800197268</xsl:text>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:attribute>
									<xsl:attribute name="schemeName">
										<xsl:text>31</xsl:text>
									</xsl:attribute>
									<xsl:attribute name="schemeAgencyID">
										<xsl:text>195</xsl:text>
									</xsl:attribute>
									<xsl:attribute name="schemeAgencyName">
										<xsl:text>CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)</xsl:text>
									</xsl:attribute>
									<xsl:text>800197268</xsl:text>
								</xsl:element>
							</xsl:element>
						</sts:DianExtensions>
					</xsl:element>
				</xsl:element>
				<!-- Lugar donde va la firma digital -->
				<!--<xsl:element name="ext:UBLExtension">
					<xsl:element name="ext:ExtensionContent"/>
				</xsl:element>-->
			</xsl:element>
			<!--VersionUBL-->
			<xsl:element name="cbc:UBLVersionID">
				<xsl:text>UBL 2.1</xsl:text>
			</xsl:element>
			<!--Customization ID-->
			<xsl:element name="cbc:CustomizationID">
				<xsl:choose>
					<xsl:when
						test="not(/Response/Encabezado/TipoServicio) or /Response/Encabezado/TipoServicio = ''">
						<xsl:text>10</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="/Response/Encabezado/TipoServicio"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<!--VersionProfile-->
			<xsl:element name="cbc:ProfileID">
				<xsl:text>DIAN 2.1</xsl:text>
			</xsl:element>
			<xsl:element name="cbc:ProfileExecutionID">
				<xsl:value-of select="$Ambiente"/>
			</xsl:element>
			<!--Number of the Application Response-->
			<xsl:element name="cbc:ID">
				<xsl:value-of select="/Response/Encabezado/NumeroInterno"/>
			</xsl:element>
			<!--CUFE of the Application Response-->
			<xsl:element name="cbc:UUID">
				<xsl:attribute name="schemeID">
					<xsl:value-of select="$Ambiente"/>
				</xsl:attribute>
				<xsl:attribute name="schemeName">
					<xsl:text>CUDE-SHA384</xsl:text>
				</xsl:attribute>
				<xsl:variable name="CUFE">
					<xsl:value-of select="$CUFEString"/>
					<!--<xsl:value-of select="crypto:hash($CUFEString, 'SHA-384')"/>-->
				</xsl:variable>
				<xsl:value-of select="$CUFE"/>
			</xsl:element>
			<xsl:element name="cbc:IssueDate">
				<xsl:value-of select="substring(string(current-dateTime()), 1, 10)"/>
			</xsl:element>
			<!--Issuing Time of the document -->
			<xsl:element name="cbc:IssueTime">
				<xsl:value-of
					select="concat(substring(string(current-dateTime()), 12, 8), '-05:00')"
				/>
			</xsl:element>
			<!--EMISOR-->
			<xsl:element name="cac:SenderParty">
				<!--NIT-->
				<!-- Identification of the Company -->
					<xsl:element name="cac:PartyTaxScheme">
						<xsl:element name="cbc:RegistrationName">
							<xsl:value-of select="/Response/Encabezado/Emisor/NmbEmisor"/>
						</xsl:element>
						<xsl:element name="cbc:CompanyID">
							<xsl:attribute name="schemeID">
								<xsl:call-template name="calculNIT-dv">
									<xsl:with-param name="NIT"
										select="normalize-space(/Response/Encabezado/Emisor/IDEmisor)"
									/>
								</xsl:call-template>
							</xsl:attribute>
							<xsl:attribute name="schemeName">
								<xsl:value-of select="'31'"/>
							</xsl:attribute>
							<xsl:attribute name="schemeAgencyID">
								<xsl:text>195</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="schemeAgencyName">
								<xsl:text>CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)</xsl:text>
							</xsl:attribute>
							<xsl:value-of
								select="normalize-space(/Response/Encabezado/Emisor/IDEmisor)"
							/>
						</xsl:element>	
						<xsl:element name="cac:TaxScheme">
							<xsl:element name="cbc:ID">
								<xsl:value-of select="'01'"/>
							</xsl:element>
							<xsl:element name="cbc:Name">
								<xsl:value-of select="'IVA'"/>
							</xsl:element>
						</xsl:element>
					</xsl:element>
			</xsl:element>
			<!--RECEPTOR-->
			<xsl:element name="cac:ReceiverParty">
			 <!-- Identification of the Company -->
					<xsl:element name="cac:PartyTaxScheme">
						<xsl:element name="cbc:RegistrationName">
							<xsl:value-of select="/Response/Encabezado/Receptor/NmbReceptor"/>
						</xsl:element>
						<xsl:element name="cbc:CompanyID">
							<xsl:attribute name="schemeID">
								<xsl:call-template name="calculNIT-dv">
									<xsl:with-param name="NIT"
										select="normalize-space(/Response/Encabezado/Receptor/IDReceptor)"
									/>
								</xsl:call-template>
							</xsl:attribute>
							<xsl:attribute name="schemeName">
								<xsl:value-of select="'31'"/>
							</xsl:attribute>
							<xsl:attribute name="schemeAgencyID">
								<xsl:text>195</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="schemeAgencyName">
								<xsl:text>CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)</xsl:text>
							</xsl:attribute>
							<xsl:value-of
								select="normalize-space(/Response/Encabezado/Receptor/IDReceptor)"
							/>
						</xsl:element>	
						<xsl:element name="cac:TaxScheme">
							<xsl:element name="cbc:ID">
								<xsl:value-of select="'01'"/>
							</xsl:element>
							<xsl:element name="cbc:Name">
								<xsl:value-of select="'IVA'"/>
							</xsl:element>
						</xsl:element>
					</xsl:element>
				<!-- Contato del Recpetor -->
				<xsl:element name="cac:Contact">
					<xsl:element name="cbc:ElectronicMail">
						<xsl:value-of select="/Response/Encabezado/Receptor/MailReceptor"/>
					</xsl:element>							
				</xsl:element>
			</xsl:element>
			<!--DetalleDocAnulado-->
			<xsl:element name="cac:DocumentResponse">
				<xsl:element name="cac:Response">
					
					<!--Response Code -->
					<xsl:element name="cbc:ResponseCode">
						<xsl:value-of select="/Response/DetalleDocAnulado/CodigoResponse"/>
					</xsl:element>
					<!--Descripcion -->
					<xsl:element name="cbc:Description">
						<xsl:value-of select="/Response/DetalleDocAnulado/DscResponse"/>
					</xsl:element>
				</xsl:element>
				<xsl:element name="cac:DocumentReference">
					<xsl:element name="cbc:ID">
					<xsl:value-of select="normalize-space(concat(/Response/DetalleDocAnulado/Serie, /Response/DetalleDocAnulado/Numero))"/>
					</xsl:element>
					<xsl:element name="cbc:UUID">
						<xsl:attribute name="schemeName">
										<xsl:choose>
											<xsl:when test="string-length(/Response/DetalleDocAnulado/ClaveControl) = 40">
												<xsl:value-of select="'CUFE-SHA1'"/>
											</xsl:when>
											<xsl:when test="string-length(/Response/DetalleDocAnulado/ClaveControl) = 64">
												<xsl:value-of select="'CUFE-SHA256'"/>
											</xsl:when>
											<xsl:when test="string-length(/Response/DetalleDocAnulado/ClaveControl) = 96">
												<xsl:value-of select="'CUFE-SHA384'"/>
											</xsl:when>
											<xsl:when test="string-length(/Response/DetalleDocAnulado/ClaveControl) = 128">
												<xsl:value-of select="'CUFE-SHA512'"/>
											</xsl:when>
											<xsl:otherwise/>
										</xsl:choose>
									</xsl:attribute>
						<xsl:value-of select="/Response/DetalleDocAnulado/ClaveControl"/>
					</xsl:element>
					<xsl:element name="cbc:DocumentType">
						<xsl:value-of select="/Response/DetalleDocAnulado/TipoDoc"/>
					</xsl:element>
					<!--<xsl:element name="cac:LineResponse">
						<xsl:element name="cac:LineReference">
						      <xsl:element name="cbc:LineID">
						           <xsl:value-of select="''"/>
					          </xsl:element>
					     </xsl:element>
						 <xsl:element name="cac:Response">
						      <xsl:element name="cbc:ResponseCode">
						           <xsl:value-of select="'0000'"/>
					          </xsl:element>
							   <xsl:element name="cbc:Description">
						           <xsl:value-of select="'NSU'"/>
					          </xsl:element>
					     </xsl:element>						 
					</xsl:element>-->				
				</xsl:element>
			</xsl:element>
		</ApplicationResponse>
	</xsl:template>
	<xsl:template name="calculNIT-dv">
		<xsl:param name="NIT"/>
		<!--var CheckDigitCalculation NIT Colombia-->
		<xsl:variable name="var1"
			select="
				if (boolean(substring($NIT, 1, 1))) then
					substring($NIT, 1, 1)
				else
					0"/>
		<xsl:variable name="var2"
			select="
				if (boolean(substring($NIT, 2, 1))) then
					substring($NIT, 2, 1)
				else
					0"/>
		<xsl:variable name="var3"
			select="
				if (boolean(substring($NIT, 3, 1))) then
					substring($NIT, 3, 1)
				else
					0"/>
		<xsl:variable name="var4"
			select="
				if (boolean(substring($NIT, 4, 1))) then
					substring($NIT, 4, 1)
				else
					0"/>
		<xsl:variable name="var5"
			select="
				if (boolean(substring($NIT, 5, 1))) then
					substring($NIT, 5, 1)
				else
					0"/>
		<xsl:variable name="var6"
			select="
				if (boolean(substring($NIT, 6, 1))) then
					substring($NIT, 6, 1)
				else
					0"/>
		<xsl:variable name="var7"
			select="
				if (boolean(substring($NIT, 7, 1))) then
					substring($NIT, 7, 1)
				else
					0"/>
		<xsl:variable name="var8"
			select="
				if (boolean(substring($NIT, 8, 1))) then
					substring($NIT, 8, 1)
				else
					0"/>
		<xsl:variable name="var9"
			select="
				if (boolean(substring($NIT, 9, 1))) then
					substring($NIT, 9, 1)
				else
					0"/>
		<xsl:variable name="var10"
			select="
				if (boolean(substring($NIT, 10, 1))) then
					substring($NIT, 10, 1)
				else
					0"/>
		<xsl:variable name="var11"
			select="
				if (boolean(substring($NIT, 11, 1))) then
					substring($NIT, 11, 1)
				else
					0"/>
		<xsl:variable name="var12"
			select="
				if (boolean(substring($NIT, 12, 1))) then
					substring($NIT, 12, 1)
				else
					0"/>
		<xsl:variable name="var13"
			select="
				if (boolean(substring($NIT, 13, 1))) then
					substring($NIT, 13, 1)
				else
					0"/>
		<xsl:variable name="var14"
			select="
				if (boolean(substring($NIT, 14, 1))) then
					substring($NIT, 14, 1)
				else
					0"/>
		<xsl:variable name="var15"
			select="
				if (boolean(substring($NIT, 15, 1))) then
					substring($NIT, 15, 1)
				else
					0"/>
		<xsl:variable name="DV1">
			<xsl:if test="string-length($NIT) = 5">
				<xsl:value-of
					select="(number($var1) * 19) + (number($var2) * 17) + (number($var3) * 13) + (number($var4) * 7) + (number($var5) * 3)"
				/>
			</xsl:if>
			<xsl:if test="string-length($NIT) = 6">
				<xsl:value-of
					select="(number($var1) * 23) + (number($var2) * 19) + (number($var3) * 17) + (number($var4) * 13) + (number($var5) * 7) + (number($var6) * 3)"
				/>
			</xsl:if>
			<xsl:if test="string-length($NIT) = 7">
				<xsl:value-of
					select="(number($var1) * 29) + (number($var2) * 23) + (number($var3) * 19) + (number($var4) * 17) + (number($var5) * 13) + (number($var6) * 7) + (number($var7) * 3)"
				/>
			</xsl:if>
			<xsl:if test="string-length($NIT) = 8">
				<xsl:value-of
					select="(number($var1) * 37) + (number($var2) * 29) + (number($var3) * 23) + (number($var4) * 19) + (number($var5) * 17) + (number($var6) * 13) + (number($var7) * 7) + (number($var8) * 3)"
				/>
			</xsl:if>
			<xsl:if test="string-length($NIT) = 9">
				<xsl:value-of
					select="(number($var1) * 41) + (number($var2) * 37) + (number($var3) * 29) + (number($var4) * 23) + (number($var5) * 19) + (number($var6) * 17) + (number($var7) * 13) + (number($var8) * 7) + (number($var9) * 3)"
				/>
			</xsl:if>
			<xsl:if test="string-length($NIT) = 10">
				<xsl:value-of
					select="(number($var1) * 43) + (number($var2) * 41) + (number($var3) * 37) + (number($var4) * 29) + (number($var5) * 23) + (number($var6) * 19) + (number($var7) * 17) + (number($var8) * 13) + (number($var9) * 7) + (number($var10) * 3)"
				/>
			</xsl:if>
			<xsl:if test="string-length($NIT) = 11">
				<xsl:value-of
					select="(number($var1) * 47) + (number($var2) * 43) + (number($var3) * 41) + (number($var4) * 37) + (number($var5) * 29) + (number($var6) * 23) + (number($var7) * 19) + (number($var8) * 17) + (number($var9) * 13) + (number($var10) * 7) + (number($var11) * 3)"
				/>
			</xsl:if>
			<xsl:if test="string-length($NIT) = 12">
				<xsl:value-of
					select="(number($var1) * 53) + (number($var2) * 47) + (number($var3) * 43) + (number($var4) * 41) + (number($var5) * 37) + (number($var6) * 29) + (number($var7) * 23) + (number($var8) * 19) + (number($var9) * 17) + (number($var10) * 13) + (number($var11) * 7) + (number($var12) * 3)"
				/>
			</xsl:if>
			<xsl:if test="string-length($NIT) = 13">
				<xsl:value-of
					select="(number($var1) * 59) + (number($var2) * 53) + (number($var3) * 47) + (number($var4) * 43) + (number($var5) * 41) + (number($var6) * 37) + (number($var7) * 29) + (number($var8) * 23) + (number($var9) * 19) + (number($var10) * 17) + (number($var11) * 13) + (number($var12) * 7) + (number($var13) * 3)"
				/>
			</xsl:if>
			<xsl:if test="string-length($NIT) = 14">
				<xsl:value-of
					select="(number($var1) * 67) + (number($var2) * 59) + (number($var3) * 53) + (number($var4) * 47) + (number($var5) * 43) + (number($var6) * 41) + (number($var7) * 37) + (number($var8) * 29) + (number($var9) * 23) + (number($var10) * 19) + (number($var11) * 17) + (number($var12) * 13) + (number($var13) * 7) + (number($var14) * 3)"
				/>
			</xsl:if>
			<xsl:if test="string-length($NIT) = 15">
				<xsl:value-of
					select="(number($var1) * 71) + (number($var2) * 67) + (number($var3) * 59) + (number($var4) * 53) + (number($var5) * 47) + (number($var6) * 43) + (number($var7) * 41) + (number($var8) * 37) + (number($var9) * 29) + (number($var10) * 23) + (number($var11) * 19) + (number($var12) * 17) + (number($var13) * 13) + (number($var14) * 7) + (number($var15) * 3)"
				/>
			</xsl:if>
		</xsl:variable>
		<xsl:variable name="DV2" select="$DV1 mod 11"/>
		<xsl:variable name="DV">
			<xsl:choose>
				<xsl:when test="$DV2 &gt;= 2">
					<xsl:value-of select="11 - $DV2"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$DV2"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$DV != 'NaN'">
				<xsl:value-of select="$DV"/>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="countryName">
		<xsl:param name="Pais"/>
		<xsl:value-of
			select="document('https://gtpabillerstorageprod.blob.core.windows.net/listas/gc/Paises-2.1.gc')/*//Row[Value/SimpleValue = $Pais]/Value[2]/SimpleValue/text()"
		/>
	</xsl:template>
	<xsl:template name="countrySubentityName">
		<xsl:param name="Departamento"/>
		<xsl:value-of
			select="document('https://gtpabillerstorageprod.blob.core.windows.net/listas/gc/Departamentos-2.1.gc')/*//Row[Value/SimpleValue = $Departamento]/Value[2]/SimpleValue/text()"
		/>
	</xsl:template>
	<xsl:template name="cityName">
		<xsl:param name="Municipio"/>
		<xsl:value-of
			select="document('https://gtpabillerstorageprod.blob.core.windows.net/listas/gc/Municipio-2.1.gc')/*//Row[Value/SimpleValue = $Municipio]/Value[2]/SimpleValue/text()"
		/>
	</xsl:template>
	<xsl:template name="CodigoDescuento">
		<xsl:param name="CodDesc"/>
		<xsl:value-of
			select="document('https://gtpabillerstorageprod.blob.core.windows.net/listas/gc/CodigoDescuento-2.1.gc')/*//Row[Value/SimpleValue = $CodDesc]/Value[2]/SimpleValue/text()"
		/>
	</xsl:template>
	<xsl:template name="TipoImpuesto">
		<xsl:param name="TpoImp"/>
		<xsl:value-of
			select="document('https://gtpabillerstorageprod.blob.core.windows.net/listas/gc/TipoImpuesto-2.1.gc')/*//Row[Value/SimpleValue = $TpoImp]/Value[2]/SimpleValue/text()"
		/>
	</xsl:template>
	<xsl:template name="CodigoPrecioRef">
		<xsl:param name="CodRef"/>
		<xsl:value-of
			select="document('https://gtpabillerstorageprod.blob.core.windows.net/listas/gc/CodigoPrecioReferencia-2.1.gc')/*//Row[Value/SimpleValue = $CodRef]/Value[2]/SimpleValue/text()"
		/>
	</xsl:template>
	<xsl:template name="TipoDocRef">
		<xsl:param name="TpoDocRef"/>
		<xsl:value-of
			select=" document('https://gtpabillerstorageprod.blob.core.windows.net/listas/gc/TpoDocRef-2.1.gc')/*//Row[Value/SimpleValue = $TpoDocRef]/Value[2]/SimpleValue/text()"
		/>
	</xsl:template>
</xsl:stylesheet>