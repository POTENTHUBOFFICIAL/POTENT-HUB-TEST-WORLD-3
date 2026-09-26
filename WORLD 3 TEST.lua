-- ============================================================
-- POTENT HUB - WORLD 3 (Simple UI)
-- ============================================================

local playersService = game:GetService("Players")
local runService = game:GetService("RunService")
local LocalPlayer = playersService.LocalPlayer

local guiParent = game:GetService("CoreGui")
pcall(function() if gethui then guiParent = gethui() end end)

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "PotentWorld3"
screenGui.ResetOnSpawn = false
screenGui.DisplayOrder = 999
local ok = pcall(function() screenGui.Parent = guiParent end)
if not ok then screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end

-- Panel principal
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 240, 0, 240)
main.Position = UDim2.new(0, 20, 0.5, -120)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Parent = screenGui
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 10)

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(255, 200, 50)
stroke.Thickness = 1.5
stroke.Parent = main

-- Título
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.Text = "WORLD 3"
title.TextColor3 = Color3.fromRGB(255, 200, 50)
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.Parent = main

-- Cerrar
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 22, 0, 22)
closeBtn.Position = UDim2.new(1, -28, 0, 6)
closeBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
closeBtn.BorderSizePixel = 0
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(220, 50, 50)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 12
closeBtn.AutoButtonColor = false
closeBtn.Parent = main
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 6)

-- Toggle
local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(1, -20, 0, 34)
toggleBtn.Position = UDim2.new(0, 10, 0, 36)
toggleBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
toggleBtn.BorderSizePixel = 0
toggleBtn.Text = "AUTO FARM: OFF"
toggleBtn.TextColor3 = Color3.fromRGB(220, 220, 230)
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextSize = 13
toggleBtn.AutoButtonColor = false
toggleBtn.Parent = main
Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(0, 8)

-- Label Select Win
local selectWinLabel = Instance.new("TextLabel")
selectWinLabel.Size = UDim2.new(1, -20, 0, 20)
selectWinLabel.Position = UDim2.new(0, 10, 0, 76)
selectWinLabel.BackgroundTransparency = 1
selectWinLabel.Text = "Select Win"
selectWinLabel.TextColor3 = Color3.fromRGB(220, 220, 230)
selectWinLabel.Font = Enum.Font.Gotham
selectWinLabel.TextSize = 12
selectWinLabel.TextXAlignment = Enum.TextXAlignment.Left
selectWinLabel.Parent = main

-- Contenedor de rutas
local winHolder = Instance.new("ScrollingFrame")
winHolder.Size = UDim2.new(1, -20, 0, 70)
winHolder.Position = UDim2.new(0, 10, 0, 100)
winHolder.BackgroundColor3 = Color3.fromRGB(28, 28, 34)
winHolder.BorderSizePixel = 0
winHolder.ScrollBarThickness = 4
winHolder.CanvasSize = UDim2.new(0, 0, 0, 0)
winHolder.Parent = main
Instance.new("UICorner", winHolder).CornerRadius = UDim.new(0, 6)

local listLayout = Instance.new("UIListLayout")
listLayout.Padding = UDim.new(0, 3)
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Parent = winHolder

