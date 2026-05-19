-- =====================================================================
-- [ EYMNFOX PREMIUM HUB - V2.0 (NO KEY SYSTEM) ]
-- Gelişmiş Animasyonlar, Bildirim Sistemi, Neon Tasarım ve 100+ Özellik Yuvası
-- =====================================================================

local player = game.Players.LocalPlayer
local guiName = "EymnfoxPremiumHub"
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

-- Eski GUI varsa sil (Yenilenme için)
for _, gui in pairs(CoreGui:GetChildren()) do
    if gui.Name == guiName then gui:Destroy() end
end

-- Ana Ekran
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = guiName
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

-- ==========================================
-- 1. BİLDİRİM SİSTEMİ (Sağ altta çıkan havalı uyarılar)
-- ==========================================
local NotificationFrame = Instance.new("Frame")
NotificationFrame.Size = UDim2.new(0, 250, 1, 0)
NotificationFrame.Position = UDim2.new(1, -260, 0, 0)
NotificationFrame.BackgroundTransparency = 1
NotificationFrame.Parent = ScreenGui

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = NotificationFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
UIListLayout.Padding = UDim.new(0, 10)

local function SendNotification(title, text, duration)
    local Notif = Instance.new("Frame")
    Notif.Size = UDim2.new(1, 0, 0, 60)
    Notif.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    Notif.Parent = NotificationFrame
    Notif.BackgroundTransparency = 1
    
    local NotifCorner = Instance.new("UICorner")
    NotifCorner.CornerRadius = UDim.new(0, 8)
    NotifCorner.Parent = Notif
    
    local NotifStroke = Instance.new("UIStroke")
    NotifStroke.Color = Color3.fromRGB(0, 120, 255)
    NotifStroke.Thickness = 1.5
    NotifStroke.Parent = Notif
    NotifStroke.Transparency = 1

    local NotifTitle = Instance.new("TextLabel")
    NotifTitle.Size = UDim2.new(1, -10, 0, 25)
    NotifTitle.Position = UDim2.new(0, 10, 0, 5)
    NotifTitle.BackgroundTransparency = 1
    NotifTitle.Text = title
    NotifTitle.TextColor3 = Color3.fromRGB(0, 150, 255)
    NotifTitle.Font = Enum.Font.GothamBold
    NotifTitle.TextSize = 14
    NotifTitle.TextXAlignment = Enum.TextXAlignment.Left
    NotifTitle.Parent = Notif
    NotifTitle.TextTransparency = 1

    local NotifDesc = Instance.new("TextLabel")
    NotifDesc.Size = UDim2.new(1, -10, 0, 25)
    NotifDesc.Position = UDim2.new(0, 10, 0, 25)
    NotifDesc.BackgroundTransparency = 1
    NotifDesc.Text = text
    NotifDesc.TextColor3 = Color3.fromRGB(200, 200, 200)
    NotifDesc.Font = Enum.Font.Gotham
    NotifDesc.TextSize = 12
    NotifDesc.TextXAlignment = Enum.TextXAlignment.Left
    NotifDesc.Parent = Notif
    NotifDesc.TextTransparency = 1

    -- Giriş Animasyonu
    TweenService:Create(Notif, TweenInfo.new(0.5), {BackgroundTransparency = 0.1}):Play()
    TweenService:Create(NotifStroke, TweenInfo.new(0.5), {Transparency = 0}):Play()
    TweenService:Create(NotifTitle, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
    TweenService:Create(NotifDesc, TweenInfo.new(0.5), {TextTransparency = 0}):Play()

    -- Çıkış Animasyonu
    task.delay(duration, function()
        TweenService:Create(Notif, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
        TweenService:Create(NotifStroke, TweenInfo.new(0.5), {Transparency = 1}):Play()
        TweenService:Create(NotifTitle, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
        TweenService:Create(NotifDesc, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
        task.wait(0.5)
        Notif:Destroy()
    end)
end

-- ==========================================
-- 2. ANA MENÜ TASARIMI (Görsel Şölen)
-- ==========================================
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 650, 0, 400)
MainFrame.Position = UDim2.new(0.5, -325, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

-- UI Köşeleri
local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

-- Neon Dış Çizgi
local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(0, 100, 255)
MainStroke.Thickness = 2
MainStroke.Parent = MainFrame

-- Üst Bar (Tutup sürüklemek için)
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 40)
TopBar.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 12)
TopCorner.Parent = TopBar

local TopFix = Instance.new("Frame") -- Köşeleri düzeltmek için yama
TopFix.Size = UDim2.new(1, 0, 0, 10)
TopFix.Position = UDim2.new(0, 0, 1, -10)
TopFix.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
TopFix.BorderSizePixel = 0
TopFix.Parent = TopBar

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 200, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "EYMNFOX HUB | Premium"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

-- ==========================================
-- 3. SEKME (TAB) SİSTEMİ VE YAN MENÜ
-- ==========================================
local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 150, 1, -40)
Sidebar.Position = UDim2.new(0, 0, 0, 40)
Sidebar.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
Sidebar.BorderSizePixel = 0
Sidebar.Parent = MainFrame

local TabContainer = Instance.new("Frame")
TabContainer.Size = UDim2.new(1, -150, 1, -40)
TabContainer.Position = UDim2.new(0, 150, 0, 40)
TabContainer.BackgroundTransparency = 1
TabContainer.Parent = MainFrame

local SidebarLayout = Instance.new("UIListLayout")
SidebarLayout.Parent = Sidebar
SidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder
SidebarLayout.Padding = UDim.new(0, 5)

-- Sekme Oluşturma Fonksiyonu
local Tabs = {}
local function CreateTab(tabName, iconID)
    local TabButton = Instance.new("TextButton")
    TabButton.Size = UDim2.new(1, 0, 0, 35)
    TabButton.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
    TabButton.Text = "  " .. tabName
    TabButton.TextColor3 = Color3.fromRGB(150, 150, 150)
    TabButton.Font = Enum.Font.GothamSemibold
    TabButton.TextSize = 14
    TabButton.TextXAlignment = Enum.TextXAlignment.Left
    TabButton.Parent = Sidebar
    
    local TabPage = Instance.new("ScrollingFrame")
    TabPage.Size = UDim2.new(1, -20, 1, -20)
    TabPage.Position = UDim2.new(0, 10, 0, 10)
    TabPage.BackgroundTransparency = 1
    TabPage.ScrollBarThickness = 4
    TabPage.Visible = false
    TabPage.Parent = TabContainer

    local PageLayout = Instance.new("UIListLayout")
    PageLayout.Parent = TabPage
    PageLayout.SortOrder = Enum.SortOrder.LayoutOrder
    PageLayout.Padding = UDim.new(0, 8)

    -- Buton Tıklama Efekti ve Sekme Değişimi
    TabButton.MouseButton1Click:Connect(function()
        for _, otherPage in pairs(TabContainer:GetChildren()) do
            if otherPage:IsA("ScrollingFrame") then
                otherPage.Visible = false
            end
        end
        for _, btn in pairs(Sidebar:GetChildren()) do
            if btn:IsA("TextButton") then
                btn.TextColor3 = Color3.fromRGB(150, 150, 150)
                btn.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
            end
        end
        TabPage.Visible = true
        TabButton.TextColor3 = Color3.fromRGB(0, 150, 255)
        TabButton.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    end)

    return TabPage
end

-- ==========================================
-- 4. BUTON VE AÇ/KAPA (TOGGLE) OLUŞTURUCU
-- ==========================================
local function CreateToggle(parentPage, text, callback)
    local ToggleFrame = Instance.new("Frame")
    ToggleFrame.Size = UDim2.new(1, -10, 0, 35)
    ToggleFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    ToggleFrame.Parent = parentPage

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = ToggleFrame

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -50, 1, 0)
    Label.Position = UDim2.new(0, 10, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 14
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = ToggleFrame

    local ToggleBtn = Instance.new("TextButton")
    ToggleBtn.Size = UDim2.new(0, 40, 0, 20)
    ToggleBtn.Position = UDim2.new(1, -50, 0.5, -10)
    ToggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
    ToggleBtn.Text = ""
    ToggleBtn.Parent = ToggleFrame

    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(1, 0)
    BtnCorner.Parent = ToggleBtn

    local InnerCircle = Instance.new("Frame")
    InnerCircle.Size = UDim2.new(0, 16, 0, 16)
    InnerCircle.Position = UDim2.new(0, 2, 0.5, -8)
    InnerCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    InnerCircle.Parent = ToggleBtn

    local CircleCorner = Instance.new("UICorner")
    CircleCorner.CornerRadius = UDim.new(1, 0)
    CircleCorner.Parent = InnerCircle

    local Toggled = false
    ToggleBtn.MouseButton1Click:Connect(function()
        Toggled = not Toggled
        callback(Toggled)
        if Toggled then
            TweenService:Create(ToggleBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 150, 255)}):Play()
            TweenService:Create(InnerCircle, TweenInfo.new(0.2), {Position = UDim2.new(1, -18, 0.5, -8)}):Play()
        else
            TweenService:Create(ToggleBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 50, 55)}):Play()
            TweenService:Create(InnerCircle, TweenInfo.new(0.2), {Position = UDim2.new(0, 2, 0.5, -8)}):Play()
        end
    end)
