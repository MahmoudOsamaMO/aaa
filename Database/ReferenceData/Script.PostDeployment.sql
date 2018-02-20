﻿/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
-- Allow IDENTITY insert for table
SET IDENTITY_INSERT [ApplyLoadsPerTable] ON
GO

MERGE INTO [ApplyLoadsPerTable] AS Target
USING (VALUES
(1, N'NONE'),
(2, N'MBMA 2002'),
(3, N'MBMA 2006'),
(4, N'IBC 2003'),
(5, N'IBC 2006'),
(6, N'UBC 91'),
(7, N'UBC 97'),
(8, N'ASCE-7 2002'),
(9, N'ASCE-7 2005'),
(10, N'SAUDI ROYAL COMMISSION: YANBU'),
(11, N'SAUDI ROYAL COMMISSION: JUBAIL'),
(12, N'BS 6399-CP3'),
(13, N'ECP 93'),
(14, N'IS875'),
(15, N'OTHER (See Remarks)'))
AS Source (ApplyLoadsPer_ID, ApplyLoadsPer)
ON Target.ApplyLoadsPer_ID = Source.ApplyLoadsPer_ID
-- update matched rows
WHEN MATCHED THEN
UPDATE SET ApplyLoadsPer = Source.ApplyLoadsPer
-- insert new rows
WHEN NOT MATCHED BY TARGET THEN
INSERT (ApplyLoadsPer_ID, ApplyLoadsPer)
VALUES (ApplyLoadsPer_ID, ApplyLoadsPer)
-- delete rows that are in the target but not the source
WHEN NOT MATCHED BY SOURCE THEN DELETE;
GO

SET IDENTITY_INSERT [ApplyLoadsPerTable] OFF
GO


--************************************************

-- Allow IDENTITY insert for table
SET IDENTITY_INSERT [ColdFormedDesignCodesTable] ON
GO

MERGE INTO [ColdFormedDesignCodesTable] AS Target
USING (VALUES
(1,  N'NONE'),
(2,  N'AISI 01'),
(3,  N'AISI 80'),
(4,  N'AISI 86'),
(5,  N'IS 801'),
(6,  N'OTHER (See Remarks)'))
AS Source (ColdFormedDesignCodes_ID, ColdFormedDesignCodes)
ON Target.ColdFormedDesignCodes_ID = Source.ColdFormedDesignCodes_ID
-- update matched rows
WHEN MATCHED THEN
UPDATE SET ColdFormedDesignCodes = Source.ColdFormedDesignCodes
-- insert new rows
WHEN NOT MATCHED BY TARGET THEN
INSERT (ColdFormedDesignCodes_ID, ColdFormedDesignCodes)
VALUES (ColdFormedDesignCodes_ID, ColdFormedDesignCodes)
-- delete rows that are in the target but not the source
WHEN NOT MATCHED BY SOURCE THEN DELETE;
GO

SET IDENTITY_INSERT [ColdFormedDesignCodesTable] OFF
GO

--*******************************************************

-- Allow IDENTITY insert for table
SET IDENTITY_INSERT [DesignCodesTable] ON
GO

MERGE INTO [DesignCodesTable] AS Target
USING (VALUES
(1,  N'NONE'),
(2,  N'AISC'),
(3,  N'AISC 1989'),
(4,  N'IBS-5950-1990'),
(5,  N'IBS-5950-2000'),
(6,  N'UECP97'),
(7,  N'UECP01'),
(8,  N'AEURO CODE 3'),
(9,  N'AAISC05-ASD'),
(10, N'AISC05-LRFD'),
(11, N'AISC10-ASD'),
(12, N'AISC10-LRFD'),
(13, N'IS800-1984'),
(14, N'IS800-2007'),
(15, N'OTHER (See Remarks)'))
AS Source (DesignCodes_ID, DesignCodes)
ON Target.DesignCodes_ID = Source.DesignCodes_ID
-- update matched rows
WHEN MATCHED THEN
UPDATE SET DesignCodes = Source.DesignCodes
-- insert new rows
WHEN NOT MATCHED BY TARGET THEN
INSERT (DesignCodes_ID, DesignCodes)
VALUES (DesignCodes_ID, DesignCodes)
-- delete rows that are in the target but not the source
WHEN NOT MATCHED BY SOURCE THEN DELETE;
GO