-- Rutas
local ROUTES = {
	["300M"] = {
		Vector3.new(-1433.89, -159.52, -871.89),
		Vector3.new(-1426.37, -154.24, -827.45),
		Vector3.new(-1423.97, -124.16, -732.65),
		Vector3.new(-1423.64, -89.19, -621.45),
		Vector3.new(-1427.91, -67.75, -524.57),
		Vector3.new(-1482.27, -66.50, -515.24),
	},
	["500M"] = {
		Vector3.new(-1432.86, -159.32, -872.44),
		Vector3.new(-1428.03, -157.01, -836.28),
		Vector3.new(-1426.70, -124.44, -732.69),
		Vector3.new(-1429.19, -91.26, -627.20),
		Vector3.new(-1430.14, -68.39, -532.61),
		Vector3.new(-1453.68, -68.39, -492.80),
		Vector3.new(-1455.52, -56.93, -392.63),
		Vector3.new(-1454.35, -56.14, -20.18),
		Vector3.new(-1480.98, -54.26, -15.66),
	},
	["800M"] = {
		Vector3.new(-1431.91, -158.92, -873.08),
		Vector3.new(-1431.48, -155.53, -831.55),
		Vector3.new(-1426.88, -124.41, -732.60),
		Vector3.new(-1429.44, -91.57, -628.17),
		Vector3.new(-1427.49, -68.39, -531.84),
		Vector3.new(-1454.33, -68.39, -490.71),
		Vector3.new(-1453.24, -65.88, -428.40),
		Vector3.new(-1455.70, -56.88, -392.43),
		Vector3.new(-1455.69, -55.89, -323.22),
		Vector3.new(-1453.33, -56.14, -8.73),
		Vector3.new(-1454.43, -55.89, 83.49),
		Vector3.new(-1454.03, 90.70, 87.25),
		Vector3.new(-1475.95, 91.11, 92.38),
		Vector3.new(-1474.50, 216.42, 96.89),
		Vector3.new(-1469.55, 224.45, 179.03),
		Vector3.new(-1468.68, 224.76, 228.53),
		Vector3.new(-1467.31, 215.87, 335.16),
		Vector3.new(-1481.27, 217.75, 331.78),
	},
	["1.25B"] = {
		Vector3.new(-1431.28, -159.52, -871.10),
		Vector3.new(-1428.23, -155.12, -830.25),
		Vector3.new(-1424.72, -122.48, -726.47),
		Vector3.new(-1424.74, -87.52, -615.22),
		Vector3.new(-1424.48, -68.39, -534.38),
		Vector3.new(-1453.99, -68.39, -492.30),
		Vector3.new(-1453.82, -56.61, -391.32),
		Vector3.new(-1456.01, -55.89, -308.73),
		Vector3.new(-1454.34, -56.14, -4.47),
		Vector3.new(-1454.12, -53.46, 84.69),
		Vector3.new(-1453.73, 90.70, 87.30),
		Vector3.new(-1475.20, 216.23, 98.87),
		Vector3.new(-1475.37, 224.47, 179.10),
		Vector3.new(-1464.36, 215.87, 351.88),
		Vector3.new(-1457.70, 215.84, 627.31),
		Vector3.new(-1457.70, 369.89, 627.31),
		Vector3.new(-1453.66, 361.87, 583.43),
		Vector3.new(-1354.24, 360.67, 495.31),
		Vector3.new(-1246.91, 335.51, 493.27),
		Vector3.new(-1240.09, 329.71, 660.76),
		Vector3.new(-1219.02, 347.41, 839.73),
		Vector3.new(-1369.12, 365.36, 841.68),
		Vector3.new(-1403.13, 371.52, 753.85),
		Vector3.new(-1402.78, 374.86, 724.21),
		Vector3.new(-1401.32, 546.36, 728.39),
		Vector3.new(-1430.47, 535.77, 759.87),
	},
	["2B"] = {
		Vector3.new(-1431.49, -159.52, -870.66),
		Vector3.new(-1426.25, -155.57, -831.70),
		Vector3.new(-1426.50, -124.99, -734.44),
		Vector3.new(-1427.32, -91.07, -626.58),
		Vector3.new(-1428.38, -68.39, -531.65),
		Vector3.new(-1451.58, -68.39, -493.83),
		Vector3.new(-1458.05, -57.60, -395.31),
		Vector3.new(-1454.06, -55.90, 84.25),
		Vector3.new(-1453.39, 216.11, 101.03),
		Vector3.new(-1452.85, 224.06, 177.54),
		Vector3.new(-1454.76, 223.63, 232.80),
		Vector3.new(-1454.17, 215.87, 349.81),
		Vector3.new(-1453.54, 215.80, 627.38),
		Vector3.new(-1456.03, 367.37, 627.45),
		Vector3.new(-1453.96, 361.87, 610.04),
		Vector3.new(-1457.23, 361.87, 577.12),
		Vector3.new(-1457.51, 361.07, 498.31),
		Vector3.new(-1339.56, 361.69, 492.54),
		Vector3.new(-1237.99, 329.71, 680.03),
		Vector3.new(-1218.08, 346.78, 833.47),
		Vector3.new(-1364.74, 364.94, 841.81),
		Vector3.new(-1402.77, 374.52, 724.52),
		Vector3.new(-1402.77, 552.01, 724.52),
		Vector3.new(-1404.75, 533.88, 774.48),
		Vector3.new(-1403.51, 533.88, 1333.85),
		Vector3.new(-1431.49, 535.76, 1329.84),
	},
	["3.5B"] = {
		Vector3.new(-1432.42, -158.67, -873.54),
		Vector3.new(-1425.42, -155.40, -831.15),
		Vector3.new(-1423.45, -123.18, -729.52),
		Vector3.new(-1424.09, -89.99, -623.98),
		Vector3.new(-1425.54, -68.39, -533.96),
		Vector3.new(-1456.70, -57.79, -396.05),
		Vector3.new(-1451.99, -55.89, -287.24),
		Vector3.new(-1454.36, -55.90, 83.96),
		Vector3.new(-1454.20, 216.11, 98.65),
		Vector3.new(-1452.87, 224.14, 177.83),
		Vector3.new(-1453.40, 224.56, 229.27),
		Vector3.new(-1452.67, 215.87, 355.44),
		Vector3.new(-1449.89, 215.81, 627.29),
		Vector3.new(-1450.14, 361.87, 608.74),
		Vector3.new(-1453.59, 361.07, 486.24),
		Vector3.new(-1327.15, 363.83, 504.57),
		Vector3.new(-1239.51, 329.71, 668.51),
		Vector3.new(-1210.96, 347.49, 842.50),
		Vector3.new(-1367.33, 365.19, 843.88),
		Vector3.new(-1406.65, 374.86, 726.22),
		Vector3.new(-1406.03, 553.15, 725.06),
		Vector3.new(-1403.44, 533.88, 762.18),
		Vector3.new(-1403.28, 533.88, 1333.28),
		Vector3.new(-1404.87, 533.87, 1443.51),
		Vector3.new(-1442.29, 533.87, 1446.10),
		Vector3.new(-1454.47, 509.87, 1446.66),
		Vector3.new(-2034.36, 509.87, 1446.50),
		Vector3.new(-2063.52, 445.76, 1459.55),
	},
	["5.5B"] = {
		Vector3.new(-1431.87, -158.67, -873.48),
		Vector3.new(-1424.96, -152.82, -822.06),
		Vector3.new(-1424.77, -121.32, -722.79),
		Vector3.new(-1426.29, -88.58, -618.65),
		Vector3.new(-1427.16, -68.39, -536.15),
		Vector3.new(-1461.72, -57.30, -394.10),
		Vector3.new(-1453.87, -55.93, 84.82),
		Vector3.new(-1454.98, 216.11, 99.75),
		Vector3.new(-1453.68, 224.88, 180.66),
		Vector3.new(-1456.63, 223.76, 232.30),
		Vector3.new(-1452.24, 215.87, 626.62),
		Vector3.new(-1452.46, 366.93, 627.78),
		Vector3.new(-1452.92, 361.87, 579.11),
		Vector3.new(-1453.96, 361.07, 504.08),
		Vector3.new(-1331.20, 364.35, 514.36),
		Vector3.new(-1241.33, 329.71, 677.98),
		Vector3.new(-1216.42, 347.54, 844.06),
		Vector3.new(-1368.92, 365.35, 836.69),
		Vector3.new(-1402.75, 376.90, 724.85),
		Vector3.new(-1402.75, 539.30, 724.85),
		Vector3.new(-1405.38, 533.88, 1350.50),
		Vector3.new(-1404.88, 533.87, 1445.64),
		Vector3.new(-1441.26, 533.87, 1445.75),
		Vector3.new(-1446.52, 509.87, 1446.35),
		Vector3.new(-2035.74, 509.87, 1446.68),
		Vector3.new(-2094.89, 443.87, 1481.56),
		Vector3.new(-2165.62, 451.52, 1484.86),
		Vector3.new(-2549.40, 466.44, 1490.01),
		Vector3.new(-2697.74, 443.87, 1489.95),
		Vector3.new(-2729.62, 452.05, 1487.99),
		Vector3.new(-2867.48, 468.49, 1486.04),
		Vector3.new(-2867.48, 521.11, 1486.04),
		Vector3.new(-2928.40, 526.79, 1485.65),
		Vector3.new(-2928.40, 595.25, 1485.65),
		Vector3.new(-2958.89, 609.93, 1485.07),
		Vector3.new(-3008.75, 603.78, 1483.10),
		Vector3.new(-3008.75, 668.29, 1483.10),
		Vector3.new(-3054.34, 673.39, 1488.47),
		Vector3.new(-3212.13, 673.39, 1485.09),
		Vector3.new(-3217.26, 675.27, 1459.30),
	},
	["8.5B"] = {
		Vector3.new(-1433.02, -159.52, -869.67),
		Vector3.new(-1428.59, -154.05, -826.85),
		Vector3.new(-1427.78, -123.95, -731.15),
		Vector3.new(-1428.42, -90.20, -623.81),
		Vector3.new(-1428.93, -67.41, -522.14),
		Vector3.new(-1452.20, -68.80, -440.25),
		Vector3.new(-1453.14, -57.08, -393.24),
		Vector3.new(-1454.25, -55.89, -267.37),
		Vector3.new(-1454.18, -55.91, 84.47),
		Vector3.new(-1454.45, 216.11, 100.26),
		Vector3.new(-1453.58, 223.98, 177.26),
		Vector3.new(-1454.73, 224.03, 231.27),
		Vector3.new(-1453.55, 215.87, 626.52),
		Vector3.new(-1452.86, 365.71, 627.28),
		Vector3.new(-1454.23, 361.87, 579.40),
		Vector3.new(-1456.08, 361.07, 498.32),
		Vector3.new(-1336.42, 363.37, 508.42),
		Vector3.new(-1238.99, 329.71, 685.68),
		Vector3.new(-1218.30, 346.96, 834.93),
		Vector3.new(-1367.36, 365.20, 844.13),
		Vector3.new(-1403.20, 375.59, 724.21),
		Vector3.new(-1403.19, 540.90, 724.99),
		Vector3.new(-1402.99, 533.88, 761.45),
		Vector3.new(-1405.64, 533.87, 1443.05),
		Vector3.new(-1447.26, 509.87, 1445.79),
		Vector3.new(-2034.52, 509.87, 1446.22),
		Vector3.new(-2085.23, 443.87, 1488.17),
		Vector3.new(-2163.88, 451.06, 1486.92),
		Vector3.new(-2359.77, 448.87, 1488.98),
		Vector3.new(-2548.55, 466.12, 1490.73),
		Vector3.new(-2731.79, 452.62, 1489.71),
		Vector3.new(-2862.77, 452.32, 1485.76),
		Vector3.new(-2933.65, 544.98, 1483.74),
		Vector3.new(-2940.32, 599.28, 1484.15),
		Vector3.new(-3001.40, 604.86, 1486.42),
		Vector3.new(-3001.40, 672.88, 1486.42),
		Vector3.new(-3053.83, 673.39, 1487.86),
		Vector3.new(-3230.28, 673.39, 1484.38),
		Vector3.new(-3654.96, 617.72, 1486.37),
		Vector3.new(-3657.42, 619.61, 1458.92),
	},
	["16B"] = {
		Vector3.new(-1431.72, -159.12, -872.69),
		Vector3.new(-1428.06, -153.11, -824.02),
		Vector3.new(-1426.08, -122.31, -725.91),
		Vector3.new(-1427.13, -88.54, -618.53),
		Vector3.new(-1426.74, -68.39, -534.98),
		Vector3.new(-1452.66, -56.84, -392.25),
		Vector3.new(-1455.37, -55.88, 84.21),
		Vector3.new(-1453.53, 216.11, 99.57),
		Vector3.new(-1451.46, 224.36, 178.70),
		Vector3.new(-1453.51, 224.55, 229.31),
		Vector3.new(-1453.04, 215.84, 627.21),
		Vector3.new(-1453.04, 367.44, 627.21),
		Vector3.new(-1456.30, 361.87, 581.04),
		Vector3.new(-1455.61, 361.07, 492.69),
		Vector3.new(-1330.21, 364.43, 514.23),
		Vector3.new(-1238.15, 329.71, 685.43),
		Vector3.new(-1219.41, 347.42, 840.05),
		Vector3.new(-1369.37, 365.39, 841.88),
		Vector3.new(-1403.97, 377.39, 725.16),
		Vector3.new(-1402.54, 551.73, 724.95),
		Vector3.new(-1403.45, 533.88, 774.07),
		Vector3.new(-1405.88, 533.88, 1337.24),
		Vector3.new(-1402.31, 533.87, 1444.93),
		Vector3.new(-1461.29, 509.87, 1445.25),
		Vector3.new(-2036.55, 509.87, 1445.69),
		Vector3.new(-2087.49, 443.87, 1486.65),
		Vector3.new(-2165.76, 451.56, 1488.19),
		Vector3.new(-2264.04, 439.87, 1489.49),
		Vector3.new(-2344.50, 448.87, 1487.88),
		Vector3.new(-2413.29, 440.20, 1489.55),
		Vector3.new(-2547.27, 465.65, 1490.39),
		Vector3.new(-2731.97, 452.62, 1487.08),
		Vector3.new(-2850.23, 446.46, 1487.22),
		Vector3.new(-2850.23, 523.62, 1487.22),
		Vector3.new(-2901.95, 520.39, 1487.17),
		Vector3.new(-2934.32, 527.92, 1481.75),
		Vector3.new(-2938.09, 595.92, 1481.87),
		Vector3.new(-2977.82, 596.39, 1482.81),
		Vector3.new(-2997.56, 595.91, 1484.26),
		Vector3.new(-2997.56, 675.90, 1484.26),
		Vector3.new(-3050.17, 673.39, 1486.26),
		Vector3.new(-3236.83, 673.39, 1485.30),
		Vector3.new(-3655.32, 617.72, 1486.84),
		Vector3.new(-4129.89, 617.72, 1485.43),
		Vector3.new(-4130.41, 619.61, 1457.34),
	},
	["25B"] = {
		Vector3.new(-1431.31, -159.32, -872.31),
		Vector3.new(-1429.99, -153.83, -826.17),
		Vector3.new(-1434.67, -68.34, -540.67),
		Vector3.new(-1453.40, -57.19, -393.66),
		Vector3.new(-1455.61, -55.90, 84.65),
		Vector3.new(-1456.38, 216.12, 101.43),
		Vector3.new(-1456.07, 224.37, 178.70),
		Vector3.new(-1455.89, 224.04, 231.25),
		Vector3.new(-1458.94, 216.12, 267.89),
		Vector3.new(-1454.79, 215.67, 464.94),
		Vector3.new(-1454.44, 215.87, 627.58),
		Vector3.new(-1454.44, 371.15, 627.58),
		Vector3.new(-1453.81, 361.87, 578.47),
		Vector3.new(-1454.58, 361.07, 497.03),
		Vector3.new(-1328.32, 364.85, 517.14),
		Vector3.new(-1218.48, 347.46, 841.29),
		Vector3.new(-1365.69, 365.03, 842.21),
		Vector3.new(-1404.04, 374.89, 725.22),
		Vector3.new(-1403.50, 540.36, 724.54),
		Vector3.new(-1404.01, 533.87, 1444.92),
		Vector3.new(-1455.63, 509.87, 1446.72),
		Vector3.new(-2035.57, 509.87, 1446.86),
		Vector3.new(-2080.43, 443.87, 1480.52),
		Vector3.new(-2168.08, 452.17, 1486.14),
		Vector3.new(-2357.67, 448.87, 1487.47),
		Vector3.new(-2550.53, 466.77, 1490.38),
		Vector3.new(-2731.52, 452.55, 1486.04),
		Vector3.new(-2863.78, 450.34, 1484.93),
		Vector3.new(-2863.78, 524.58, 1484.93),
		Vector3.new(-2925.02, 529.89, 1485.10),
		Vector3.new(-2925.02, 601.39, 1485.10),
		Vector3.new(-2999.70, 596.11, 1486.59),
		Vector3.new(-2999.70, 672.74, 1486.59),
		Vector3.new(-3053.52, 673.39, 1487.78),
		Vector3.new(-3235.87, 673.39, 1486.06),
		Vector3.new(-3634.26, 617.72, 1486.90),
		Vector3.new(-4154.83, 617.72, 1485.66),
		Vector3.new(-4171.81, 616.57, 1485.02),
		Vector3.new(-4625.86, 617.56, 1444.29),
		Vector3.new(-4971.36, 617.73, 1488.09),
		Vector3.new(-4968.73, 619.62, 1458.22),
	},
	["40B"] = {
		Vector3.new(-1432.21, -158.67, -873.61),
		Vector3.new(-1428.62, -153.51, -825.13),
		Vector3.new(-1426.02, -122.02, -724.99),
		Vector3.new(-1425.09, -88.67, -618.93),
		Vector3.new(-1424.79, -68.39, -536.73),
		Vector3.new(-1452.83, -57.63, -395.43),
		Vector3.new(-1452.72, -56.01, 84.52),
		Vector3.new(-1453.85, 216.11, 100.95),
		Vector3.new(-1453.13, 224.65, 179.77),
		Vector3.new(-1457.74, 224.62, 229.05),
		Vector3.new(-1455.66, 215.87, 353.34),
		Vector3.new(-1454.41, 215.86, 626.87),
		Vector3.new(-1454.41, 367.99, 626.87),
		Vector3.new(-1456.93, 361.87, 577.47),
		Vector3.new(-1327.27, 364.87, 516.38),
		Vector3.new(-1241.65, 329.71, 685.19),
		Vector3.new(-1215.39, 347.40, 839.46),
		Vector3.new(-1371.24, 365.46, 837.88),
		Vector3.new(-1404.74, 374.88, 724.18),
		Vector3.new(-1404.74, 542.18, 724.18),
		Vector3.new(-1403.99, 533.88, 781.93),
		Vector3.new(-1404.26, 533.87, 1444.32),
		Vector3.new(-1449.70, 509.87, 1446.36),
		Vector3.new(-2034.65, 509.87, 1446.48),
		Vector3.new(-2084.12, 443.87, 1487.32),
		Vector3.new(-2167.33, 451.97, 1485.82),
		Vector3.new(-2362.14, 448.87, 1488.96),
		Vector3.new(-2547.68, 465.80, 1489.24),
		Vector3.new(-2731.44, 452.53, 1487.93),
		Vector3.new(-2845.96, 448.50, 1485.86),
		Vector3.new(-2938.11, 519.52, 1485.11),
		Vector3.new(-2938.11, 594.82, 1485.11),
		Vector3.new(-2989.22, 679.22, 1483.49),
		Vector3.new(-3219.92, 673.39, 1485.31),
		Vector3.new(-3660.67, 617.72, 1483.97),
		Vector3.new(-4131.78, 617.72, 1485.15),
		Vector3.new(-4172.54, 616.59, 1484.84),
		Vector3.new(-4615.42, 616.80, 1444.20),
		Vector3.new(-4967.89, 617.73, 1484.25),
		Vector3.new(-5073.06, 625.98, 1485.00),
		Vector3.new(-5173.10, 676.88, 1482.77),
		Vector3.new(-5356.93, 735.73, 1483.69),
		Vector3.new(-5535.50, 794.97, 1486.48),
		Vector3.new(-5717.14, 852.74, 1486.76),
		Vector3.new(-5740.81, 854.63, 1459.78),
	},
}

