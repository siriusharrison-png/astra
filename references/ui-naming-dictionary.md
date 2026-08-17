# UI Naming Dictionary

A lookup table of standard UI component names (English / Chinese + framework terms).

## Why This Exists

The cheapest error to remove between design and implementation is naming ambiguity.
When directing an AI coding agent, a precise component name ("Popover") beats a vague
description ("that little window"). This dictionary is the reference data; the usage
rule lives in `patterns.md` → Precise UI Naming Pattern.

## How To Use

- **Reverse lookup** — you see a UI element but don't know its name → find it here → use the standard name with the agent.
- **Forward spec/prompt** — writing a spec or prompt → replace vague words with the standard name (e.g. "the dropdown thing" → `Combobox` vs `Dropdown Menu`, which this table distinguishes).
- **Cross-framework** — moving between Web and macOS → use the framework-term column (`Popover` → `NSPopover`).

## Source & Maintenance

- Source: https://learnui.qiaomu.ai/ (Learn UI Name)
- Last synced: 2026-08-17
- This table grows. When adding a term, keep the same columns and category grouping. Note new sync dates above.

---

## Web Components

| English (Standard Name) | 中文 |
|---|---|
| Text Scramble (Decode Effect) | 文本乱序（Decode 效果） |
| Spring Animation | 弹簧动画 |
| Easing (Timing Function) | 缓动（Timing Function） |
| Masonry Layout (Pinterest Grid) | 瀑布流布局 |
| Bento Grid | 便当网格 |
| Hamburger Menu (Nav Drawer) | 汉堡菜单（导航抽屉） |
| Lightbox | 灯箱 |
| Marquee | 跑马灯 |
| Form Field | 表单字段 |
| Truncation (Ellipsis & Line Clamp) | 文本截断 |
| Drag & Drop | 拖放 |
| Divider vs. Separator vs. Rule | 分隔线 |
| Progress Ring vs. Spinner vs. Progress Bar | 进度环 / Spinner / 进度条 |
| The Three Dots (Overflow Menu) | 三个点（溢出菜单） |
| Toast (Snackbar) | 轻提示 |
| Modal Dialog vs. Drawer vs. Sheet | 模态对话框 / 抽屉 / 底部面板 |
| Popover vs. Dropdown Menu vs. Tooltip | 弹出框 / 下拉菜单 / 工具提示 |
| Scrim (Backdrop / Overlay) | 遮罩层 |
| Skeleton vs. Spinner | 骨架屏 / 旋转指示器 |
| Combobox (Autocomplete / Typeahead) | 组合框（自动补全） |
| Command Palette | 命令面板 |
| Accordion (Disclosure) | 手风琴 |
| Tabs | 标签页 |
| Badge vs. Chip vs. Pill vs. Tag | 徽标 / 碎片 / 胶囊 / 标签 |
| Breadcrumbs | 面包屑导航 |
| Sticky vs. Fixed Positioning | 粘性定位 / 固定定位 |
| Focus Ring (:focus-visible) | 焦点环 |
| Empty State | 空状态 |
| Hover Card | 悬停卡片 |
| Switch vs. Checkbox vs. Radio | 开关 / 复选框 / 单选按钮 |
| Toggle Group (Segmented Control) | 切换组 |

## macOS Components

| English (Standard Name) | 中文 | Framework Term (AppKit / SwiftUI) |
|---|---|---|
| Pointer (Cursor) | 指针（光标） | NSCursor |
| Alert | 提醒 | NSAlert |
| Slider | 滑块 | NSSlider |
| Color Well | 颜色井 | NSColorWell |
| Mac Window | Mac 窗口 | NSWindow |
| Split View | 拆分视图 | NSSplitView |
| Scroll View (Scroller) | 滚动视图 | NSScrollView |
| Search Field | 搜索栏 | NSSearchField |
| Save Panel | 存储面板 | NSSavePanel |
| Token Field | 令牌输入框 | NSTokenField |
| Combo Button | 组合按钮 | NSComboButton |
| Level Indicator | 级别指示器 | NSLevelIndicator |
| Column View (Browser) | 分栏视图 | NSBrowser |
| Outline View | 大纲视图 | NSOutlineView |
| Menu Bar | 菜单栏 | NSApp.mainMenu |
| Context Menu | 上下文菜单 | NSMenu |
| Disclosure Triangle | 披露三角 | NSOutlineView |
| Dock Badge | Dock 角标 | NSDockTile.badgeLabel |
| Focus Ring | 焦点环 | NSView.focusRingType |
| Inspector | 检查器 | View.inspector |
| Panel (Floating Window / HUD) | 面板 | NSPanel |
| Popover | 弹出框 | NSPopover |
| Pop-Up Button vs. Pull-Down Button vs. Combo Box | 弹出式 / 下拉式按钮 / 组合框 | NSPopUpButton |
| Segmented Control | 分段控件 | NSSegmentedControl |
| Sheet | 窗口附着面板 | NSWindow.beginSheet |
| Sidebar (Source List) | 边栏 | NavigationSplitView |
| Stepper | 步进器 | NSStepper |
| Toolbar (Unified Title Bar) | 工具栏 | NSToolbar |
| Traffic Lights (Window Controls) | 红绿灯按钮 | NSWindow.standardWindowButton |
| Visual Effect Material (Vibrancy) | 视觉效果材质 | NSVisualEffectView |
| Menu Bar Extra (Status Item) | 菜单栏附加项 | NSStatusItem |
