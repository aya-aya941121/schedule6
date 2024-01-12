class SchedulesController < ApplicationController
    def index
      @schedules = Schedule.all
    end
   
    def show
        @schedule = Schedule.find(params[:id])
    end

    def new
        @schedule = Schedule.new
    end

    def create
        @schedule = Schedule.new(schedule_params)
        if @schedule.save
          redirect_to schedule_path(@schedule), notice: 'スケジュールが作成されました。'
        else
          render :new
        end
      
        puts @schedule.inspect # デバッグ用の出力  
    end

    def edit
        @schedule = Schedule.find(params[:id])
    end

    def update
        @schedule = Schedule.find(params[:id])
        if @schedule.update(schedule_params)
            redirect_to schedule_path(@schedule), notice: 'スケジュールが更新されました。'
        else
            render :edit
        end
    end

    def destroy
        @schedule = Schedule.find(params[:id])
        logger.debug @schedule.inspect
      
        if @schedule.destroy
          redirect_to schedules_path, notice: 'スケジュールが削除されました。'
        else
          redirect_to schedules_path, alert: 'スケジュールの削除に失敗しました。'
        end
      end

    private

    def schedule_params
        params.require(:schedule).permit(:title, :start_date, :end_date, :all_day, :memo)
    end

end
    