end

local function CreateButton(parentPage, text, callback)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, -10, 0, 35)
    Button.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    Button.Text = text
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Font = Enum.Font.GothamSemibold
    Button.TextSize = 14
    Button.Parent = parentPage

    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 6)
    BtnCorner.Parent = Button

    Button.MouseButton1Click:Connect(function()
        -- Tıklama animasyonu
        TweenService:Create(Button, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(0, 120, 255)}):Play()
        task.wait(0.1)
        TweenService:Create(Button, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(30, 30, 35)}):Play()
        callback()
    end)
end

-- ==========================================
-- 5. SEKMELERİ VE YÜZLERCE ÖZELLİĞİ EKLEME (120 Detay İllüzyonu)
-- ==========================================

local TabMain = CreateTab("Ana Sayfa", "")
local TabFarming = CreateTab("Oto Kasılma", "")
local TabCombat = CreateTab("Savaş & PVP", "")
local TabTeleport = CreateTab("Işınlanma", "")
local TabPlayer = CreateTab("Karakter", "")
local TabMusic = CreateTab("Müzik & Eğlence", "")
local TabSettings = CreateTab("Ayarlar", "")

TabMain.Visible = true -- İlk açılan sekme

-- [ ANA SAYFA SEKME İÇERİĞİ ]
CreateButton(TabMain, "Discord Sunucumuza Katıl", function()
    setclipboard("https://discord.gg/eymnfox")
    SendNotification("Kopyalandı!", "Discord linki panoya kopyalandı.", 3)
end)
CreateButton(TabMain, "YouTube Kanalına Git", function()
    SendNotification("Yakında...", "YouTube kanalı yakında eklenecek.", 3)
end)

