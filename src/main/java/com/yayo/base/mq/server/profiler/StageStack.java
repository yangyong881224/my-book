package com.yayo.base.mq.server.profiler;

import com.google.common.base.Joiner;
import lombok.Data;

import java.util.*;
import java.util.concurrent.TimeUnit;

@Data
public class StageStack {

    /**
     * 阶段栈
     */
    private List<Stage> stages;

    /**
     * 无参构造函数，初始化stages
     */
    StageStack() {
        this.stages = new ArrayList<>();
    }

    /**
     * 新阶段放到数组尾
     *
     * @param stage 执行阶段
     */
    public void push(Stage stage) {
        stages.add(stage);
    }

    /**
     * 从阶段栈顶开始取未结束的阶段
     *
     * @return 最新放入并且未结束的阶段
     */
    private Stage peekUnreleasedStage() {
        if (null == stages || stages.isEmpty()) {
            return null;
        }
        ListIterator<Stage> iterator = stages.listIterator(stages.size());
        while (iterator.hasPrevious()) {
            Stage stage = iterator.previous();
            if (!stage.isReleased()) {
                return stage;
            }
        }
        return null;
    }

    /**
     * 结束最新放入阶段栈且未结束的阶段
     */
    public void release() {
        Stage stage = peekUnreleasedStage();
        if (null == stage) {
            return;
        }
        stage.release();
    }

    /**
     * 结束阶段栈中所有阶段
     */
    public void releaseAll() {
        if (null == stages || stages.isEmpty()) {
            return;
        }
        ListIterator<Stage> iterator = stages.listIterator(stages.size());
        while (iterator.hasPrevious()) {
            Stage stage = iterator.previous();
            if (!stage.isReleased()) {
                stage.release();
            }
        }
    }

    @SuppressWarnings("StringBufferReplaceableByString")
    public String dump(boolean allDump) {
        if (null == stages || stages.isEmpty()) {
            return "{UNRECORDED}";
        }

        Map<String, String> stageMap = new LinkedHashMap<>(stages.size());
        for (int counter = 0, size = stages.size(); counter < size; counter++) {
            Stage stage = stages.get(counter);
            if (!allDump && !stage.isReleased()) {
                continue;
            }
            String stageKey = new StringBuilder().append(counter).append("-").append(stage.getIdentifier()).toString();
            String stageValue = stage.isReleased() ? String.valueOf(stage.getStopwatch().elapsed(TimeUnit.MILLISECONDS)) : "unreleased";
            stageMap.put(stageKey, stageValue);
        }

        return new StringBuilder("{").append(Joiner.on("|").withKeyValueSeparator(":").join(stageMap)).append("}").toString();
    }
}
