package com.yayo.base.mq.server.profiler;

/**
 * 程序执行阶段分析，用来计算每阶段执行耗时，查看串行执行链
 * <p>
 * 在具体逻辑里：
 * <pre>
 * Profiler.record("stage1");
 * try{
 *      doSomething();
 * } finally{
 *      Profiler.release();
 * }
 * </pre>
 * <p>
 * 在入口处(RPC接口，Controller接口，需要查看执行链级每阶段耗时的地方)：
 * <pre>
 * Profiler.record("stage1");
 * try{
 *      doSomething();
 * } finally{
 *      Profiler.release();
 *      Profiler.releaseAll();
 *      String dump = Profiler.dump(true);
 *      Profiler.reset();
 * }
 * </pre>
 * 会得到dump结构:
 * Profiler{{0 - cart.facade.render - 16.13 ms} => {1 - cart.process.render - 15.96 ms} => {2 - cart.node.common.cart.validation - 43.39 μs} => {3 - cart.node.common.cart.config-init - 41.50 μs} => {4 - cart.node.render.cart.query - 10.24 ms} => {5 - cart.node.render.cart.state-reappear - 93.04 μs} => {6 - cart.node.render.item.query - 1.374 ms} => {7 - cart.node.render.item.invalid - 28.34 μs} => {8 - cart.node.render.shop.query - 388.0 μs} => {9 - cart.node.render.promotion.query - 503.6 μs} => {10 - cart.node.render.coupon.query - 401.1 μs} => {11 - cart.node.render.inventory.query - 2.419 ms} => {12 - cart.node.render.inventory.shortage - 8.066 μs}}
 *
 */
public final class Profiler {

    private static final ThreadLocal<StageStack> STAGE_RECORDER = new ThreadLocal<>();

    /**
     * 记录一个阶段，也是一个阶段的开始
     *
     * @param message 阶段描述，标识阶段
     */
    public static void record(String message) {
        StageStack stageStack = STAGE_RECORDER.get();
        if (null == stageStack) {
            stageStack = new StageStack();
            Stage stage = new Stage(message);
            stageStack.push(stage);
            STAGE_RECORDER.set(stageStack);
        } else {
            Stage stage = new Stage(message);
            stageStack.push(stage);
        }
    }

    /**
     * 结束最近添加未结束的阶段
     */
    public static void release() {
        StageStack stageStack = STAGE_RECORDER.get();
        if (null == stageStack) {
            return;
        }
        stageStack.release();
    }

    public static void releaseAll() {
        StageStack stageStack = STAGE_RECORDER.get();
        if (null == stageStack) {
            return;
        }
        stageStack.releaseAll();
    }

    public static void reset() {
        releaseAll();
        STAGE_RECORDER.remove();
    }

    public static String dump() {
        return dump(true);
    }

    public static String dump(boolean allDump) {
        StageStack stageStack = STAGE_RECORDER.get();
        if (null == stageStack) {
            return "{UNRECORDED}";
        } else {
            return stageStack.dump(allDump);
        }
    }
}