local ROUTE_ORDER = { "300M", "500M", "800M", "1.25B", "2B", "3.5B", "5.5B", "8.5B", "16B", "25B", "40B" }

-- Nombres exactos a eliminar
local EXACT_NAMES = {
	LavaBottom = true,
	LavaCollide = true,
	LavaPart = true,
	LavaTop = true,
	Decorations = true,
	Tsunami1 = true,
	Tsunami = true,
	TsunamiEnd = true,
	TsunamiSpawn = true,
	MovingWalls = true,
	MovingWall1 = true,
	MovingWall2 = true,
	MovingWall3 = true,
	MovingWall4 = true,
	MovingWall5 = true,
	MovingWall6 = true,
}

local WIN1_NAMES = {
	NPC_Zone5 = true,
	NPC5_AttackZone = true,
	Sol = true,
	SpawnNpc5 = true,
}

local WIN1_ROUTES = {
	["1.25B"] = true,
	["2B"] = true,
	["3.5B"] = true,
	["5.5B"] = true,
	["8.5B"] = true,
	["16B"] = true,
	["25B"] = true,
	["40B"] = true,
}

local selectedRoute = "None"
local autoFarm = false
local flySpeed = 120
local flyConn = nil
local removeConn = nil
local noclipConn = nil

local function shouldRemove(name)
	if EXACT_NAMES[name] then return true end
	if WIN1_ROUTES[selectedRoute] and WIN1_NAMES[name] then return true end
	return false
