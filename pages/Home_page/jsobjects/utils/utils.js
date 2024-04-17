export default {
	selectedTask: undefined,

	showCompleted: true,
	
	listState: 'today',
	
	setListState: (listState) => {
		this.listState = listState;
	},

	setSelectedTask: (task) => {
		this.selectedTask = task;
	},

	toggleShowCompleted: () => {
		this.showCompleted = !this.showCompleted;
	},

	getTodaysTasks: async () => {
		const allTasks = await getAllTasks.run();
		const today = new Date().toISOString().slice(0, 10); // Extract YYYY-MM-DD part
		const todaysTasks = allTasks.filter((task) => task.created_at.startsWith(today));

		const incompleteTasks = todaysTasks.filter(t => t.is_complete === false);
		
		// Sort the todaysTasks array by the 'created_at' date in descending order
		incompleteTasks.sort((a, b) => b.created_at.localeCompare(a.created_at));
		return incompleteTasks
	},

	getPendingTasks: async () => {
		const allTasks = await getAllTasks.run();
		const pendingTasks = allTasks.filter((task) => !task.is_complete);
		
		const incompletePendingTasks = pendingTasks.filter(t => t.is_complete === false);
		
		incompletePendingTasks.sort((a, b) => a.id - b.id);
		return incompletePendingTasks
	},

	getCompletedTasks: async () => {
		const allTasks = await getAllTasks.run();
		const completedTasks = allTasks.filter((task) => task.is_complete);
		completedTasks.sort((a, b) => b.id - a.id);
		return completedTasks
	},

	getOverdueTasks: async () => {
		const allTasks = await getAllTasks.run();
		const today = new Date().toISOString().slice(0, 10); // Extract YYYY-MM-DD part
		const overdueTasks = allTasks.filter((task) => task.deadline > today);
		
		const incompleteOverdueTasks = overdueTasks.filter(t => t.is_complete === false);
		
		incompleteOverdueTasks.sort((a, b) => a.id - b.id);
		return incompleteOverdueTasks;
	},
	
  addTask: async () => {
		await createTask.run();
		await this.getTodaysTasks();
		await this.getPendingTasks();
		await this.getCompletedTasks();
		await this.getOverdueTasks();
		
		closeModal('mdl_editTask');
		
		showAlert('Task Created!', 'success');
	},
	
	  updateTask: async () => {
		await updateTask.run();
		await this.getTodaysTasks();
		await this.getPendingTasks();
		await this.getCompletedTasks();
		await this.getOverdueTasks();
		
		closeModal('mdl_editTask');
		
		showAlert('Task Updated!', 'success');
	},

}