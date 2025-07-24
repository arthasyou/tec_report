#!/bin/bash

# 只转换总方案的脚本
convert_single() {
    local md_file="$1"
    local output_dir="$2"
    local filename=$(basename "$md_file" .md)
    
    mkdir -p "$output_dir"
    
    # 转换为HTML
    pandoc "$md_file" -o "$output_dir/${filename}.html" \
        --standalone \
        --css="../clean_style.css" \
        --metadata title=""
    
    # 使用WeasyPrint生成PDF
    cd "$output_dir"
    weasyprint "${filename}.html" "${filename}.pdf" 2>/dev/null
    cd - > /dev/null
    
    # 清理HTML文件
    rm "$output_dir/${filename}.html"
    
    echo "✅ 转换完成: $output_dir/${filename}.pdf"
}

echo "🔄 开始转换总方案PDF..."

# 只转换总方案
convert_single "00-PDF文档目录.md" "PDF"

echo "🎉 总方案PDF转换完成！"