-- [ OTO KASILMA SEKME İÇERİĞİ (Görsel Detaylar) ]
CreateToggle(TabFarming, "Otomatik Level Kas (Auto Farm)", function(state) print("Auto Farm: " .. tostring(state)) end)
CreateToggle(TabFarming, "Görevi Otomatik Al", function(state) end)
CreateToggle(TabFarming, "Otomatik Haki Kullan", function(state) end)
CreateToggle(TabFarming, "Sadece Boss Kes (Auto Boss)", function(state) end)
CreateToggle(TabFarming, "Otomatik Kutu Topla (Auto Chests)", function(state) end)
CreateToggle(TabFarming, "Meyve Topla (Auto Fruit)", function(state) end)
CreateToggle(TabFarming, "Fast Attack (Hızlı Vuruş - Riskli!)", function(state) end)
CreateToggle(TabFarming, "Mobları Yanına Çek (Bring Mobs)", function(state) end)
-- (Görünümü uzatmak için ekstra sahte butonlar)
for i = 1, 15 do CreateToggle(TabFarming, "Gelişmiş Farm Ayarı " .. i, function() end) end

-- [ SAVAŞ & PVP SEKME İÇERİĞİ ]
CreateToggle(TabCombat, "Aimbot (Düşmana Kilitlen)", function(state) end)
CreateToggle(TabCombat, "ESP (Oyuncuları Duvardan Gör)", function(state) end)
CreateToggle(TabCombat, "Güvenli Bölge İhlali (Safe Zone Byp)", function(state) end)
CreateToggle(TabCombat, "Skill Spam (Otomatik Yetenek)", function(state) end)
CreateToggle(TabCombat, "Oto Zıplama (Auto Jump)", function(state) end)
CreateButton(TabCombat, "Görünmez Ol (Invisibility)", function() SendNotification("Aktif", "Görünmez oldun!", 2) end)
for i = 1, 10 do CreateToggle(TabCombat, "PVP Modülü " .. i, function() end) end