end

local function removeObstacles()
	for _, d in ipairs(workspace:GetDescendants()) do
		if shouldRemove(d.Name) then
			pcall(function() d:Destroy() end)
		end
	end
end

-- Botones de ruta
for i, routeName in ipairs(ROUTE_ORDER) do
	if ROUTES[routeName] then
		local btn = Instance.new("TextButton")
		btn.Size = UDim2.new(1, -10, 0, 20)
		btn.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
		btn.BorderSizePixel = 0
		btn.Text = routeName
		btn.TextColor3 = Color3.fromRGB(220, 220, 230)
		btn.Font = Enum.Font.Gotham
		btn.TextSize = 12
		btn.AutoButtonColor = false
		btn.LayoutOrder = i
		btn.Parent = winHolder
		Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)

		btn.MouseButton1Click:Connect(function()
			selectedRoute = routeName
			selectWinLabel.Text = "Select Win: " .. routeName
			for _, c in ipairs(winHolder:GetChildren()) do
				if c:IsA("TextButton") then
					if c.Text == routeName then
						c.BackgroundColor3 = Color3.fromRGB(50, 120, 70)
					else
						c.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
					end
				end
			end
		end)
	end
end

task.defer(function()
	winHolder.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y + 10)
end)

-- Label velocidad
local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(1, -20, 0, 20)
speedLabel.Position = UDim2.new(0, 10, 0, 176)
speedLabel.BackgroundTransparency = 1
speedLabel.Text = "Speed: 120"
speedLabel.TextColor3 = Color3.fromRGB(220, 220, 230)
speedLabel.Font = Enum.Font.Gotham
speedLabel.TextSize = 12
speedLabel.TextXAlignment = Enum.TextXAlignment.Left
speedLabel.Parent = main

