<GameProjectFile>
  <PropertyGroup Type="Scene" Name="MoonShopLayer" ID="a5cc1050-9dbe-4e69-a75c-be515a17552b" Version="2.2.5.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.0000" />
      <ObjectData Name="Scene" Tag="24" ctype="GameNodeObjectData">
        <Size X="640.0000" Y="960.0000" />
        <Children>
          <AbstractNodeData Name="bgLayer" ActionTag="1597168482" Tag="26" IconVisible="False" TouchEnable="True" BackColorAlpha="102" ComboBoxIndex="1" ColorAngle="90.0000" ctype="PanelObjectData">
            <Size X="640.0000" Y="960.0000" />
            <Children>
              <AbstractNodeData Name="bgSprite" ActionTag="-1106020625" Tag="25" IconVisible="False" Scale9Enable="True" LeftEage="25" RightEage="25" TopEage="25" BottomEage="25" Scale9OriginX="25" Scale9OriginY="25" Scale9Width="5" Scale9Height="1" ctype="ImageViewObjectData">
                <Size X="640.0000" Y="960.0000" />
                <AnchorPoint />
                <Position />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="1.0000" Y="1.0000" />
                <FileData Type="Normal" Path="images/moon/moon_shop_bg.png" Plist="" />
              </AbstractNodeData>
              <AbstractNodeData Name="girlSprite" ActionTag="382466940" Tag="120" IconVisible="False" LeftMargin="-29.0000" RightMargin="257.0000" TopMargin="111.0883" BottomMargin="104.9117" ctype="SpriteObjectData">
                <Size X="412.0000" Y="744.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="177.0000" Y="476.9117" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.2766" Y="0.4968" />
                <PreSize />
                <FileData Type="Normal" Path="images/moon/moon_shop_girl.png" Plist="" />
                <BlendFunc Src="1" Dst="771" />
              </AbstractNodeData>
              <AbstractNodeData Name="titleBgSprite" ActionTag="-1405170931" Tag="27" IconVisible="False" PositionPercentYEnabled="True" LeftMargin="131.5000" RightMargin="147.5000" TopMargin="-3.8742" BottomMargin="798.8742" ctype="SpriteObjectData">
                <Size X="361.0000" Y="165.0000" />
                <Children>
                  <AbstractNodeData Name="titleSprite" ActionTag="1330545788" Tag="28" IconVisible="False" LeftMargin="107.5000" RightMargin="112.5000" TopMargin="89.5000" BottomMargin="24.5000" ctype="SpriteObjectData">
                    <Size X="141.0000" Y="51.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="178.0000" Y="50.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="0.4931" Y="0.3030" />
                    <PreSize />
                    <FileData Type="Normal" Path="images/moon/moon_shop_title.png" Plist="" />
                    <BlendFunc Src="1" Dst="771" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint ScaleX="0.5000" ScaleY="1.0000" />
                <Position X="312.0000" Y="963.8742" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.4875" Y="1.0040" />
                <PreSize X="0.5641" Y="0.1719" />
                <FileData Type="Normal" Path="images/moon/moon_shop_title_bg.png" Plist="" />
                <BlendFunc Src="1" Dst="771" />
              </AbstractNodeData>
            </Children>
            <AnchorPoint />
            <Position />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition />
            <PreSize X="1.0000" Y="1.0000" />
            <SingleColor A="255" R="150" G="200" B="255" />
            <FirstColor A="255" R="150" G="200" B="255" />
            <EndColor A="255" R="255" G="255" B="255" />
            <ColorVector ScaleY="1.0000" />
          </AbstractNodeData>
          <AbstractNodeData Name="backBtn" ActionTag="-1258118427" Tag="29" IconVisible="False" LeftMargin="533.5000" RightMargin="21.5000" TopMargin="32.4387" BottomMargin="858.5613" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="16" Scale9Height="14" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="ButtonObjectData">
            <Size X="85.0000" Y="69.0000" />
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="576.0000" Y="893.0613" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.9000" Y="0.9303" />
            <PreSize X="0.1328" Y="0.0719" />
            <TextColor A="255" R="65" G="65" B="70" />
            <DisabledFileData Type="Default" Path="Default/Button_Disable.png" Plist="" />
            <PressedFileData Type="Normal" Path="images/common/close_btn_h.png" Plist="" />
            <NormalFileData Type="Normal" Path="images/common/close_btn_n.png" Plist="" />
            <OutlineColor A="255" R="255" G="0" B="0" />
            <ShadowColor A="255" R="255" G="127" B="80" />
          </AbstractNodeData>
          <AbstractNodeData Name="boxBgSprite" ActionTag="-500083027" Tag="115" IconVisible="False" PositionPercentXEnabled="True" LeftMargin="70.0000" RightMargin="70.0000" TopMargin="167.9579" BottomMargin="635.0421" Scale9Enable="True" LeftEage="61" RightEage="61" TopEage="9" BottomEage="9" Scale9OriginX="61" Scale9OriginY="9" Scale9Width="65" Scale9Height="12" ctype="ImageViewObjectData">
            <Size X="500.0000" Y="157.0000" />
            <Children>
              <AbstractNodeData Name="Text_1" ActionTag="1260965555" Tag="117" IconVisible="False" LeftMargin="103.0000" RightMargin="305.0000" TopMargin="122.5000" BottomMargin="5.5000" FontSize="23" LabelText="天工宝箱" OutlineSize="1" ShadowOffsetX="1" ShadowOffsetY="1" ShadowEnabled="True" ctype="TextObjectData">
                <Size X="92.0000" Y="29.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="149.0000" Y="20.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="246" B="0" />
                <PrePosition X="0.2980" Y="0.1274" />
                <PreSize />
                <FontResource Type="Normal" Path="py.ttf" Plist="" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="0" G="0" B="0" />
              </AbstractNodeData>
              <AbstractNodeData Name="openBoxBtn" ActionTag="588427509" Tag="118" IconVisible="False" LeftMargin="277.0000" RightMargin="27.0000" TopMargin="43.5000" BottomMargin="40.5000" TouchEnable="True" FontSize="35" ButtonText="购买" Scale9Enable="True" LeftEage="52" RightEage="55" TopEage="11" BottomEage="11" Scale9OriginX="52" Scale9OriginY="11" Scale9Width="43" Scale9Height="51" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="ButtonObjectData">
                <Size X="196.0000" Y="73.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="375.0000" Y="77.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.7500" Y="0.4904" />
                <PreSize X="0.3920" Y="0.4650" />
                <FontResource Type="Normal" Path="py.ttf" Plist="" />
                <TextColor A="255" R="255" G="246" B="0" />
                <DisabledFileData Type="Default" Path="Default/Button_Disable.png" Plist="" />
                <PressedFileData Type="Normal" Path="images/common/btn/btn_purple2_h.png" Plist="" />
                <NormalFileData Type="Normal" Path="images/common/btn/btn_purple2_n.png" Plist="" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="255" G="127" B="80" />
              </AbstractNodeData>
              <AbstractNodeData Name="remainBoxTimesLabel" ActionTag="-618621986" Tag="136" IconVisible="False" LeftMargin="346.5000" RightMargin="96.5000" TopMargin="120.5000" BottomMargin="9.5000" FontSize="23" LabelText="10/10" OutlineSize="1" ShadowOffsetX="1" ShadowOffsetY="1" ShadowEnabled="True" ctype="TextObjectData">
                <Size X="57.0000" Y="27.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="375.0000" Y="23.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="0" G="255" B="24" />
                <PrePosition X="0.7500" Y="0.1465" />
                <PreSize />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="0" G="0" B="0" />
              </AbstractNodeData>
              <AbstractNodeData Name="Sprite_4" ActionTag="-616838270" Tag="137" IconVisible="False" LeftMargin="67.5000" RightMargin="271.5000" TopMargin="11.0000" BottomMargin="28.0000" ctype="SpriteObjectData">
                <Size X="161.0000" Y="118.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="148.0000" Y="87.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.2960" Y="0.5541" />
                <PreSize />
                <FileData Type="Normal" Path="images/moon/moon_box.png" Plist="" />
                <BlendFunc Src="1" Dst="771" />
              </AbstractNodeData>
            </Children>
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="320.0000" Y="713.5421" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.5000" Y="0.7433" />
            <PreSize X="0.7813" Y="0.1635" />
            <FileData Type="Normal" Path="images/common/bg/9s_purple.png" Plist="" />
          </AbstractNodeData>
          <AbstractNodeData Name="refreshTimeLabel" ActionTag="282077396" Tag="119" IconVisible="False" LeftMargin="47.0000" RightMargin="317.0000" TopMargin="910.9960" BottomMargin="25.0041" FontSize="21" LabelText="下次商品刷新倒计时:00:00:00" OutlineSize="1" ShadowOffsetX="1" ShadowOffsetY="1" ShadowEnabled="True" ctype="TextObjectData">
            <Size X="276.0000" Y="24.0000" />
            <AnchorPoint ScaleY="0.5000" />
            <Position X="47.0000" Y="37.0041" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="0" G="255" B="24" />
            <PrePosition X="0.0734" Y="0.0385" />
            <PreSize />
            <OutlineColor A="255" R="255" G="0" B="0" />
            <ShadowColor A="255" R="0" G="0" B="0" />
          </AbstractNodeData>
          <AbstractNodeData Name="goodsTableViewBg" ActionTag="-842879484" Tag="121" IconVisible="False" LeftMargin="152.5000" RightMargin="16.5000" TopMargin="334.4538" BottomMargin="133.5462" Scale9Enable="True" LeftEage="49" RightEage="51" TopEage="50" BottomEage="49" Scale9OriginX="49" Scale9OriginY="50" Scale9Width="16" Scale9Height="25" ctype="ImageViewObjectData">
            <Size X="471.0000" Y="492.0000" />
            <Children>
              <AbstractNodeData Name="goodsTableView" ActionTag="439664983" Tag="125" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" TopMargin="11.0000" BottomMargin="11.0000" TouchEnable="True" ClipAble="True" BackColorAlpha="0" ComboBoxIndex="1" ColorAngle="90.0000" ScrollDirectionType="0" DirectionType="Vertical" ctype="ListViewObjectData">
                <Size X="471.0000" Y="470.0000" />
                <Children>
                  <AbstractNodeData Name="goodsCell" ActionTag="-1169664730" Tag="126" IconVisible="False" RightMargin="16.0000" TopMargin="-0.5000" BottomMargin="324.5000" Scale9Enable="True" LeftEage="38" RightEage="47" TopEage="40" BottomEage="40" Scale9OriginX="38" Scale9OriginY="40" Scale9Width="31" Scale9Height="44" ctype="ImageViewObjectData">
                    <Size X="455.0000" Y="146.0000" />
                    <Children>
                      <AbstractNodeData Name="infoBg" ActionTag="1300092696" ZOrder="1" Tag="127" IconVisible="False" PositionPercentYEnabled="True" LeftMargin="19.0000" RightMargin="146.0000" TopMargin="20.0000" BottomMargin="20.0000" Scale9Enable="True" LeftEage="24" RightEage="24" TopEage="24" BottomEage="24" Scale9OriginX="24" Scale9OriginY="24" Scale9Width="27" Scale9Height="27" ctype="ImageViewObjectData">
                        <Size X="290.0000" Y="106.0000" />
                        <Children>
                          <AbstractNodeData Name="goodsIcon" ActionTag="-669374612" Tag="128" IconVisible="False" PositionPercentYEnabled="True" LeftMargin="13.0000" RightMargin="192.0000" TopMargin="8.0000" BottomMargin="8.0000" TouchEnable="True" BackColorAlpha="94" ComboBoxIndex="1" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                            <Size X="90.0000" Y="90.0000" />
                            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                            <Position X="58.0000" Y="53.0000" />
                            <Scale ScaleX="1.0000" ScaleY="1.0000" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <PrePosition X="0.1966" Y="0.5000" />
                            <PreSize X="0.1978" Y="0.6164" />
                            <SingleColor A="255" R="0" G="0" B="0" />
                            <FirstColor A="255" R="150" G="200" B="255" />
                            <EndColor A="255" R="255" G="255" B="255" />
                            <ColorVector ScaleY="1.0000" />
                          </AbstractNodeData>
                          <AbstractNodeData Name="goodsNameLabel" ActionTag="2122381350" Tag="129" IconVisible="False" LeftMargin="115.0000" RightMargin="32.0000" TopMargin="9.5000" BottomMargin="65.5000" FontSize="25" LabelText="Text Label" OutlineSize="1" ShadowOffsetX="1" ShadowOffsetY="1" ShadowEnabled="True" ctype="TextObjectData">
                            <Size X="148.0000" Y="31.0000" />
                            <AnchorPoint ScaleY="0.5032" />
                            <Position X="115.0000" Y="81.0995" />
                            <Scale ScaleX="1.0000" ScaleY="1.0000" />
                            <CColor A="255" R="255" G="246" B="0" />
                            <PrePosition X="0.3898" Y="0.7651" />
                            <PreSize />
                            <FontResource Type="Normal" Path="py.ttf" Plist="" />
                            <OutlineColor A="255" R="255" G="0" B="0" />
                            <ShadowColor A="255" R="0" G="0" B="0" />
                          </AbstractNodeData>
                          <AbstractNodeData Name="costNameLabel" ActionTag="73843581" Tag="130" IconVisible="False" LeftMargin="115.0000" RightMargin="98.0000" TopMargin="44.5000" BottomMargin="40.5000" FontSize="18" LabelText="Text Label" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="1" ShadowEnabled="True" ctype="TextObjectData">
                            <Size X="82.0000" Y="21.0000" />
                            <AnchorPoint ScaleY="0.5000" />
                            <Position X="115.0000" Y="51.0000" />
                            <Scale ScaleX="1.0000" ScaleY="1.0000" />
                            <CColor A="255" R="255" G="246" B="0" />
                            <PrePosition X="0.3898" Y="0.4811" />
                            <PreSize />
                            <OutlineColor A="255" R="255" G="0" B="0" />
                            <ShadowColor A="255" R="0" G="0" B="0" />
                          </AbstractNodeData>
                          <AbstractNodeData Name="goodsPriceLabel" ActionTag="532396749" Tag="131" IconVisible="False" LeftMargin="220.0000" RightMargin="35.0000" TopMargin="44.5000" BottomMargin="40.5000" FontSize="18" LabelText="9999" OutlineSize="1" ShadowOffsetX="1" ShadowOffsetY="1" ShadowEnabled="True" ctype="TextObjectData">
                            <Size X="40.0000" Y="21.0000" />
                            <AnchorPoint ScaleY="0.5000" />
                            <Position X="220.0000" Y="51.0000" />
                            <Scale ScaleX="1.0000" ScaleY="1.0000" />
                            <CColor A="255" R="255" G="246" B="0" />
                            <PrePosition X="0.7458" Y="0.4811" />
                            <PreSize />
                            <OutlineColor A="255" R="255" G="0" B="0" />
                            <ShadowColor A="255" R="0" G="0" B="0" />
                          </AbstractNodeData>
                          <AbstractNodeData Name="curCountLabel" ActionTag="1904118009" Tag="132" IconVisible="False" LeftMargin="115.0000" RightMargin="108.0000" TopMargin="73.5000" BottomMargin="11.5000" FontSize="18" LabelText="当前拥有" OutlineSize="1" ShadowOffsetX="1" ShadowOffsetY="1" ShadowEnabled="True" ctype="TextObjectData">
                            <Size X="72.0000" Y="21.0000" />
                            <AnchorPoint ScaleY="0.5000" />
                            <Position X="115.0000" Y="22.0000" />
                            <Scale ScaleX="1.0000" ScaleY="1.0000" />
                            <CColor A="255" R="0" G="255" B="24" />
                            <PrePosition X="0.3898" Y="0.2075" />
                            <PreSize />
                            <OutlineColor A="255" R="255" G="0" B="0" />
                            <ShadowColor A="255" R="0" G="0" B="0" />
                          </AbstractNodeData>
                        </Children>
                        <AnchorPoint ScaleY="0.5000" />
                        <Position X="19.0000" Y="73.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.0418" Y="0.5000" />
                        <PreSize X="0.6374" Y="0.7260" />
                        <FileData Type="Normal" Path="images/common/s9_3.png" Plist="" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="buyBtn" Visible="False" ActionTag="607432030" Tag="133" IconVisible="False" LeftMargin="311.5000" RightMargin="24.5000" TopMargin="24.0000" BottomMargin="58.0000" TouchEnable="True" FontSize="30" ButtonText="购买" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="16" Scale9Height="14" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="ButtonObjectData">
                        <Size X="119.0000" Y="64.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="371.0000" Y="90.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.8154" Y="0.6164" />
                        <PreSize X="0.2615" Y="0.4384" />
                        <FontResource Type="Normal" Path="py.ttf" Plist="" />
                        <TextColor A="255" R="255" G="228" B="0" />
                        <DisabledFileData Type="Default" Path="Default/Button_Disable.png" Plist="" />
                        <PressedFileData Type="Normal" Path="images/common/btn/btn_violet_h.png" Plist="" />
                        <NormalFileData Type="Normal" Path="images/common/btn/btn_violet_n.png" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="255" G="127" B="80" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="restTimesLabel" ActionTag="-1728523677" Tag="134" IconVisible="False" LeftMargin="315.5000" RightMargin="28.5000" TopMargin="86.5000" BottomMargin="32.5000" FontSize="23" LabelText="兑换次数:4" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                        <Size X="111.0000" Y="27.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="371.0000" Y="46.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="120" G="37" B="0" />
                        <PrePosition X="0.8154" Y="0.3151" />
                        <PreSize />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="255" G="127" B="80" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="exchangeBtn" ActionTag="1102804009" Tag="135" IconVisible="False" LeftMargin="311.5000" RightMargin="24.5000" TopMargin="24.0000" BottomMargin="58.0000" TouchEnable="True" FontSize="30" ButtonText="兑换" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="16" Scale9Height="14" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="ButtonObjectData">
                        <Size X="119.0000" Y="64.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="371.0000" Y="90.0000" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.8154" Y="0.6164" />
                        <PreSize X="0.2615" Y="0.4384" />
                        <FontResource Type="Normal" Path="py.ttf" Plist="" />
                        <TextColor A="255" R="255" G="228" B="0" />
                        <DisabledFileData Type="Default" Path="Default/Button_Disable.png" Plist="" />
                        <PressedFileData Type="Normal" Path="images/common/btn/btn_blue_h.png" Plist="" />
                        <NormalFileData Type="Normal" Path="images/common/btn/btn_blue_n.png" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="255" G="127" B="80" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="227.5000" Y="397.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="0.0488" Y="0.9511" />
                    <PreSize X="0.9660" Y="0.3106" />
                    <FileData Type="Normal" Path="images/reward/cell_back.png" Plist="" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="235.5000" Y="246.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.5000" Y="0.5000" />
                <PreSize X="1.0000" Y="0.9553" />
                <SingleColor A="255" R="150" G="150" B="255" />
                <FirstColor A="255" R="150" G="150" B="255" />
                <EndColor A="255" R="255" G="255" B="255" />
                <ColorVector ScaleY="1.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="Image_4" ActionTag="-956040157" Tag="122" IconVisible="False" PositionPercentXEnabled="True" LeftMargin="110.0000" RightMargin="110.0000" TopMargin="489.0000" BottomMargin="-42.0000" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="9" BottomEage="9" Scale9OriginX="15" Scale9OriginY="9" Scale9Width="157" Scale9Height="12" ctype="ImageViewObjectData">
                <Size X="251.0000" Y="45.0000" />
                <Children>
                  <AbstractNodeData Name="curGodCardLabel" ActionTag="-815893276" Tag="123" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="80.0000" RightMargin="80.0000" TopMargin="11.0000" BottomMargin="11.0000" FontSize="25" LabelText="当前天工令" OutlineSize="1" ShadowOffsetX="1" ShadowOffsetY="1" ShadowEnabled="True" ctype="TextObjectData">
                    <Size X="125.0000" Y="31.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="125.5000" Y="22.5000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="246" B="0" />
                    <PrePosition X="0.5000" Y="0.5000" />
                    <PreSize X="0.3625" Y="0.5111" />
                    <FontResource Type="Normal" Path="py.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="0" G="0" B="0" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint ScaleX="0.5000" ScaleY="1.0000" />
                <Position X="235.5000" Y="3.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.5000" Y="0.0061" />
                <PreSize X="0.5329" Y="0.0915" />
                <FileData Type="Normal" Path="images/common/bg/9s_purple.png" Plist="" />
              </AbstractNodeData>
            </Children>
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="388.0000" Y="379.5462" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.6062" Y="0.3954" />
            <PreSize X="0.7359" Y="0.5125" />
            <FileData Type="Normal" Path="images/common/bg/f_9s_3.png" Plist="" />
          </AbstractNodeData>
          <AbstractNodeData Name="refreshBtn" ActionTag="-1569612496" Tag="124" IconVisible="False" LeftMargin="404.0000" RightMargin="34.0000" TopMargin="876.0198" BottomMargin="10.9802" TouchEnable="True" FontSize="35" ButtonText="刷新" Scale9Enable="True" LeftEage="55" RightEage="52" TopEage="11" BottomEage="16" Scale9OriginX="55" Scale9OriginY="11" Scale9Width="43" Scale9Height="46" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="ButtonObjectData">
            <Size X="202.0000" Y="73.0000" />
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="505.0000" Y="47.4802" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.7891" Y="0.0495" />
            <PreSize X="0.3156" Y="0.0760" />
            <FontResource Type="Normal" Path="py.ttf" Plist="" />
            <TextColor A="255" R="255" G="246" B="0" />
            <DisabledFileData Type="Default" Path="Default/Button_Disable.png" Plist="" />
            <PressedFileData Type="Normal" Path="images/common/btn/btn_purple2_h.png" Plist="" />
            <NormalFileData Type="Normal" Path="images/common/btn/btn_purple2_n.png" Plist="" />
            <OutlineColor A="255" R="255" G="0" B="0" />
            <ShadowColor A="255" R="255" G="127" B="80" />
          </AbstractNodeData>
        </Children>
      </ObjectData>
    </Content>
  </Content>
</GameProjectFile>