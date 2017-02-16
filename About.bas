Type=Activity
Version=6.5
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
#Region  Activity Attributes 
	#FullScreen: False
	#IncludeTitle: True
#End Region

Sub Process_Globals
	'These global variables will be declared once when the application starts.
	'These variables can be accessed from all modules.
Dim t2 As Timer
End Sub

Sub Globals
	'These global variables will be redeclared each time the activity is created.
	'These variables can only be accessed from this module.
	Dim su As StringUtils 
	Dim p As PhoneIntents 
	Dim lstOne As ListView 
	Dim AdView1 As AdView
	Dim Interstitial As InterstitialAd
End Sub

Sub Activity_Create(FirstTime As Boolean)
	AdView1.Initialize("ad","ca-app-pub-4173348573252986/7457565356")
	AdView1.LoadAd
	Activity.AddView(AdView1,0%x,100%y - 50dip,100%x,50dip)

	Interstitial.Initialize("interstitial","ca-app-pub-4173348573252986/1411031750")
	Interstitial.LoadAd
	
	t2.Initialize("t2",30000)
	t2.Enabled = True
	
	'Do not forget to load the layout file created with the visual designer. For example:
	'Activity.LoadLayout("Layout1")
	Activity.Title = "About"
	Activity.Color = Colors.RGB (235,235,235)
	
	Dim imvLogo As ImageView 
	imvLogo.Initialize ("")
	imvLogo.Bitmap = LoadBitmap(File.DirAssets , "logo.png")
	imvLogo.Gravity = Gravity.FILL 
	Activity.AddView ( imvLogo , 50%x - 50dip  , 20dip ,  100dip  ,  100dip )
	
	Dim lblName As  Label 
	Dim bg As ColorDrawable 
	bg.Initialize (Colors.DarkGray , 10dip)
	lblName.Initialize ("")
	lblName.Background = bg
	lblName.Gravity = Gravity.CENTER 
	lblName.Text = "Dtac APN + Tracker"
	lblName.TextSize = 13
	lblName.TextColor = Colors.White 
	Activity.AddView (lblName , 100%x / 2 - 90dip , 130dip , 180dip , 50dip)
	lblName.Height = su.MeasureMultilineTextHeight (lblName, lblName.Text ) + 5dip
	
	
	Dim c As ColorDrawable 
	c.Initialize (Colors.White , 10dip )
	lstOne.Initialize ("lstOnes")
	lstOne.Background = c
	lstOne.SingleLineLayout .Label.TextSize = 12
	lstOne.SingleLineLayout .Label .TextColor = Colors.DarkGray 
	lstOne.SingleLineLayout .Label .Gravity = Gravity.CENTER 
	lstOne.SingleLineLayout .ItemHeight = 40dip
	lstOne.AddSingleLine2 ("Developed By : Khun Htetz Naing    ", 1)
	lstOne.AddSingleLine2 ("Website : www.HtetzNaing.com    ",2)
	lstOne.AddSingleLine2 ("Facebook : www.facebook.com/Khun.Htetz.Naing   ", 3)
	Activity.AddView ( lstOne, 30dip , 170dip , 100%x -  60dip, 122dip)
	
	Dim lblCredit As Label 
	lblCredit.Initialize ("lblCredit")
	lblCredit.TextColor = Colors.RGB (48,154,6)
	lblCredit.TextSize = 13
	lblCredit.Gravity = Gravity.CENTER 
	lblCredit.Text = "B4x Myanmar Programmers Group"
	Activity.AddView (lblCredit, 10dip, 310dip, 100%x - 20dip, 50dip)
	lblCredit.Height = su.MeasureMultilineTextHeight (lblCredit, lblCredit.Text )
		
End Sub

Sub lblCredit_Click
	StartActivity(p.OpenBrowser ("https://www.facebook.com/groups/316136215260862/"))
End Sub
Sub Activity_Resume
     
End Sub

Sub Activity_Pause (UserClosed As Boolean)
     
End Sub

Sub lstOnes_ItemClick (Position As Int, Value As Object)
     Select Value
	 	Case 2
			Dim Facebook As Intent
			Facebook.Initialize(Facebook.ACTION_VIEW, "http://www.htetznaing.com")
			StartActivity(Facebook)
		Case 3
		Try
 
			Dim Facebook As Intent
 
			Facebook.Initialize(Facebook.ACTION_VIEW, "fb://page/627699334104477")
			StartActivity(Facebook)
 
		Catch
 
			Dim i As Intent
			i.Initialize(i.ACTION_VIEW, "https://m.facebook.com/MmFreeAndroidApps")
 
			StartActivity(i)
 
		End Try
	 End Select
End Sub


Sub t2_Tick
		If Interstitial.Ready Then Interstitial.Show Else Interstitial.LoadAd
End Sub
