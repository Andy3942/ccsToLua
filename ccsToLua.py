# coding=utf-8

import os
import math
import string
from xmltodict import parse
from xmltodict import unparse
import pprint
file_path = "/Users/bzx/Documents/CocosProjects/CocosProject/cocosstudio/TestLayer.csd"

class TOLua(object):
    _file_path = ""
    _class_name = ""
    _class_file_path = ""
    _data = {}
    _text = ""
    _head = ""
    _create_function = ""
    _body = ""
    def __init__(self, file_path):
        self._file_path = file_path
        self._class_name = os.path.splitext(os.path.basename(self._file_path))[0]
        self._class_file_path = "%s/%s.lua"%(os.path.dirname(self._file_path),self._class_name)

    def toCode(self):
        data = self._data["GameProjectFile"]["Content"]["Content"]["ObjectData"]
        className = "STLayer"
        self._text = "%s = class(\"%s\", function()\n\treturn %s:create()\nend)\n\n"%(self._class_name, self._class_name, className)
        self.nodeToCode(data, None)
        self._text += self._head + "\n"
        self._text += self._create_function + "\n"
        self._text += self._body
        self._text += self.appendCode(0, "function %s:getMemberNodeByName(name)"%(self._class_name))
        self._text += self.appendCode(1, "return self[\"_\" .. name]")
        self._text += self.appendCode(0, "end")
        self._text = self._text.expandtabs(4)
    def nodeToCode(self, data, parent):
        name = data["Name"]
        indent = 0
        self._head += self.appendCode(indent, "%s._%s = nil"%(self._class_name, name))
        if parent is None:
            self._create_function += self.appendCode(indent, "function %s:create()"%(self._class_name))
            indent += 1
            self._create_function += self.appendCode(indent, "local ret = %s:new()"%(self._class_name))
        else:
            self._body += self.appendCode(indent, "function %s:load%s()"%(self._class_name, name.capitalize()))
            indent += 1
            self._create_function += self.appendCode(indent, "ret:load%s()"%(name.capitalize()))
            customClassName = data.get("CustomClassName", None)
            className = data["ctype"]
            if customClassName is None:
                if className == "SingleNodeObjectData":
                    self._body += self.appendCode(indent, "self._%s = STNode:create()"%(name))
                elif className == "SpriteObjectData":
                    self._body += self.appendCode(indent, "self._%s = STSprite:create(\"%s\")"%(name, data["FileData"]["Path"]))
                #STButton
                elif className == "ButtonObjectData":
                    normalImage = data["NormalFileData"]["Path"]
                    selectedImage = data["PressedFileData"]["Path"]
                    disabledImage = data["DisabledFileData"]["Path"]
                    Scale9Enable = data.get("Scale9Enable", "false")
                    if Scale9Enable == "True":
                        Scale9Enable = "true"
                    normalImage = "\"%s\""%(normalImage)
                    if selectedImage == "Default/Button_Press.png":
                        selectedImage = "nil"
                    else:
                        selectedImage = "\"%s\""%(selectedImage)

                    if disabledImage == "Default/Button_Disable.png":
                        disabledImage = "nil"
                    else:
                        disabledImage = "\"%s\""%(disabledImage)
                    self._body += self.appendCode(indent, "self._%s = STButton:createWithImage(%s, %s, %s, %s)"%(name, normalImage, selectedImage, disabledImage, Scale9Enable))
                    if Scale9Enable == "true":
                        Scale9OriginX = float(data.get("Scale9OriginX", 0))
                        Scale9OriginY = float(data.get("Scale9OriginY", 0))
                        Scale9Width = float(data.get("Scale9Width"))
                        Scale9Height = float(data.get("Scale9Height"))
                        self._body += self.appendCode(indent, "self._%s:setCapInsets(CCRectMake(%s, %s, %s, %s))"%(name, Scale9OriginX, Scale9OriginY, Scale9Width, Scale9Height))
                elif className == "TextObjectData":
                    LabelText = data["LabelText"]
                    FontName = "g_sFontName"
                    FontResource = data.get("FontResource", None)
                    if FontResource is not None:
                        FontNamePath = FontResource["Path"]
                        if FontNamePath == "py.ttf":
                            FontName = "g_sFontPangWa"
                        else:
                            FontName = "g_sFontName"
                    FontSize = data["FontSize"]
                    self._body += self.appendCode(indent, "self._%s = STLabel:create(\"%s\", %s, %s)"%(name, LabelText, FontName, FontSize))
                    Alpha = data.get("Alpha", None)
                    if Alpha is not None:
                        data["CColor"]["A"] = Alpha
                    data["Size"] = None
                    # todo
                elif className == "TextFieldObjectData":
                    self._body += self.appendCode(indent, "self._%s = STSprite:create()"%(name))
                    # todo
                elif className == "LoadingBarObjectData":
                    self._body += self.appendCode(indent, "self._%s = STSprite:create()"%(name))
                    # todo
                elif className == "ImageViewObjectData":
                    Scale9OriginX = float(data.get("Scale9OriginX", 0))
                    Scale9OriginY = float(data.get("Scale9OriginY", 0))
                    Scale9Width = float(data.get("Scale9Width"))
                    Scale9Height = float(data.get("Scale9Height"))
                    capInset = "CCRectMake(%s, %s, %s, %s)"%(Scale9OriginX, Scale9OriginY, Scale9Width, Scale9Height)
                    self._body += self.appendCode(indent, "self._%s = STScale9Sprite:create(\"%s\", %s)"%(name, data["FileData"]["Path"], capInset))
                elif className == "CheckBoxObjectData":
                    self._body += self.appendCode(indent, "self._%s = STSprite:create()"%(name))
                    # todo
                elif className == "PageViewObjectData":
                    self._body += self.appendCode(indent, "self._%s = STSprite:create()"%(name))
                    # todo
                elif className == "PanelObjectData":
                    self._body += self.appendCode(indent, "self._%s = STLayout:create()"%(name))
                    # todo 
                elif className == "ScrollViewObjectData" or className == "ListViewObjectData":
                    if className == "ScrollViewObjectData":
                        self._body += self.appendCode(indent, "self._%s = STScrollView:create()"%(name))
                    elif className == "ListViewObjectData":
                        self._body += self.appendCode(indent, "self._%s = STTableView:create()"%(name))
                    #direction
                    ScrollDirectionType = data["ScrollDirectionType"]
                    if ScrollDirectionType == "Vertical":
                        self._body += self.appendCode(indent, "self._%s:setDirection(kCCScrollViewDirectionVertical)"%(name))
                    elif ScrollDirectionType == "Horizontal":
                        self._body += self.appendCode(indent, "self._%s:setDirection(kCCScrollViewDirectionHorizontal)"%(name))
                    #clipAble
                    ClipAble = data.get("ClipAble", "false")
                    if ClipAble == "false":
                        self._body += self.appendCode(indent, "self._%s:setClippingToBounds(false)"%(name))
                    IsBounceEnabled = data.get("IsBounceEnabled", "false")
                    if IsBounceEnabled == "false":
                        self._body += self.appendCode(indent, "self._%s:setBounceable(false)"%(name))
                    # todo
            #if customClassName == "":
            #addChild
            if parent == self._data["GameProjectFile"]["Content"]["Content"]["ObjectData"]["Name"]:
                self._body += self.appendCode(indent, "self:addNode(self._%s)"%(name))
            else:
                self._body += self.appendCode(indent, "self._%s:addNode(self._%s)"%(parent, name))
            #contentSize
            content_size = data.get("Size", None)
            if content_size is not None:
                width = float(content_size.get("X", 0))
                height = float(content_size.get("Y", 0))
                size = "CCSizeMake(%s, %s)"%(width, height)
                self._body += self.appendCode(indent, "self._%s:setNodeSize(%s)"%(name, size))
                if className == "ListViewObjectData":
                    self._body += self.appendCode(indent, "self._%s:setInnerNodeSize(%s)"%(name, size))
            #innerNodeSize
            if className == "ScrollViewObjectData":
                InnerNodeSize = data["InnerNodeSize"]
                width = InnerNodeSize.get("Width")
                height = InnerNodeSize.get("Height")
                self._body += self.appendCode(indent, "self._%s:setInnerNodeSize(CCSizeMake(%s, %s))"%(name, width, height))
            #tag
            tag = data.get("Tag", None)
            if tag is not None:
                self._body += self.appendCode(indent, "self._%s:setTag(%s)"%(name, float(tag)))
            #position
            position = data.get("Position", None)
            if position is not None:
                position_x = float(position.get("X", 0))
                position_y = float(position.get("Y", 0))
                if position_x != 0 or position_y != 0:
                    self._body += self.appendCode(indent, "self._%s:setPosition(ccp(%s, %s))"%(name, position_x, position_y))
            #PercentPosition
            PositionPercentXEnabled = data.get("PositionPercentXEnabled", None)
            if PositionPercentXEnabled is not None:
                PercentPositionX = float(data["PrePosition"]["X"])
                self._body += self.appendCode(indent, "self._%s:setPercentPositionXEnabled(true)"%(name))
                self._body += self.appendCode(indent, "self._%s:setPercentPositionX(%s)"%(name, PercentPositionX))
            PositionPercentYEnabled = data.get("PositionPercentYEnabled", None)
            if PositionPercentYEnabled is not None:
                PercentPositionY = float(data["PrePosition"]["Y"])
                self._body += self.appendCode(indent, "self._%s:setPercentPositionYEnabled(true)"%(name))
                self._body += self.appendCode(indent, "self._%s:setPercentPositionY(%s)"%(name, PercentPositionY))
            #scale
            scale = data.get("Scale", None)
            if scale is not None:
                scale_x = float(scale.get("ScaleX", 1))
                scale_y = float(scale.get("ScaleY", 1))
                if scale_x != 1:
                    self._body += self.appendCode(indent, "self._%s:setScaleX(%s)"%(name, scale_x))
                if scale_y != 1:
                    self._body += self.appendCode(indent, "self._%s:setScaleY(%s)"%(name, scale_y))
            #anchorPoint
            anchor_point = data.get("AnchorPoint", None)
            if anchor_point is not None:
                anchor_point_x = float(anchor_point.get("ScaleX", 0))
                anchor_point_y = float(anchor_point.get("ScaleY", 0))
                self._body += self.appendCode(indent, "self._%s:setAnchorPoint(ccp(%s, %s))"%(name, anchor_point_x, anchor_point_y))
            #color
            color = data.get("CColor", None)
            if color is not None:
                a = float(color.get("A", 0))
                r = float(color.get("R", 0))
                g = float(color.get("G", 0))
                b = float(color.get("B", 0))
                if a != 255 or r != 255 or g != 255 or b != 255:
                    self._body += self.appendCode(indent, "self._%s:setNodeColor(ccc3(%s, %s, %s))"%(name, r, g, b))
                    self._body += self.appendCode(indent, "self._%s:setNodeOpacity(%s)"%(name, a))
            #bgColor
            bgColor = data.get("SingleColor", None)
            if bgColor is not None:
                r = float(bgColor.get("R", 0))
                g = float(bgColor.get("G", 0))
                b = float(bgColor.get("B", 0))
                a = float(data.get("BackColorAlpha", 255))
                self._body += self.appendCode(indent, "self._%s:setBgColor(ccc3(%s, %s, %s))"%(name, r, g, b))
                self._body += self.appendCode(indent, "self._%s:setBgOpacity(%s)"%(name, a))
            TouchEnable = data.get("TouchEnable", None)
            if TouchEnable is not None:
                self._body += self.appendCode(indent, "self._%s:setTouchEnabled(true)"%(name))
            #end
            indent -= 1
            self._body += self.appendCode(indent, "end\n")

        children = data.get("Children", None)
        if children is not None:
            nodeData = children["NodeObjectData"]
            if isinstance(nodeData, dict):
                self.nodeToCode(nodeData, name)
            else:
                for child in nodeData:
                    self.nodeToCode(child, name)
        if parent is None:
            self._create_function += self.appendCode(1, "return ret")
            self._create_function += self.appendCode(0, "end")
    def appendCode(self, indent, statement):
        return "%s%s\n"%(self.getIndentStr(indent), statement)

    def writeToLua(self):
        print(self._class_name)
        print(self._class_file_path)
        print(self._file_path)
        fp = open(self._class_file_path, "w")
        #fp = open("/Users/bzx/Documents/sango/FknSango/CardSango/Resources/script/ccsToLua/TestLayer.lua", "w")
        fp.write(self._text)
        fp.close()
    
    def parseXml(self):
        fp = open(self._file_path, 'r')
        self._data = parse(fp.read())
        fp.close()
        pprint.pprint(self._data)

    def getIndentStr(self, indent):
        return " " * 4 * indent

print("\n\n\n\n\n\n\n\n\n")
toLua = TOLua(file_path)
toLua.parseXml()
toLua.toCode()
toLua.writeToLua()