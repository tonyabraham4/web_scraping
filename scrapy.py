# -*- coding: utf-8 -*-
"""
Created on Sun Jul 28 00:32:31 2019

@author: firebolt
"""

import re
import textract
from itertools import chain
from scrapy.linkextractors import LinkExtractor
from scrapy.spiders import CrawlSpider, Rule
from tempfile import NamedTemporaryFile
control_chars = ''.join(map(chr, chain(range(0, 9), range(11, 32), range(127, 160))))
CONTROL_CHAR_RE = re.compile('[%s]' % re.escape(control_chars))
TEXTRACT_EXTENSIONS = [".pdf", ".doc", ".docx", ""]
class CustomLinkExtractor(LinkExtractor):
    def __init__(self, *args, **kwargs):
        super(CustomLinkExtractor, self).__init__(*args, **kwargs)
        # Keep the default values in "deny_extensions" *except* for those types we want.
        self.deny_extensions = [ext for ext in self.deny_extensions if ext not in TEXTRACT_EXTENSIONS]
 