SET IDENTITY_INSERT [DesignCodesTable] OFF
GO

--*******************************************************

-- Allow IDENTITY insert for table
SET IDENTITY_INSERT [Downspouts_Table] ON
GO

MERGE INTO [Downspouts_Table] AS Target
USING (VALUES
(1, N'NONE'),
(2, N'STANDARD'),
(3, N'PVC'),
(4, N'FG OUTLET ONLY'),
(5, N'BY OTHERS'))
AS Source (ID_Downspouts, Downspouts)
ON Target.ID_Downspouts = Source.ID_Downspouts
-- update matched rows
WHEN MATCHED THEN
UPDATE SET Downspouts = Source.Downspouts
-- insert new rows
WHEN NOT MATCHED BY TARGET THEN
INSERT (ID_Downspouts, Downspouts)
VALUES (ID_Downspouts, Downspouts)
-- delete rows that are in the target but not the source
WHEN NOT MATCHED BY SOURCE THEN DELETE;
GO

SET IDENTITY_INSERT [Downspouts_Table] OFF
GO

--*******************************************************

-- Allow IDENTITY insert for table
SET IDENTITY_INSERT [EaveConditionEnum_Table] ON
GO

MERGE INTO [EaveConditionEnum_Table] AS Target
USING (VALUES
(1, N'NO EAVE'),
(2, N'EAVE GUTTER'),
(3, N'EAVE TRIM'),
(4, N'CURVED W/O PROJ'),
(5, N'CURVED W/O PROJ WITH V.G'),
(6, N'CURVED WITH PROJ'),
(7, N'CURVED WITH PROJ WITH V.G'),
(8, N'VALLEY GUTTER'),
(9, N'NONE'))
AS Source (ID_EaveConditionEnum, EaveConditionEnum)
ON Target.ID_EaveConditionEnum = Source.ID_EaveConditionEnum
-- update matched rows
WHEN MATCHED THEN
UPDATE SET EaveConditionEnum = Source.EaveConditionEnum
-- insert new rows
WHEN NOT MATCHED BY TARGET THEN
INSERT (ID_EaveConditionEnum, EaveConditionEnum)
VALUES (ID_EaveConditionEnum, EaveConditionEnum)
-- delete rows that are in the target but not the source
WHEN NOT MATCHED BY SOURCE THEN DELETE;
GO

SET IDENTITY_INSERT [EaveConditionEnum_Table] OFF
GO

--*******************************************************

-- Allow IDENTITY insert for table
SET IDENTITY_INSERT [EndWallTypeTypeTable] ON
GO

MERGE INTO [EndWallTypeTypeTable] AS Target
USING (VALUES
(1, N'POST AND BEAM'),
(2, N'RIGID FRAME'),
(3, N'RIGID FRAME WITH HALF BAY LOADING'),
(4, N'COMMON FRAME IN OTHER AREA'),
(5, N'FALSE RAFTER'),
(6, N'PART. RIGID FRAME PART. P AND B'),
(7, N'OTHER'),
(8, N'NONE'))
AS Source (EndWallTypeType_ID, EndWallTypeType)
ON Target.EndWallTypeType_ID = Source.EndWallTypeType_ID
-- update matched rows
WHEN MATCHED THEN
UPDATE SET EndWallTypeType = Source.EndWallTypeType
-- insert new rows
WHEN NOT MATCHED BY TARGET THEN
INSERT (EndWallTypeType_ID, EndWallTypeType)
VALUES (EndWallTypeType_ID, EndWallTypeType)
-- delete rows that are in the target but not the source
WHEN NOT MATCHED BY SOURCE THEN DELETE;
GO

SET IDENTITY_INSERT [EndWallTypeTypeTable] OFF
GO

--*******************************************************

-- Allow IDENTITY insert for table
SET IDENTITY_INSERT [FrameType_Table] ON
GO

