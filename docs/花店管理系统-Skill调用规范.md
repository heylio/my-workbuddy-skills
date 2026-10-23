# 花店管理系统 Skills 调用规范

> 适用项目：Spring Boot 后端 + Vue 前端；数据库尚未确定；目标是从项目初始化到业务开发、测试、维护全程使用 AI 辅助。
>
> 本文是项目级路由规范。Skill 本身是指导文档，不是运行时权限系统；只有当 WorkBuddy/Agent 的配置或上层提示明确遵守本规范时，阶段限制才会生效。

## 1. 总原则

1. 每项任务先判断当前阶段，再只启用该阶段允许的 Skills；默认最多同时启用 3 个，确有跨领域任务时说明原因。
2. Skills 不是越多越好。禁止为了“都用上”而加载无关 Skills。
3. 需求、数据模型、接口契约和验收标准优先于代码生成；不得跳过前置产物直接大规模编码。
4. 数据库尚未决定前，不允许任何 Skill 将 MySQL/PostgreSQL/SQLite 作为已确定事实写入最终架构或初始化配置。
5. 现有仓库、用户明确决定和项目文档优先于 Skill 的默认值；发生冲突时先指出冲突，不自行覆盖。
6. 一个阶段完成后，只有满足退出条件才进入下一阶段。跨阶段修改需重新启用对应阶段 Skill。
7. 所有改动均需说明验证情况；未运行的测试不得标记为通过。

## 2. 阶段与 Skill 白名单

| 阶段 | 目标 | 允许调用的 Skills | 禁止/限制 |
|---|---|---|---|
| 0. 需求发现 | 确定角色、业务范围、流程、边界 | `spec-writer`、`anti-over-engineering` | 不调用脚手架，不直接批量生成业务代码；UI Skill 仅在需要厘清页面/流程时启用 |
| 1. 原型与交互 | 明确页面清单、导航、关键操作与状态 | `frontend-ui-prototype`、`frontend-design`、`frontend-design-review`、`spec-writer` | 不做真实后端实现；不确定的业务规则必须标注待确认 |
| 2. 数据与接口设计 | 形成数据模型、约束、API 契约 | `Skill Foundry (Forge)`（目录：`database-schema-designer`）、`spec-writer`、`anti-over-engineering` | 数据库未定时只产出逻辑模型/候选方案，不产出假定数据库为最终定案的配置 |
| 3. 技术选型与初始化 | 确定 Java/Spring Boot、Vue、构建工具、数据库后初始化仓库 | `spring-scaffold`、`java-development`、`Skill Foundry (Forge)`（目录：`database-schema-designer`） | 初始化前必须记录技术决策；不允许未经确认引入微服务、消息队列、缓存等基础设施 |
| 4. 后端业务开发 | 实现 API、服务逻辑、事务、持久层、权限与校验 | `java-development`、`spec-writer`、`Skill Foundry (Forge)`（目录：`database-schema-designer`）（仅涉及 schema/迁移时） | 不调用前端视觉 Skill；不改变已确认 API/数据模型而不更新规格 |
| 5. 前端业务开发 | 实现 Vue 页面、表单、列表、交互和接口对接 | `frontend-design`、`frontend-ui-prototype`（仅原型未完成时）、`frontend-design-review` | 不直接修改后端业务规则或数据库模型；接口不匹配时回到接口契约修订 |
| 6. 测试与验收 | 验证单元、集成和关键用户流程 | `playwright-e2e-testing`、`java-development`、`frontend-design-review` | 不以 E2E 测试替代后端单元/集成测试；修复代码时切换到对应开发 Skill |
| 7. 代码审查与重构 | 控制风险、消除坏味道、保持简单 | `safe-refactor`、`anti-over-engineering`、`java-development`、`frontend-design-review` | 未经要求不做大范围重构；重构前确认测试基线，重构后重跑受影响测试 |
| 8. 发布与维护 | 配置、故障定位、修复与回归 | `java-development`、`playwright-e2e-testing`（影响关键流程时）、`safe-refactor`（仅重构时） | 不在未授权情况下执行破坏性迁移、删除数据、生产发布或密钥轮换 |

## 3. 跨阶段调用规则

- **需求变更**：回到阶段 0 更新规格；如果影响页面，再走阶段 1；影响数据/API 时再走阶段 2。
- **表结构变更**：必须调用 `Skill Foundry (Forge)`（目录：`database-schema-designer`），更新迁移方案和相关测试，再进入后端实现。
- **新增后端业务**：默认 `java-development`；涉及需求澄清时可加 `spec-writer`；涉及数据模型时可加 `Skill Foundry (Forge)`（目录：`database-schema-designer`）。
- **新增页面**：默认 `frontend-design`；流程未明确时先用 `frontend-ui-prototype`。
- **修改既有代码**：若只是小型业务修复，使用对应开发 Skill；只有目标确实是改善结构时才调用 `safe-refactor`。
- **测试失败**：先定位失败属于业务、接口、数据、UI 还是测试环境，再调用对应 Skill；不得无差别加载所有 Skills。
- **复杂度争议**：仅在存在多个可行方案或出现过度抽象风险时调用 `anti-over-engineering`。

## 4. 当前 Skill 清单

### 已有 Skills（9 个）
- `frontend-ui-prototype`
- `frontend-design`
- `frontend-design-review`
- `Skill Foundry (Forge)`（目录：`database-schema-designer`）
- `spec-writer`
- `spring-scaffold`
- `playwright-e2e-testing`
- `anti-over-engineering`
- `safe-refactor`

### 新增 Skill（第 10 个）
- `java-development`：Spring Boot 后端持续开发、测试与维护。它是初始化 Skill 的补充，不直接替代 `spring-scaffold`。

## 5. 阶段完成的最低门槛

- 阶段 0：需求范围、用户角色、主要流程、业务术语、待确认事项和验收标准已记录。
- 阶段 1：页面清单、关键状态、表单校验、导航和空/错/加载状态已说明。
- 阶段 2：实体关系、字段含义、关键约束、索引候选、API 契约和待决数据库事项已记录。
- 阶段 3：技术决策有记录；项目能安装依赖、编译启动；环境配置与密钥未提交。
- 阶段 4：业务逻辑、服务端校验、事务边界、异常处理和相关测试已实现。
- 阶段 5：页面能对接接口，包含加载、空数据、错误、校验和成功反馈。
- 阶段 6：关键路径有自动化或可复现的测试结果；失败项有明确处理结论。
- 阶段 7：重构前后验证结果可比较，公共接口和数据兼容影响已说明。
- 阶段 8：部署/迁移步骤、回滚或恢复考虑、日志与健康检查已说明；生产操作须获用户授权。

## 6. 每次任务的 AI 开始模板

开始任务时，先输出以下信息，简洁即可：

- 当前阶段：
- 任务目标：
- 允许调用的 Skills：
- 本次明确不调用的 Skills：
- 需要读取的前置文档：
- 完成条件与验证方式：

如果任务跨越多个阶段，先说明跨阶段原因，再按依赖顺序执行，不能借跨阶段名义绕过审批或验收门槛。