-- Botones velocidad
local minusBtn = Instance.new("TextButton")
minusBtn.Size = UDim2.new(0, 60, 0, 30)
minusBtn.Position = UDim2.new(0, 10, 0, 200)
minusBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
minusBtn.BorderSizePixel = 0
minusBtn.Text = "− 10"
minusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minusBtn.Font = Enum.Font.GothamBold
minusBtn.TextSize = 13
minusBtn.Parent = main
Instance.new("UICorner", minusBtn).CornerRadius = UDim.new(0, 6)

local plusBtn = Instance.new("TextButton")
plusBtn.Size = UDim2.new(0, 60, 0, 30)
plusBtn.Position = UDim2.new(0, 170, 0, 200)
plusBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
plusBtn.BorderSizePixel = 0
plusBtn.Text = "+ 10"
plusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
plusBtn.Font = Enum.Font.GothamBold
plusBtn.TextSize = 13
plusBtn.Parent = main
Instance.new("UICorner", plusBtn).CornerRadius = UDim.new(0, 6)

-- ============================================================
-- NOCLIP
-- ============================================================
local function startNoclip()
	if noclipConn then noclipConn:Disconnect() end
	noclipConn = runService.Stepped:Connect(function()
		local char = LocalPlayer.Character
		if not char then return end
		for _, p in ipairs(char:GetDescendants()) do
			if p:IsA("BasePart") then p.CanCollide = false end
		end
	end)