MERGE INTO [FrameType_Table] AS Target
USING (VALUES
(1,  N'CLEAR SPAN'),
(2,  N'MULTI SPAN'),
(3,  N'LEAN TO'),
(4,  N'MULTI GABLE'),
(5,  N'ROOF SYSTEM'),
(6,  N'FLAT ROOF'),
(7,  N'SINGLE SLOPE'),
(8,  N'CAR CANOPY: FALCON'),
(9,  N'CAR CANOPY: BUTTERFLY'),
(10, N'CAR CANOPY: CARACAL'),
(11, N'CAR CANOPY: CHEETAH'),
(12, N'CAR CANOPY: GAZELLE'),
(13, N'OTHER (See Remarks)'))
AS Source (ID_FrameType, FrameType)
ON Target.ID_FrameType = Source.ID_FrameType
-- update matched rows
WHEN MATCHED THEN
UPDATE SET FrameType = Source.FrameType
-- insert new rows
WHEN NOT MATCHED BY TARGET THEN
INSERT (ID_FrameType, FrameType)
VALUES (ID_FrameType, FrameType)
-- delete rows that are in the target but not the source
WHEN NOT MATCHED BY SOURCE THEN DELETE;
GO

SET IDENTITY_INSERT [FrameType_Table] OFF
GO

--*******************************************************

-- Allow IDENTITY insert for table
SET IDENTITY_INSERT [HeightReference_Table] ON
GO

MERGE INTO [HeightReference_Table] AS Target
USING (VALUES
(1,  N'EAVE HEIGHT'),
(2,  N'CLEAR HEIGHT'),
(3,  N'RIDGE HEIGHT'),
(4,  N'OTHER (See Remarks)'))
AS Source (ID_HeightReference, HeightReference)
ON Target.ID_HeightReference = Source.ID_HeightReference
-- update matched rows
WHEN MATCHED THEN
UPDATE SET HeightReference = Source.HeightReference
-- insert new rows
WHEN NOT MATCHED BY TARGET THEN
INSERT (ID_HeightReference, HeightReference)
VALUES (ID_HeightReference, HeightReference)
-- delete rows that are in the target but not the source
WHEN NOT MATCHED BY SOURCE THEN DELETE;
GO

SET IDENTITY_INSERT [HeightReference_Table] OFF
GO

--*******************************************************

-- Allow IDENTITY insert for table
SET IDENTITY_INSERT [LengthReference_Table] ON
GO

MERGE INTO [LengthReference_Table] AS Target
USING (VALUES
(1,  N'OUT TO OUT OF STEEL LINE (O/O ENDWALL GIRTS)'),
(2,  N'OUT TO OUT OF COLUMN FLANGES'),
(3,  N'CENTERLINE TO CENTERLINE OF COLUMN BASES'),
(4,  N'INSIDE TO INSIDE OF ENDWALL COLUMN INNER FLANGES AT KNEES'),
(5,  N'OTHER (See Remarks)'))
AS Source (ID_LengthReference, LengthReference)
ON Target.ID_LengthReference = Source.ID_LengthReference
-- update matched rows
WHEN MATCHED THEN
UPDATE SET LengthReference = Source.LengthReference
-- insert new rows
WHEN NOT MATCHED BY TARGET THEN
INSERT (ID_LengthReference, LengthReference)
VALUES (ID_LengthReference, LengthReference)
-- delete rows that are in the target but not the source
WHEN NOT MATCHED BY SOURCE THEN DELETE;
GO

SET IDENTITY_INSERT [LengthReference_Table] OFF
GO

--*******************************************************

-- Allow IDENTITY insert for table
SET IDENTITY_INSERT [SeismicTable] ON
GO

MERGE INTO [SeismicTable] AS Target
USING (VALUES
(1,  N'NONE'),
(2,  N'OTHER'),
(3,  N'Zone 1'),
(4,  N'Zone 2'),
(5,  N'Zone 3'),
(6,  N'Zone 4'))
AS Source (Seismic_ID, Seismic)
ON Target.Seismic_ID = Source.Seismic_ID
-- update matched rows
WHEN MATCHED THEN
UPDATE SET Seismic = Source.Seismic
-- insert new rows
WHEN NOT MATCHED BY TARGET THEN
INSERT (Seismic_ID, Seismic)
VALUES (Seismic_ID, Seismic)
-- delete rows that are in the target but not the source
WHEN NOT MATCHED BY SOURCE THEN DELETE;
GO

SET IDENTITY_INSERT [SeismicTable] OFF
GO

--*******************************************************

-- Allow IDENTITY insert for table
SET IDENTITY_INSERT [WidthReferenceTable] ON
GO

