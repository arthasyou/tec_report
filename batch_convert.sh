#!/bin/bash

# 批量转换MD为PDF的函数
convert_clean_pdf() {
    local md_file="$1"
    local output_dir="$2"
    local filename=$(basename "$md_file" .md)
    
    # 创建输出目录
    mkdir -p "$output_dir"
    
    # 转换为HTML
    pandoc "$md_file" -o "$output_dir/${filename}.html" \
        --standalone \
        --css="../../../clean_style.css" \
        --metadata title=""
    
    # 转换为PDF
    "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
        --headless \
        --disable-gpu \
        --print-to-pdf="$output_dir/${filename}.pdf" \
        --no-margins \
        --run-all-compositor-stages-before-draw \
        --virtual-time-budget=3000 \
        "$output_dir/${filename}.html"
    
    # 删除HTML
    rm "$output_dir/${filename}.html"
    
    echo "转换完成: $output_dir/${filename}.pdf"
}

# 转换所有文件
convert_clean_pdf "04-可行性评估.md" "PDF版本"

# 技术实施细节方案
convert_clean_pdf "1-技术实施细节方案/01-服务端实施方案/01-服务端规划.md" "PDF版本/1-技术实施细节方案/01-服务端实施方案"
convert_clean_pdf "1-技术实施细节方案/01-服务端实施方案/02-服务端实施方案.md" "PDF版本/1-技术实施细节方案/01-服务端实施方案"
convert_clean_pdf "1-技术实施细节方案/02-前端实施方案/01-前端规划.md" "PDF版本/1-技术实施细节方案/02-前端实施方案"
convert_clean_pdf "1-技术实施细节方案/02-前端实施方案/02-前端实施方案.md" "PDF版本/1-技术实施细节方案/02-前端实施方案"
convert_clean_pdf "1-技术实施细节方案/03-运维实施方案/01-运维规划.md" "PDF版本/1-技术实施细节方案/03-运维实施方案"
convert_clean_pdf "1-技术实施细节方案/03-运维实施方案/02-运维实施方案.md" "PDF版本/1-技术实施细节方案/03-运维实施方案"

# 职责与人员结构 - 只转换关键文件
convert_clean_pdf "2-职责与人员结构/01-人员职责总规划.md" "PDF版本/2-职责与人员结构"

# 执行与落地机制 - 只转换关键文件
convert_clean_pdf "3-执行与落地机制/01-规划.md" "PDF版本/3-执行与落地机制"

echo "所有PDF转换完成！"