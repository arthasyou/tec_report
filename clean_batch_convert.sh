#!/bin/bash

# 使用WeasyPrint生成完全干净的PDF
clean_convert() {
    local md_file="$1"
    local output_dir="$2"
    local filename=$(basename "$md_file" .md)
    
    mkdir -p "$output_dir"
    
    # 转换为HTML
    pandoc "$md_file" -o "$output_dir/${filename}.html" \
        --standalone \
        --css="clean_style.css" \
        --metadata title=""
    
    # 复制CSS文件到输出目录
    cp clean_style.css "$output_dir/"
    
    # 使用WeasyPrint生成PDF
    cd "$output_dir"
    weasyprint "${filename}.html" "${filename}.pdf" 2>/dev/null
    cd - > /dev/null
    
    # 清理文件
    rm "$output_dir/${filename}.html"
    rm "$output_dir/clean_style.css" 2>/dev/null
    
    echo "✅ 转换完成: $output_dir/${filename}.pdf"
}

# 删除旧文件
find "PDF版本" -name "*.pdf" -delete
rm "PDF版本/clean_style.css" 2>/dev/null

echo "🔄 开始重新生成干净的PDF文件..."

# 转换主要文件
clean_convert "04-可行性评估.md" "PDF版本"

# 技术实施细节方案
clean_convert "1-技术实施细节方案/01-服务端实施方案/01-服务端规划.md" "PDF版本/1-技术实施细节方案/01-服务端实施方案"
clean_convert "1-技术实施细节方案/01-服务端实施方案/02-服务端实施方案.md" "PDF版本/1-技术实施细节方案/01-服务端实施方案"
clean_convert "1-技术实施细节方案/02-前端实施方案/01-前端规划.md" "PDF版本/1-技术实施细节方案/02-前端实施方案"
clean_convert "1-技术实施细节方案/02-前端实施方案/02-前端实施方案.md" "PDF版本/1-技术实施细节方案/02-前端实施方案"
clean_convert "1-技术实施细节方案/03-运维实施方案/01-运维规划.md" "PDF版本/1-技术实施细节方案/03-运维实施方案"
clean_convert "1-技术实施细节方案/03-运维实施方案/02-运维实施方案.md" "PDF版本/1-技术实施细节方案/03-运维实施方案"

# 职责与人员结构
clean_convert "2-职责与人员结构/01-人员职责总规划.md" "PDF版本/2-职责与人员结构"

# 执行与落地机制  
clean_convert "3-执行与落地机制/01-规划.md" "PDF版本/3-执行与落地机制"

# 最后生成PDF目录
clean_convert "PDF版本/00-PDF文档目录.md" "PDF版本"

echo "🎉 所有PDF转换完成！现在是完全干净的格式，无页眉页脚！"