MERGE INTO [WidthReferenceTable] AS Target
USING (VALUES
(1,  N'OUT TO OUT OF STEEL LINE (O/O OF EAVE STRUTS)'),
(2,  N'OUT TO OUT OF COLUMN FLANGES'),
(3,  N'CENTERLINE TO CENTERLINE OF COLUMN BASES'),
(4,  N'INSIDE TO INSIDE OF COLUMN INNER FLANGES AT KNEES'),
(5,  N'OUT TO OUT OF BLOCK WALLS'),
(6,  N'OTHER (See Remarks)'))
AS Source (ID_WidthReference, WidthReference)
ON Target.ID_WidthReference = Source.ID_WidthReference
-- update matched rows
WHEN MATCHED THEN
UPDATE SET WidthReference = Source.WidthReference
-- insert new rows
WHEN NOT MATCHED BY TARGET THEN
INSERT (ID_WidthReference, WidthReference)
VALUES (ID_WidthReference, WidthReference)
-- delete rows that are in the target but not the source
WHEN NOT MATCHED BY SOURCE THEN DELETE;
GO

SET IDENTITY_INSERT [WidthReferenceTable] OFF
GO

--*******************************************************

-- Allow IDENTITY insert for table
SET IDENTITY_INSERT [WindExposureTable] ON
GO

MERGE INTO [WindExposureTable] AS Target
USING (VALUES
(1,  N'B'),
(2,  N'C'),
(3,  N'D'),
(4,  N'NONE'),
(5,  N'OTHER'))
AS Source (WindExposure_ID, WindExposure)
ON Target.WindExposure_ID = Source.WindExposure_ID
-- update matched rows
WHEN MATCHED THEN
UPDATE SET WindExposure = Source.WindExposure
-- insert new rows
WHEN NOT MATCHED BY TARGET THEN
INSERT (WindExposure_ID, WindExposure)
VALUES (WindExposure_ID, WindExposure)
-- delete rows that are in the target but not the source
WHEN NOT MATCHED BY SOURCE THEN DELETE;
GO

SET IDENTITY_INSERT [WindExposureTable] OFF
GO

--*******************************************************

-- Allow IDENTITY insert for table
SET IDENTITY_INSERT [WindSpeedEnumTable] ON
GO

MERGE INTO [WindSpeedEnumTable] AS Target
USING (VALUES
(1,  N'FASTEST MILE'),
(2,  N'3 SECOND GUST SPEED'),
(3,  N'10 MINUTES'),
(4,  N'NONE'),
(5,  N'OTHER'))
AS Source (WindSpeedEnum_ID, WindSpeedEnum)
ON Target.WindSpeedEnum_ID = Source.WindSpeedEnum_ID
-- update matched rows
WHEN MATCHED THEN
UPDATE SET WindSpeedEnum = Source.WindSpeedEnum
-- insert new rows
WHEN NOT MATCHED BY TARGET THEN
INSERT (WindSpeedEnum_ID, WindSpeedEnum)
VALUES (WindSpeedEnum_ID, WindSpeedEnum)
-- delete rows that are in the target but not the source
WHEN NOT MATCHED BY SOURCE THEN DELETE;
GO

SET IDENTITY_INSERT [WindSpeedEnumTable] OFF
GO



--*******************************************************

-- Allow IDENTITY insert for table
SET IDENTITY_INSERT [SurfaceFinishTable] ON
GO

MERGE INTO [SurfaceFinishTable] AS Target
USING (VALUES
(1,  N'PAINTED'),
(2,  N'HOT DIP GALVANIZED'))
AS Source (SurfaceFinish_ID, SurfaceFinish)
ON Target.SurfaceFinish_ID = Source.SurfaceFinish_ID
-- update matched rows
WHEN MATCHED THEN
UPDATE SET SurfaceFinish = Source.SurfaceFinish
-- insert new rows
WHEN NOT MATCHED BY TARGET THEN
INSERT (SurfaceFinish_ID, SurfaceFinish)
VALUES (SurfaceFinish_ID, SurfaceFinish)
-- delete rows that are in the target but not the source
WHEN NOT MATCHED BY SOURCE THEN DELETE;
GO

SET IDENTITY_INSERT [SurfaceFinishTable] OFF
GO



--*******************************************************