end

local function stopNoclip()
	if noclipConn then noclipConn:Disconnect() noclipConn = nil end
end

-- ============================================================
-- FLY
-- ============================================================
local function stopFly()
	if flyConn then flyConn:Disconnect() flyConn = nil end
end

local function startFly()
	stopFly()
	local waypoints = ROUTES[selectedRoute]
	if not waypoints or #waypoints == 0 then return end

	local idx = 1
	flyConn = runService.Heartbeat:Connect(function(dt)
		if not autoFarm then return end
		local char = LocalPlayer.Character
		local root = char and char:FindFirstChild("HumanoidRootPart")
		if not root then return end

		local target = waypoints[idx]
		if not target then idx = 1 target = waypoints[1] end
		if not target then return end

		local dist = (target - root.Position).Magnitude
		if dist < 0.5 then
			root.CFrame = CFrame.new(target)
			root.AssemblyLinearVelocity = Vector3.zero
			root.AssemblyAngularVelocity = Vector3.zero
			idx = idx + 1
			if idx > #waypoints then idx = 1 end
			return
		end

		local step = math.min(flySpeed * dt, dist)
		local dir = (target - root.Position).Unit
		local newPos = root.Position + dir * step
		root.CFrame = CFrame.new(newPos, newPos + dir)
		root.AssemblyLinearVelocity = Vector3.zero
		root.AssemblyAngularVelocity = Vector3.zero
	end)
