# Component Library

Product-specific component / interaction / motion / style implementations,
collected for cross-product reference. Distinct from `ui-naming-dictionary.md`,
which is a naming lookup table only — this file records how something was
actually built, with enough detail to port the pattern elsewhere.

## How To Use

- Browsing for inspiration → scan by product, then by component name.
- Porting a pattern → read the "要点" bullets, then open the referenced file
  for the real implementation.
- Adding an entry → one entry per component, grouped under its product.
  Keep entries short: scenario, interaction summary, file path, 2-4 key
  design decisions worth remembering (not a full code dump).

---

## jiekou (JieKou.AI)

### 定位轴 (Scroll-spy Axis)
- 场景：定价页右侧滚动定位，跨 LLM/图像/视频/音频/嵌入等多个 tab 复用
- 交互：左对齐横线指示器（非完整目录面板），横线左缘锚定表格右缘、hover/选中
  时向右延伸；当前激活项的闪烁蓝点在横线右侧；hover/滑动单条弹出可点击的厂商名
  标签（显示在轴左侧）+ 整条轴连续热区（按鼠标 Y 坐标找最近项，命中区首尾相连无断点）
- 文件：`src/components/ui/table-of-contents.tsx` +
  `src/app/pricing/hooks/usePricingTocLeft.ts`
- 要点：
  - 轴左对齐、向右延伸时，锚定的是「左缘」而非到视口右边的距离：轴左缘 =
    容器内容区右缘 + gap(8px)。内容区右缘要用 `getComputedStyle` 读 padding-right
    从 getBoundingClientRect 的 border-box 右缘还原——比固定 buffer 外推更准，
    各断点 padding 不同（pricing_container 16/80/0、console 24）时轴始终贴着可见表格
  - 定位用运行时测量（ResizeObserver + getBoundingClientRect + useLayoutEffect），
    替代写死的断点公式，自动适配所有宽度与 console 模式
  - hover 变宽等视觉反馈要和「最近项判定」共用同一个状态源（这里用 JS 的
    isHovered），不要让其中一个效果留在原生 CSS :hover——命中区一旦紧凑，
    两套状态在边界上会不同步，表现为闪烁
  - 滞后带（hysteresis）：新候选要比当前项明显更近才切换，防止中点抖动
  - 左右对齐翻转靠 flex `align-items`/`justify-content`（flex-end↔flex-start）+
    DOM 顺序（dot 相对横线的前后），定位 prop 相应从 right 切 left
