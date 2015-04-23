# coding=utf-8

import os
import math
import string
from xml.etree import ElementTree as ET
from xml.dom import minidom

file_path = "/Users/bzx/Documents/CocosProjects/CocosProject/cocosstudio/TestLayer.csd"

class TOLua(object):
	_file_path = ""
	_class_name = ""
	_class_file_path = ""
	_data = {}
	_text = ""
	_head = ""
	_body = ""
	def __init__(self, file_path):
		self._file_path = file_path
		self._class_name = os.path.splitext(os.path.basename(self._file_path))[0]
		self._class_file_path = "%s/%s.lua"%(os.path.dirname(self._file_path),self._class_name)

	def toCode(self):
		self._text = "%s = class(\"%s\", function \n\treturn %s:create()\nend)\n\n"%(self._class_name, self._class_name, self._data["class"])
		self.nodeToCode(self._data)
		self._text += self._head
		self._text += self._body
		self._text = self._text.expandtabs(4)

	def nodeToCode(self, data):
		self._head += "%s.%s = nil\n"%(self._class_name, data["name"])
		_body += "function %s.create()\n"
		
		#self.codePrint(indent, "name = ", data["name"])
		#self.codePrint(indent, "class = ", data["class"])
		# self.codePrint(indent, "tag = ", data["tag"])
		# self.codePrint(indent, "position = ", data["position"])
		# self.codePrint(indent, "scale = ", data["scale"])
		# self.codePrint(indent, "anchorPoint = ", data["anchorPoint"])
		# self.codePrint(indent, "color = ", data["color"])
		# self.codePrint(indent, "contentSize = ", data["contentSize"])
		# if data.get("image", None):
		# 	self.codePrint(indent, "image = ", data["image"])
		if data.get("children", None):
			for child in data["children"]:
				self.nodeToCode(child)

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
		data["class"] = e.get("CustomClassName", "CCLayer")
		data["tag"] = e.get("Tag", 0)
		position_e = e.find("Position")
		data["position"] = {}
		data["position"]["x"] = position_e.get("X", 0)
		data["position"]["y"] = position_e.get("Y", 0)
		scale_e = e.find("Scale")
		data["scale"] = {}
		data["scale"]["x"] = scale_e.get("ScaleX", 1)
		data["scale"]["y"] = scale_e.get("ScaleY", 1)
		anchor_point_e = e.find("AnchorPoint")
		data["anchorPoint"] = {}
		data["anchorPoint"]["x"] = anchor_point_e.get("ScaleX", 0)
		data["anchorPoint"]["y"] = anchor_point_e.get("ScaleY", 0)
		color_e = e.find("CColor")
		data["color"] = {}
		data["color"]["a"] = color_e.get("A", 255)
		data["color"]["r"] = color_e.get("R", 255)
		data["color"]["g"] = color_e.get("G", 255)
		data["color"]["b"] = color_e.get("B", 255)
		size_e = e.find("Size")
		data["contentSize"] = {}
		data["contentSize"]["width"] = size_e.get("X", 0)
		data["contentSize"]["height"] = size_e.get("Y", 0)
		file_e = e.find("FileData")
		if file_e:
			data["image"] = e.get("Path", "default.png")
		children_e = e.findall("Children/NodeObjectData")
		if children_e:
			data["children"] = [i for i in range(len(children_e))]
			for i in range(0, len(children_e)):
				child_e = children_e[i]
				data["children"][i] = {}
				self.getNodeData(child_e, data["children"][i])
	
	def printData(self, data, indent):
		self.codePrint(indent, "node = {")
		indent += 1
		self.codePrint(indent, "name = ", data["name"])
		self.codePrint(indent, "class = ", data["class"])
		self.codePrint(indent, "tag = ", data["tag"])
		self.codePrint(indent, "position = ", data["position"])
		self.codePrint(indent, "scale = ", data["scale"])
		self.codePrint(indent, "anchorPoint = ", data["anchorPoint"])
		self.codePrint(indent, "color = ", data["color"])
		self.codePrint(indent, "contentSize = ", data["contentSize"])
		if data.get("image", None):
			self.codePrint(indent, "image = ", data["image"])
		if data.get("children", None):
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