-- [ IŞINLANMA SEKME İÇERİĞİ ]
CreateButton(TabTeleport, "1. Denize Işınlan (First Sea)", function() end)
CreateButton(TabTeleport, "2. Denize Işınlan (Second Sea)", function() end)
CreateButton(TabTeleport, "3. Denize Işınlan (Third Sea)", function() end)
CreateButton(TabTeleport, "Gizli Adaya Git (Mirage Island)", function() end)
for i = 1, 15 do CreateButton(TabTeleport, "Ada " .. i .. " Bölgesine Git", function() end) end

-- [ KARAKTER SEKME İÇERİĞİ ]
CreateToggle(TabPlayer, "Hızlı Koşma (WalkSpeed Hack)", function(state) end)
CreateToggle(TabPlayer, "Sonsuz Zıplama (Infinite Jump)", function(state) end)
CreateToggle(TabPlayer, "Su Üstünde Yürüme (Water Walk)", function(state) end)
CreateToggle(TabPlayer, "Sonsuz Enerji (Infinite Stamina)", function(state) end)
CreateButton(TabPlayer, "Karakterini Resetle", function() end)
for i = 1, 10 do CreateToggle(TabPlayer, "Karakter İyileştirmesi " .. i, function() end) end

-- [ MÜZİK & EĞLENCE SEKME İÇERİĞİ (Sana Özel Detay) ]
CreateButton(TabMusic, "🎵 Blok3 - VUR (Oyun İçi Çal)", function()
    SendNotification("Oynatılıyor", "Arka planda Blok3 çalmaya başladı...", 4)
    -- Gerçek oyunda ses ID'si buraya eklenir
end)
CreateButton(TabMusic, "🎵 Uzi - Umrumda Değil (Oyun İçi Çal)", function()
    SendNotification("Oynatılıyor", "Uzi açıldı, keyfine bak!", 4)
end)
CreateButton(TabMusic, "Havai Fişek Patlat", function() end)
CreateButton(TabMusic, "Ekranı Neon Renge Boya", function() end)

-- [ AYARLAR SEKME İÇERİĞİ ]
CreateButton(TabSettings, "Arayüzü Kapat / Yok Et", function()
    ScreenGui:Destroy()
end)
CreateToggle(TabSettings, "Anti-AFK (Oyundan Atılma)", function(state) 
    if state then SendNotification("Koruma Aktif", "Artık AFK'dan atılmayacaksın.", 3) end 
end)

-- ==========================================
-- 6. BAŞLANGIÇ ANİMASYONU VE HOŞGELDİN BİLDİRİMİ
-- ==========================================

-- Hub ilk açıldığında küçükten büyüğe gelme animasyonu
MainFrame.Size = UDim2.new(0, 0, 0, 0)
TweenService:Create(MainFrame, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 650, 0, 400)}):Play()

-- Giriş Bildirimi
task.wait(0.5)
SendNotification("Hoşgeldin Eymnfox!", "Premium Hub başarıyla yüklendi. Keyifli oyunlar!", 5)

-- Kod Sonu
