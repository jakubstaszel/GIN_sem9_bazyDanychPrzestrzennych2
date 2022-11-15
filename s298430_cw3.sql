-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jakub Staszel
-- Create date: 15.11.2022
-- Description:	Get GBP and EUR X years ago
-- =============================================
CREATE PROCEDURE s298430_cw3 
	-- Add the parameters for the stored procedure here
	@yearsAgo int = 8
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT fcr.*, dc.CurrencyAlternateKey from dbo.FactCurrencyRate fcr
		LEFT JOIN dbo.DimCurrency dc
		ON fcr.CurrencyKey = dc.CurrencyKey
		WHERE ([CurrencyAlternateKey]='GBP' OR [CurrencyAlternateKey]='EUR') AND [Date]=DATEADD(year, @yearsAgo, GETDATE())
END
GO