end

-- ============================================================
-- EVENTOS
-- ============================================================
toggleBtn.MouseButton1Click:Connect(function()
	autoFarm = not autoFarm
	if autoFarm then
		if selectedRoute == "None" then
			toggleBtn.Text = "SELECT A WIN FIRST"
			toggleBtn.TextColor3 = Color3.fromRGB(255, 200, 50)
			task.wait(1.5)
			toggleBtn.Text = "AUTO FARM: OFF"
			toggleBtn.TextColor3 = Color3.fromRGB(220, 220, 230)
			autoFarm = false
			return
		end
		toggleBtn.Text = "AUTO FARM: ON"
		toggleBtn.TextColor3 = Color3.fromRGB(0, 200, 100)
		toggleBtn.BackgroundColor3 = Color3.fromRGB(20, 60, 30)

		removeObstacles()
		removeConn = workspace.DescendantAdded:Connect(function(desc)
			if autoFarm and shouldRemove(desc.Name) then
				task.defer(function() pcall(function() desc:Destroy() end) end)
			end
		end)

		startNoclip()
		startFly()
	else
		toggleBtn.Text = "AUTO FARM: OFF"
		toggleBtn.TextColor3 = Color3.fromRGB(220, 220, 230)
		toggleBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 42)

		if removeConn then removeConn:Disconnect() removeConn = nil end
		stopNoclip()
		stopFly()
	end
end)

plusBtn.MouseButton1Click:Connect(function()
	flySpeed = math.min(500, flySpeed + 10)
	speedLabel.Text = "Speed: " .. flySpeed
end)

minusBtn.MouseButton1Click:Connect(function()
	flySpeed = math.max(20, flySpeed - 10)
	speedLabel.Text = "Speed: " .. flySpeed
end)

closeBtn.MouseButton1Click:Connect(function()
	if removeConn then removeConn:Disconnect() removeConn = nil end
	stopNoclip()
	stopFly()
	screenGui:Destroy()
end)
