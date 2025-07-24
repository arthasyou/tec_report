#!/bin/bash

# 创建PDF目录结构
mkdir -p "PDF版本/1-技术实施细节方案/01-服务端实施方案"
mkdir -p "PDF版本/1-技术实施细节方案/02-前端实施方案"
mkdir -p "PDF版本/1-技术实施细节方案/03-运维实施方案"
mkdir -p "PDF版本/2-职责与人员结构"
mkdir -p "PDF版本/3-执行与落地机制"

# 转换函数
convert_md_to_pdf() {
    local md_file="$1"
    local pdf_file="$2"
    
    # 先转换为HTML
    pandoc "$md_file" -o "${pdf_file%.pdf}.html" -s --css=github-markdown.css
    
    # 使用Chrome转换为PDF
    "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
        --headless \
        --disable-gpu \
        --print-to-pdf="$pdf_file" \
        --print-to-pdf-no-header \
        --run-all-compositor-stages-before-draw \
        --virtual-time-budget=1000 \
        "${pdf_file%.pdf}.html"
    
    # 删除临时HTML文件
    rm "${pdf_file%.pdf}.html"
}

# 转换根目录文件
convert_md_to_pdf "00-总方案.md" "PDF版本/00-总方案.pdf"
convert_md_to_pdf "04-可行性评估.md" "PDF版本/04-可行性评估.pdf"

# 转换技术实施细节方案
convert_md_to_pdf "1-技术实施细节方案/01-服务端实施方案/01-服务端规划.md" "PDF版本/1-技术实施细节方案/01-服务端实施方案/01-服务端规划.pdf"
convert_md_to_pdf "1-技术实施细节方案/01-服务端实施方案/02-服务端实施方案.md" "PDF版本/1-技术实施细节方案/01-服务端实施方案/02-服务端实施方案.pdf"
convert_md_to_pdf "1-技术实施细节方案/02-前端实施方案/01-前端规划.md" "PDF版本/1-技术实施细节方案/02-前端实施方案/01-前端规划.pdf"
convert_md_to_pdf "1-技术实施细节方案/02-前端实施方案/02-前端实施方案.md" "PDF版本/1-技术实施细节方案/02-前端实施方案/02-前端实施方案.pdf"
convert_md_to_pdf "1-技术实施细节方案/03-运维实施方案/01-运维规划.md" "PDF版本/1-技术实施细节方案/03-运维实施方案/01-运维规划.pdf"
convert_md_to_pdf "1-技术实施细节方案/03-运维实施方案/02-运维实施方案.md" "PDF版本/1-技术实施细节方案/03-运维实施方案/02-运维实施方案.pdf"
convert_md_to_pdf "1-技术实施细节方案/04-自动化工具规划.md" "PDF版本/1-技术实施细节方案/04-自动化工具规划.pdf"
convert_md_to_pdf "1-技术实施细节方案/05代码重构与工具库提取指南.md" "PDF版本/1-技术实施细节方案/05代码重构与工具库提取指南.pdf"

# 转换职责与人员结构
convert_md_to_pdf "2-职责与人员结构/01-人员职责总规划.md" "PDF版本/2-职责与人员结构/01-人员职责总规划.pdf"
convert_md_to_pdf "2-职责与人员结构/02-cto职责.md" "PDF版本/2-职责与人员结构/02-cto职责.pdf"
convert_md_to_pdf "2-职责与人员结构/03-服务端主程职责.md" "PDF版本/2-职责与人员结构/03-服务端主程职责.pdf"
convert_md_to_pdf "2-职责与人员结构/04-前端主程序职责.md" "PDF版本/2-职责与人员结构/04-前端主程序职责.pdf"
convert_md_to_pdf "2-职责与人员结构/05-普通程序员职责.md" "PDF版本/2-职责与人员结构/05-普通程序员职责.pdf"
convert_md_to_pdf "2-职责与人员结构/06-运维职责.md" "PDF版本/2-职责与人员结构/06-运维职责.pdf"
convert_md_to_pdf "2-职责与人员结构/07-测试人员职责.md" "PDF版本/2-职责与人员结构/07-测试人员职责.pdf"
convert_md_to_pdf "2-职责与人员结构/08-产品经理职责.md" "PDF版本/2-职责与人员结构/08-产品经理职责.pdf"

# 转换执行与落地机制
convert_md_to_pdf "3-执行与落地机制/01-规划.md" "PDF版本/3-执行与落地机制/01-规划.pdf"
convert_md_to_pdf "3-执行与落地机制/02-强制执行规范机制.md" "PDF版本/3-执行与落地机制/02-强制执行规范机制.pdf"
convert_md_to_pdf "3-执行与落地机制/03.Code_Review_标准化.md" "PDF版本/3-执行与落地机制/03.Code_Review_标准化.pdf"
convert_md_to_pdf "3-执行与落地机制/04-自动化工具保障执行.md" "PDF版本/3-执行与落地机制/04-自动化工具保障执行.pdf"
convert_md_to_pdf "3-执行与落地机制/05-文档与示例支撑.md" "PDF版本/3-执行与落地机制/05-文档与示例支撑.pdf"
convert_md_to_pdf "3-执行与落地机制/06-培训与文化建设.md" "PDF版本/3-执行与落地机制/06-培训与文化建设.pdf"
convert_md_to_pdf "3-执行与落地机制/07-持续优化与反馈机制.md" "PDF版本/3-执行与落地机制/07-持续优化与反馈机制.pdf"
convert_md_to_pdf "3-执行与落地机制/08-补充说明.md" "PDF版本/3-执行与落地机制/08-补充说明.pdf"

echo "PDF转换完成！"