-- Allow IDENTITY insert for table
SET IDENTITY_INSERT [PaintSystemTable] ON
GO

MERGE INTO [PaintSystemTable] AS Target
USING (VALUES
(1,  N'NONE'),
(2,  N'ALUM OXIDE PRIMER ONLY'),
(3,  N'GREY OXIDE PRIMER ONLY'),
(4,  N'SPECIAL'),
(5,  N'RED OXIDE PRIMER ONLY'))
AS Source (PaintSystem_ID, PaintSystem)
ON Target.PaintSystem_ID = Source.PaintSystem_ID
-- update matched rows
WHEN MATCHED THEN
UPDATE SET PaintSystem = Source.PaintSystem
-- insert new rows
WHEN NOT MATCHED BY TARGET THEN
INSERT (PaintSystem_ID, PaintSystem)
VALUES (PaintSystem_ID, PaintSystem)
-- delete rows that are in the target but not the source
WHEN NOT MATCHED BY SOURCE THEN DELETE;
GO

SET IDENTITY_INSERT [PaintSystemTable] OFF
GO


--*******************************************************

-- Allow IDENTITY insert for table
SET IDENTITY_INSERT [SurfaceTreatmentTable] ON
GO

MERGE INTO [SurfaceTreatmentTable] AS Target
USING (VALUES
(1,  N'NONE'),
(2,  N'SHOT BLAST 2.5'),
(3,  N'STANDARD'))
AS Source (SurfaceTreatment_ID, SurfaceTreatment)
ON Target.SurfaceTreatment_ID = Source.SurfaceTreatment_ID
-- update matched rows
WHEN MATCHED THEN
UPDATE SET SurfaceTreatment = Source.SurfaceTreatment
-- insert new rows
WHEN NOT MATCHED BY TARGET THEN
INSERT (SurfaceTreatment_ID, SurfaceTreatment)
VALUES (SurfaceTreatment_ID, SurfaceTreatment)
-- delete rows that are in the target but not the source
WHEN NOT MATCHED BY SOURCE THEN DELETE;
GO

SET IDENTITY_INSERT [SurfaceTreatmentTable] OFF
GO


--*******************************************************

-- Allow IDENTITY insert for table
SET IDENTITY_INSERT [SecondarySurfaceFinishTable] ON
GO

MERGE INTO [SecondarySurfaceFinishTable] AS Target
USING (VALUES
(1,  N'PAINTED'),
(2,  N'PRE GALVANIZED'))
AS Source (SecondarySurfaceFinish_ID, SecondarySurfaceFinish)
ON Target.SecondarySurfaceFinish_ID = Source.SecondarySurfaceFinish_ID
-- update matched rows
WHEN MATCHED THEN
UPDATE SET SecondarySurfaceFinish = Source.SecondarySurfaceFinish
-- insert new rows
WHEN NOT MATCHED BY TARGET THEN
INSERT (SecondarySurfaceFinish_ID, SecondarySurfaceFinish)
VALUES (SecondarySurfaceFinish_ID, SecondarySurfaceFinish)
-- delete rows that are in the target but not the source
WHEN NOT MATCHED BY SOURCE THEN DELETE;
GO

SET IDENTITY_INSERT [SecondarySurfaceFinishTable] OFF
GO



--*******************************************************

-- Allow IDENTITY insert for table
SET IDENTITY_INSERT [BracingTypeTable] ON
GO

MERGE INTO [BracingTypeTable] AS Target
USING (VALUES
(1,  N'DIAGONAL'),
(2,  N'PORTAL'),
(3,  N'PORTAL PARTIAL HEIGHT'),
(4,  N'MINOR AXIS'),
(5,  N'NONE'),
(6,  N'OTHER'))
AS Source (BracingType_ID, BracingType)
ON Target.BracingType_ID = Source.BracingType_ID
-- update matched rows
WHEN MATCHED THEN
UPDATE SET BracingType = Source.BracingType
-- insert new rows
WHEN NOT MATCHED BY TARGET THEN
INSERT (BracingType_ID, BracingType)
VALUES (BracingType_ID, BracingType)
-- delete rows that are in the target but not the source
WHEN NOT MATCHED BY SOURCE THEN DELETE;
GO

SET IDENTITY_INSERT [BracingTypeTable] OFF
GO






