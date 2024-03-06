#!/bin/bash
echo -n "Lines of Swift code:"
cat `find . -name "*.swift"` | wc -l
