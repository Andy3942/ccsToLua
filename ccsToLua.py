# coding=utf-8

import os
import math
import string
from xml.etree import ElementTree as ET
from xml.dom import minidom

file_path = "/Users/bzx/Documents/CocosProjects/CocosProject/cocosstudio/csTest.csd"

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
		className = self._data.get("className", None)
		if className is not None:
			className = "CCLayer"
		self._text = "%s = class(\"%s\", function()\n\treturn %s:create()\nend)\n\n"%(self._class_name, self._class_name, className)
		self.nodeToCode(self._data, None)
		self._text += self._head + "\n"
		self._text += self._create_function + "\n"
		self._text += self._body
		self._text = self._text.expandtabs(4)

	def nodeToCode(self, data, parent):
		name = data["name"]
		indent = 0
		self._head = self.appendCode(indent, self._head, "%s._%s = nil"%(self._class_name, name))
		if parent is None:
			self._create_function = self.appendCode(indent, self._create_function, "function %s:create()"%(self._class_name))
			indent += 1
			self._create_function = self.appendCode(indent, self._create_function, "local ret = %s:new()"%(self._class_name))
		else:
			self._body = self.appendCode(indent, self._body, "function %s:load%s()"%(self._class_name, name.capitalize()))
			indent += 1
			self._create_function = self.appendCode(indent, self._create_function, "ret:load%s()"%(name.capitalize()))
			customClassName = data["customClassName"]
			className = data["className"]
			if customClassName is None:
				if className == "SingleNodeObjectData":
					self._body = self.appendCode(indent, self._body, "self._%s = CCNode:create()"%(name))
				elif className == "SpriteObjectData":
					self._body = self.appendCode(indent, self._body, "self._%s = CCSprite:create(\"%s\")"%(name, data["image"]))
				elif className == "ButtonObjectData":
					self._body = self.appendCode(indent, self._body, "self._%s = CCSprite:create()"%(name))
					# todo
				elif className == "TextObjectData":
					self._body = self.appendCode(indent, self._body, "self._%s = CCSprite:create()"%(name))
					# todo
				elif className == "TextFieldObjectData":
					self._body = self.appendCode(indent, self._body, "self._%s = CCSprite:create()"%(name))
					# todo
				elif className == "LoadingBarObjectData":
					self._body = self.appendCode(indent, self._body, "self._%s = CCSprite:create()"%(name))
					# todo
				elif className == "ImageViewObjectData":
					self._body = self.appendCode(indent, self._body, "self._%s = CCSprite:create()"%(name))
					# todo
				elif className == "CheckBoxObjectData":
					self._body = self.appendCode(indent, self._body, "self._%s = CCSprite:create()"%(name))
					# todo
				elif className == "ListViewObjectData":
					self._body = self.appendCode(indent, self._body, "self._%s = CCSprite:create()"%(name))
					# todo
				elif className == "PageViewObjectData":
					self._body = self.appendCode(indent, self._body, "self._%s = CCSprite:create()"%(name))
					# todo
				elif className == "PanelObjectData":
					self._body = self.appendCode(indent, self._body, "self._%s = CCSprite:create()"%(name))
					# todo 
				elif className == "ScrollViewObjectData":
					self._body = self.appendCode(indent, self._body, "self._%s = CCSprite:create()"%(name))
					# todo

			#if customClassName == "":
			tag = data.get("tag", None)
			if tag is not None:
				self._body = self.appendCode(indent, self._body, "self._%s:setTag(%s)"%(name, tag))
			position = data.get("position", None)
			if position is not None:
				self._body = self.appendCode(indent, self._body, "self._%s:setPosition(ccp(%s, %s))"%(name, position["x"], position["y"]))
			scale = data.get("scale", None)
			if scale is not None:
				self._body = self.appendCode(indent, self._body, "self._%s:setScaleX(%s)"%(name, scale["x"]))
				self._body = self.appendCode(indent, self._body, "self._%s:setScaleY(%s)"%(name, scale["y"]))
			anchorPoint = data.get("anchorPoint", None)
			if anchorPoint is not None:
				self._body = self.appendCode(indent, self._body, "self._%s:setAnchorPoint(ccp(%s, %s))"%(name, anchorPoint["x"], anchorPoint["y"]))
			color = data.get("color", None)
			if color is not None:
				self._body = self.appendCode(indent, self._body, "self._%s:setColor(ccc3(%s, %s, %s))"%(name, color["r"], color["g"], color["b"]))
				self._body = self.appendCode(indent, self._body, "self._%s:setOpacity(%s)"%(name, color["a"]))
			contentSize = data.get("contentSize", None)
			if contentSize is not None:
				self._body = self.appendCode(indent, self._body, "self._%s:setContentSize(CCSizeMake(%s, %s))"%(name, contentSize["width"], contentSize["height"]))
			if parent == self._data["name"]:
				self._body = self.appendCode(indent, self._body, "self:addChild(self._%s)"%(name))
			else:
				self._body = self.appendCode(indent, self._body, "self._%s:addChild(self._%s)"%(parent, name))
			indent -= 1
			self._body = self.appendCode(indent, self._body, "end\n")
		children = data.get("children", None)
		if children is not None:
			for child in children:
				self.nodeToCode(child, name)
		if parent is None:
			self._create_function = self.appendCode(1, self._create_function, "return ret")
			self._create_function = self.appendCode(0, self._create_function, "end")
	def appendCode(self, indent, code, statement):
		code += "%s%s\n"%(self.getIndentStr(indent), statement)
		return code

	def writeToLua(self):
		print(self._class_name)
		print(self._class_file_path)
		print(self._file_path)
		fp = open(self._class_file_path, "w")
		fp.write(self._text)
		fp.close()
	
	def parseXml(self):
		tree = ET.parse(self._file_path)
		root_node_e = tree.find("Content/Content/ObjectData")
		self.getNodeData(root_node_e, self._data)

	def getNodeData(self, e, data):
		data["name"] = e.get("Name")
		data["className"] = e.get("ctype")
		data["customClassName"] = e.get("CustomClassName")
		tag = e.get("Tag")
		if tag is not None:
			data["tag"] = float(tag)
		position_e = e.find("Position")
		if position_e is not None:
			data["position"] = {}
			data["position"]["x"] = float(position_e.get("X", 0))
			data["position"]["y"] = float(position_e.get("Y", 0))
		scale_e = e.find("Scale")
		if scale_e is not None:
			scale_x = float(scale_e.get("ScaleX", 1))
			scale_y = float(scale_e.get("ScaleY", 1))
			if scale_x != 1 or scale_y != 1: 
				data["scale"] = {}
				data["scale"]["x"] = scale_x
				data["scale"]["y"] = scale_y
		anchor_point_e = e.find("AnchorPoint")
		if anchor_point_e is not None:
			data["anchorPoint"] = {}
			data["anchorPoint"]["x"] = float(anchor_point_e.get("ScaleX", 0))
			data["anchorPoint"]["y"] = float(anchor_point_e.get("ScaleY", 0))
		color_e = e.find("CColor")
		if color_e is not None:
			a = float(color_e.get("A", 255))
			r = float(color_e.get("R", 255))
			g = float(color_e.get("G", 255))
			b = float(color_e.get("B", 255))
			if a != 255 or r != 255 or g != 255 or b != 255:
				data["color"] = {}
				data["color"]["a"] = a
				data["color"]["r"] = r
				data["color"]["g"] = g
				data["color"]["b"] = b
		size_e = e.find("Size")
		if size_e:
			data["contentSize"] = {}
			data["contentSize"]["width"] = float(size_e.get("X", 0))
			data["contentSize"]["height"] = float(size_e.get("Y", 0))
		file_e = e.find("FileData")
		if file_e is not None:
			data["image"] = file_e.get("Path", "default.png")
		children_e = e.findall("Children/NodeObjectData")
		if children_e is not None:
			data["children"] = [i for i in range(len(children_e))]
			for i in range(0, len(children_e)):
				child_e = children_e[i]
				data["children"][i] = {}
				self.getNodeData(child_e, data["children"][i])
	
	def printData(self, data, indent):
		self.codePrint(indent, "node = {")
		indent += 1
		self.codePrint(indent, "name = ", data["name"])
		self.codePrint(indent, "className = ", data["className"])
		if data.get("customClassName", None) is not None:
			self.codePrint(indent, "customClassName = ", data["customClassName"])
		if data.get("tag", None) is not None:
			self.codePrint(indent, "tag = ", data["tag"])
		if data.get("position", None) is not None:
			self.codePrint(indent, "position = ", data["position"])
		if data.get("scale", None) is not None:
			self.codePrint(indent, "scale = ", data["scale"])
		if data.get("anchorPoint", None) is not None:
			self.codePrint(indent, "anchorPoint = ", data["anchorPoint"])
		if data.get("color", None) is not None:
			self.codePrint(indent, "color = ", data["color"])
		if data.get("contentSize", None) is not None:
			self.codePrint(indent, "contentSize = ", data["contentSize"])
		if data.get("image", None) is not None:
			self.codePrint(indent, "image = ", data["image"])
		if data.get("children", None) is not None:
			self.codePrint(indent, "children = {")
			indent += 1
			for child in data["children"]:
				self.printData(child, indent + 1)
			indent -= 1
			self.codePrint(indent, "}")
		indent -= 1
		self.codePrint(indent, "}")

	def codePrint(self, indent, *args):
		indent_str = self.getIndentStr(indent)
		print(indent_str, *args)
	def getIndentStr(self, indent):
		return " " * 4 * indent

print("\n\n\n\n\n\n\n\n\n")
toLua = TOLua(file_path)
toLua.parseXml()
toLua.printData(toLua._data, 0)
toLua.toCode()
toLua.writeToLua()